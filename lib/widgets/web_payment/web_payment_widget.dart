import 'dart:async';
import 'dart:math';

import 'dart:developer' as dev;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:midtrans_dart_client/models/request/transaction_request.dart';
import 'package:midtrans_dart_client/models/response/core/transaction_status_response.dart';

import 'config.dart';

class WebPaymentWidget extends StatefulWidget {
  const WebPaymentWidget({
    super.key,
    this.onSettlement,
    this.onExpire,
    this.onCancel,
  });

  final Function(TransactionStatusResponse)? onSettlement;
  final Function(TransactionStatusResponse)? onExpire;
  final Function(TransactionStatusResponse)? onCancel;

  @override
  State<WebPaymentWidget> createState() => _WebPaymentWidgetState();
}

class _WebPaymentWidgetState extends State<WebPaymentWidget> {
  String? url;
  String orderId = 'order-${Random().nextInt(1000)}';
  final TokenController _tokenController = TokenController();
  final GlobalKey webViewKey = GlobalKey();
  late final Timer? timer;

  InAppWebViewController? webViewController;
  InAppWebViewSettings settings = InAppWebViewSettings(
    isInspectable: kDebugMode,
    mediaPlaybackRequiresUserGesture: false,
    allowsInlineMediaPlayback: true,
    iframeAllow: "camera; microphone",
    iframeAllowFullscreen: true,
  );

  PullToRefreshController? pullToRefreshController;
  double progress = 0;
  final urlController = TextEditingController();

  @override
  void initState() {
    _tokenController
        .getSnapUrl(
      TransactionRequest(
        transactionDetails: TransactionDetails(
          orderId: orderId,
          grossAmount: 20000,
        ),
        creditCard: CreditCard(
          secure: true,
        ),
      ),
    )
        .then((value) {
      setState(() {
        url = value;
        urlController.text = url ?? "";
        webViewController?.loadUrl(
            urlRequest: URLRequest(url: WebUri(value ?? "")));
      });

      timer = Timer.periodic(const Duration(seconds: 5), (timer) {
        _tokenController.getTransactionStatus(orderId).then((value) {
          dev.log('Transaction Status: ${value?.toJson()}',
              name: 'Transaction Status');

          if (value?.transactionStatus == 'settlement') {
            timer.cancel();
            if (value != null) {
              widget.onSettlement?.call(value);
            }
          } else if (value?.transactionStatus == 'cancel') {
            timer.cancel();
            if (value != null) {
              widget.onCancel?.call(value);
            }
          } else if (value?.transactionStatus == 'expire') {
            timer.cancel();
            if (value != null) {
              widget.onExpire?.call(value);
            }
          }
        });
      });
    });

    pullToRefreshController = kIsWeb ||
            ![TargetPlatform.iOS, TargetPlatform.android]
                .contains(defaultTargetPlatform)
        ? null
        : PullToRefreshController(
            settings: PullToRefreshSettings(
              color: Colors.blue,
            ),
            onRefresh: () async {
              if (defaultTargetPlatform == TargetPlatform.android) {
                webViewController?.reload();
              } else if (defaultTargetPlatform == TargetPlatform.iOS) {
                webViewController?.loadUrl(
                    urlRequest:
                        URLRequest(url: await webViewController?.getUrl()));
              }
            },
          );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).padding.top,
          ),
          Expanded(
            child: Stack(
              children: [
                InAppWebView(
                  key: webViewKey,
                  webViewEnvironment: webViewEnvironment,
                  initialUrlRequest:
                      URLRequest(url: WebUri(url ?? "about:blank")),
                  initialSettings: settings,
                  pullToRefreshController: pullToRefreshController,
                  onWebViewCreated: (controller) {
                    webViewController = controller;
                  },
                  onLoadStart: (controller, url) {
                    setState(() {
                      this.url = url.toString();
                      urlController.text = this.url ?? "";
                    });
                  },
                  onPermissionRequest: (controller, request) async {
                    return PermissionResponse(
                      resources: request.resources,
                      action: PermissionResponseAction.GRANT,
                    );
                  },
                  shouldOverrideUrlLoading:
                      (controller, navigationAction) async {
                    return NavigationActionPolicy.ALLOW;
                  },
                  onLoadStop: (controller, url) async {
                    pullToRefreshController?.endRefreshing();
                    setState(() {
                      this.url = url.toString();
                      urlController.text = this.url ?? "";
                    });
                  },
                  onReceivedError: (controller, request, error) {
                    pullToRefreshController?.endRefreshing();
                  },
                  onProgressChanged: (controller, progress) {
                    if (progress == 100) {
                      pullToRefreshController?.endRefreshing();
                    }
                    setState(() {
                      this.progress = progress / 100;
                      urlController.text = url ?? "";
                    });
                  },
                  onUpdateVisitedHistory: (controller, url, androidIsReload) {
                    setState(() {
                      this.url = url.toString();
                      urlController.text = this.url ?? "";
                    });
                  },
                  onConsoleMessage: (controller, consoleMessage) {
                    if (kDebugMode) {
                      print(consoleMessage);
                    }
                  },
                ),
                progress < 1.0
                    ? LinearProgressIndicator(value: progress)
                    : Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
