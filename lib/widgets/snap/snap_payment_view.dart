import 'dart:async';
import 'dart:math';

import 'dart:developer' as dev;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:midtrans_dart_client/midtrans_dart_client.dart';
import 'package:midtrans_dart_client/models/request/transaction_request.dart';
import 'package:midtrans_dart_client/models/response/core/transaction_status_response.dart';

import 'config.dart';

class SnapPaymentView extends StatefulWidget {
  const SnapPaymentView({
    super.key,
    this.onSettlement,
    this.onExpire,
    this.onCancel,
    this.transactionRequest,
  });

  final Function(TransactionStatusResponse)? onSettlement;
  final Function(TransactionStatusResponse)? onExpire;
  final Function(TransactionStatusResponse)? onCancel;

  final TransactionRequest? transactionRequest;

  @override
  State<SnapPaymentView> createState() => _SnapPaymentViewState();
}

class _SnapPaymentViewState extends State<SnapPaymentView> {
  String? url;

  final MidtransClient _client = MidtransClient.instance;

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
    final orderId = 'order-${Random().nextInt(100000)}';

    TransactionRequest transactionRequest = widget.transactionRequest ??
        TransactionRequest(
          transactionDetails: TransactionDetails(
            orderId: orderId,
            grossAmount: 20000,
          ),
          creditCard: CreditCard(
            secure: true,
          ),
        );

    initTransaction(transactionRequest);

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

  void initTransaction(TransactionRequest request) async {
    var result = await _client.snapRepository.getSnapToken(request);

    result.fold(
      (error) => dev.log('Error: ${error.errorMessages}', name: 'Snap Token'),
      (success) {
        setState(() {
          url = success.redirectUrl;

          urlController.text = url ?? "";

          webViewController?.loadUrl(
              urlRequest: URLRequest(url: WebUri(success.redirectUrl ?? "")));
        });

        timer = Timer.periodic(const Duration(seconds: 5), (timer) async {
          final result = await _client.coreRepository
              .getTransactionStatus(request.transactionDetails?.orderId ?? '0');

          result.fold(
            (error) => dev.log('Error: ${error.statusMessage}',
                name: 'Transaction Status'),
            (success) {
              dev.log('Transaction Status: ${success.toJson()}',
                  name: 'Transaction Status');

              if (success.transactionStatus == 'settlement') {
                timer.cancel();

                widget.onSettlement?.call(success);
              } else if (success.transactionStatus == 'cancel') {
                timer.cancel();

                widget.onCancel?.call(success);
              } else if (success.transactionStatus == 'expire') {
                timer.cancel();

                widget.onExpire?.call(success);
              }
            },
          );
        });
      },
    );
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
