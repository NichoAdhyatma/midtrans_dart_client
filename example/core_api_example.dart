import 'package:midtrans_dart_client/midtrans_dart_client.dart';
import 'package:midtrans_dart_client/models/request/transaction_request.dart';
import 'package:midtrans_dart_client/utils/enums/transaction.dart';

void main() async {
  // Initialize the MidtransClientFlutter
  MidtransClient.initialize(
    clientKey: 'SB-Mid-client-SEsUppzVZ3vTtqTX',
    serverKey: 'SB-Mid-server-i5gUY_c4fK_yIOklQ6JJCrod',
    midtransEnvironment: Environments.sandbox,
  );

  // Get the instance of MidtransClient
  final client = MidtransClient.instance;

  // Get the Core Repository
  final coreRepository = client.coreRepository;

  // Create a TransactionRequest for Qris and gopay acquirer
  final transactionRequest = TransactionRequest(
    paymentType: PaymentType.qris.name,
    qris: Qris(
      acquirer: Acquirer.gopay.name,
    ),
    transactionDetails: TransactionDetails(
      orderId: 'order-${DateTime.now().millisecondsSinceEpoch}',
      grossAmount: 20000,
    ),
  );

  // Call Charge method
  final chargeResponse = await coreRepository.charge(transactionRequest);

  // Handle the response
  chargeResponse.fold(
    // Handle the error scenario
    (error) => print('Error: ${error.statusMessage}'),

    // Handle the success scenario you can use the snapToken or redirectUrl
    (success) {
      print('QR Image: ${success.actions[0].url}');
    },
  );
}
