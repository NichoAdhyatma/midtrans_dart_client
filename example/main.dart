import 'dart:developer';

import 'package:midtrans_client_flutter/midtrans_client_flutter.dart';

void main() async {
  // Initialize the MidtransClientFlutter
  MidtransClientFlutter.initialize(
    clientKey: 'YOUR-CLIENT-KEY',
    serverKey: 'YOUR-SERVER-KEY',
    midtransEnvironment: Environments.sandbox,
  );

  // Get the instance of MidtransClientFlutter
  final midtransClientFlutter = MidtransClientFlutter.instance;

  // Get the SnapRepository
  final snapRepository = midtransClientFlutter.snapRepository;

  // Create a TransactionRequest
  final transactionRequest = TransactionRequest(
    transactionDetails: TransactionDetails(
      orderId: '123456',
      grossAmount: 20000,
    ),
    creditCard: CreditCard(
      secure: true,
    ),
  );

  // Get the Snap Token
  final snapToken = await snapRepository.getSnapToken(transactionRequest);

  // Handle the response
  snapToken.fold(
    // Handle the error scenario
    (error) => log('Error: ${error.errorMessages}'),

    // Handle the success scenario you can use the snapToken or redirectUrl
    (success) {
      log('Success: $success');
      log('Snap Token: ${success.token}');
      log('Redirect Url: ${success.redirectUrl}');
    },
  );

}
