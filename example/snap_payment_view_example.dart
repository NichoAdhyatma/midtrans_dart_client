import 'dart:math';

import 'package:flutter/material.dart';
import 'package:midtrans_dart_client/models/request/transaction_request.dart';
import 'package:midtrans_dart_client/widgets/snap/snap_payment_view.dart';

class WebPaymentWidgetExample extends StatelessWidget {
  const WebPaymentWidgetExample({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SnapPaymentView(
        transactionRequest: TransactionRequest(
          transactionDetails: TransactionDetails(
            orderId: 'order-${Random().nextInt(100000)}',
            grossAmount: 20000,
          ),
          creditCard: CreditCard(
            secure: true,
          ),
        ),
        onSettlement: (paymentData) {
          // Handle payment settlement
          // navigate to success page
          // SuccessPaymentPage(paymentData: paymentData);
        },
        onCancel: (paymentData) {
          // Handle payment cancel
          // navigate to cancel page
          // CancelPaymentPage(paymentData: paymentData);
        },
        onExpire: (paymentData) {
          // Handle payment expire
          // navigate to expire page
          // ExpirePaymentPage(paymentData: paymentData);
        },
      ),
    );
  }
}
