import 'package:flutter/material.dart';
import 'package:midtrans_dart_client/models/request/transaction_request.dart';
import 'package:midtrans_dart_client/utils/enums/transaction.dart';
import 'package:midtrans_dart_client/widgets/core_api_payment/core_api_payment_view.dart';

class CoreApiPaymentWidgetExample extends StatelessWidget {
  const CoreApiPaymentWidgetExample({super.key});

  @override
  Widget build(BuildContext context) {
    return CoreApiPaymentView(
      transactionRequest: TransactionRequest(
        transactionDetails: TransactionDetails(
          orderId: 'order-${DateTime.now().millisecondsSinceEpoch}',
          grossAmount: 20000,
        ),
        paymentType: PaymentType.qris.name,
        qris: Qris(
          acquirer: Acquirer.gopay.name,
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
    );
  }
}
