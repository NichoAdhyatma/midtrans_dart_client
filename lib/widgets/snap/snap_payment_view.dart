import 'dart:async';
import 'dart:math';
import 'dart:developer' as dev;
import 'package:flutter/material.dart';
import 'package:midtrans_dart_client/utils/enums/transaction.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:midtrans_dart_client/models/request/transaction_request.dart';
import 'package:midtrans_dart_client/models/response/core/transaction_status_response.dart';

import 'domain/usecases/get_snap_token.dart';
import 'domain/usecases/get_transaction_status.dart';

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
  late final WebViewController _webViewController;
  late final GetSnapTokenUseCase _getSnapToken;
  late final GetTransactionStatusUseCase _getTransactionStatus;

  String? _snapUrl;
  double _progress = 0.0;
  Timer? _pollingTimer;
  late String orderId;

  @override
  void initState() {
    super.initState();

    orderId = widget.transactionRequest?.transactionDetails?.orderId ??
        'order-${Random().nextInt(100000)}';

    final request = widget.transactionRequest ??
        TransactionRequest(
          transactionDetails: TransactionDetails(
            orderId: orderId,
            grossAmount: 20000,
          ),
          creditCard: CreditCard(secure: true),
        );

    _getSnapToken = GetSnapTokenUseCase();
    _getTransactionStatus = GetTransactionStatusUseCase();

    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (url) => setState(() => _snapUrl = url),
        onProgress: (p) => setState(() => _progress = p / 100),
      ));

    _loadSnapUrl(request);
  }

  void _loadSnapUrl(TransactionRequest request) async {
    final result = await _getSnapToken(request);
    result.fold(
          (error) {
        dev.log(error, name: "SnapPaymentView");
        _showErrorDialog(error);
      },
          (url) {
        setState(() => _snapUrl = url);

        _webViewController.loadRequest(Uri.parse(url));

        _startPolling(orderId);
      },
    );
  }

  void _startPolling(String orderId) {
    _pollingTimer?.cancel();

    _pollingTimer = Timer.periodic(const Duration(seconds: 5), (_) async {
      final result = await _getTransactionStatus(orderId);
      result.fold(
            (error) => dev.log(error, name: "Polling"),
            (status) {
          final tx = status.transactionStatus;

          if (tx == TransactionStatus.settlement.name) {
            _pollingTimer?.cancel();

            widget.onSettlement?.call(status);
          } else if (tx == TransactionStatus.cancel.name) {
            _pollingTimer?.cancel();

            widget.onCancel?.call(status);
          } else if (tx == TransactionStatus.expire.name) {
            _pollingTimer?.cancel();

            widget.onExpire?.call(status);
          }
        },
      );
    });
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Terjadi Kesalahan'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pollingTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _snapUrl == null
          ? const Center(child: CircularProgressIndicator())
          : Column(
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top),
          Expanded(
            child: Stack(
              children: [
                RefreshIndicator(
                  onRefresh: () async {
                    await _webViewController.reload();
                  },
                  child: WebViewWidget(controller: _webViewController),
                ),
                if (_progress < 1.0)
                  LinearProgressIndicator(value: _progress),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
