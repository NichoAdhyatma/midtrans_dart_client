import 'dart:async';
import 'dart:developer' as dev;
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:midtrans_dart_client/midtrans_dart_client.dart';
import 'package:midtrans_dart_client/models/request/transaction_request.dart';
import 'package:midtrans_dart_client/models/response/core/transaction_status_response.dart';
import 'package:midtrans_dart_client/utils/enums/transaction.dart';
import 'package:midtrans_dart_client/widgets/core_api/qris/qris_expiry_widget.dart';
import 'package:midtrans_dart_client/widgets/core_api/qris/qris_pending_widget.dart';
import 'package:midtrans_dart_client/widgets/core_api/qris/qris_success_widget.dart';

class QrisPaymentView extends StatefulWidget {
  const QrisPaymentView({
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
  State<QrisPaymentView> createState() => _QrisPaymentViewState();
}

class _QrisPaymentViewState extends State<QrisPaymentView> {
  final MidtransClient _client = MidtransClient.instance;

  String? _qrImageUrl;

  double? _amount;

  Timer? _getTransactionTimer;
  Timer? _expiryTimer;
  final ValueNotifier<Duration> _remainingTime = ValueNotifier(Duration.zero);

  TransactionStatus _transactionStatus = TransactionStatus.pending;

  @override
  void initState() {
    final orderId = 'order-${Random().nextInt(100000)}';

    TransactionRequest transactionRequest = widget.transactionRequest ??
        TransactionRequest(
          transactionDetails: TransactionDetails(
            orderId: orderId,
            grossAmount: 20000,
          ),
          paymentType: PaymentType.qris.name,
          qris: Qris(
            acquirer: Acquirer.gopay.name,
          ),
        );

    initializePayment(transactionRequest);

    super.initState();
  }

  void initializePayment(TransactionRequest request) async {

    if (request.transactionDetails == null ||
       (request.transactionDetails?.grossAmount ?? 0) <= 0) {
      setState(() {
        _transactionStatus = TransactionStatus.failure;
      });
      return;
    }

    final coreRepository = _client.coreRepository;

    final chargeResponse =
        await coreRepository.charge(request);

    chargeResponse.fold(
      (error) {
        setState(() {
          _transactionStatus = TransactionStatus.failure;
        });
      },
      (success) {
        if (success.actions.isNotEmpty && success.grossAmount.isNotEmpty) {
          setState(() {
            _qrImageUrl = success.actions[0].url;
            _amount = double.tryParse(success.grossAmount);
          });
          expiryTimer(success.expiryTime);
          _getTransactionTimer =
              Timer.periodic(const Duration(seconds: 5), (timer) async {
            final result = await _client.coreRepository.getTransactionStatus(
                request.transactionDetails?.orderId ?? '0');

            result.fold(
              (error) => dev.log('Error: ${error.statusMessage}',
                  name: 'Transaction Status'),
              (success) {
                dev.log('Transaction Status: ${success.toJson()}',
                    name: 'Transaction Status');

                if (success.transactionStatus ==
                    TransactionStatus.settlement.name) {
                  timer.cancel();
                  _transactionStatus = TransactionStatus.settlement;

                  widget.onSettlement?.call(success);
                } else if (success.transactionStatus ==
                    TransactionStatus.cancel.name) {
                  timer.cancel();
                  _transactionStatus = TransactionStatus.cancel;

                  widget.onCancel?.call(success);
                } else if (success.transactionStatus ==
                    TransactionStatus.expire.name) {
                  timer.cancel();
                  _transactionStatus = TransactionStatus.expire;

                  widget.onExpire?.call(success);
                }
              },
            );
          });
        } else {
          setState(() {
            _transactionStatus = TransactionStatus.failure;
          });
        }
      },
    );
  }

  void expiryTimer(String expiryTime) {
    final expiryDate = DateTime.parse(expiryTime);
    final now = DateTime.now();
    final difference = expiryDate.difference(now);

    _expiryTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (difference.isNegative) {
        _remainingTime.value = Duration.zero;
        timer.cancel();
        _transactionStatus = TransactionStatus.expire;
      } else {
        _remainingTime.value = difference;
      }
    });
  }

  @override
  void dispose() {
    _getTransactionTimer?.cancel();
    _expiryTimer?.cancel();
    _remainingTime.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          if (_transactionStatus == TransactionStatus.failure) {
            return Center(
              child: Text('Payment Failed'),
            );
          } else if (_qrImageUrl == null) {
            return Center(child: CircularProgressIndicator());
          } else if (_transactionStatus == TransactionStatus.pending) {
            return QrisPendingWidget(
              remainingTime: _remainingTime,
              qrImageUrl: _qrImageUrl ?? '',
              amount: _amount ?? 0.0,
            );
          } else if (_transactionStatus == TransactionStatus.settlement) {
            return QrisSuccessWidget();
          } else if (_transactionStatus == TransactionStatus.expire) {
            return QrisExpiryWidget();
          } else {
            return Center(
              child: Text('Unknown Status'),
            );
          }
        },
      ),
    );
  }
}
