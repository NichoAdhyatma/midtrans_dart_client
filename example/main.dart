import 'dart:developer';

import 'package:midtrans_dart_client/midtrans_dart_client.dart';
import 'package:midtrans_dart_client/models/request/transaction_request.dart';

void main() async {
  // Initialize the MidtransClientFlutter
  MidtransClient.initialize(
    clientKey: 'YOUR-CLIENT-KEY',
    serverKey: 'YOUR-SERVER-KEY',
    midtransEnvironment: Environments.sandbox,
  );

  // Get the instance of MidtransClientFlutter
  final client = MidtransClient.instance;

  // Get the SnapRepository
  final snapRepository = client.snapRepository;

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
