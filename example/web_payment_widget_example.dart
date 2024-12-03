import 'package:flutter/material.dart';
import 'package:midtrans_dart_client/widgets/web_payment/web_payment_widget.dart';

class WebPaymentWidgetExample extends StatelessWidget {
  const WebPaymentWidgetExample({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: WebPaymentWidget(
        onSettlement: (paymentData) {
          // Handle payment settlement
          // navigate to success page
          // SuccessPaymentPage(paymentData: paymentData);
        },
      ),
    );
  }
}
