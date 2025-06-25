import 'package:fpdart/fpdart.dart';
import 'package:midtrans_dart_client/midtrans_dart_client.dart';
import 'package:midtrans_dart_client/models/response/core/transaction_status_response.dart';

class GetTransactionStatusUseCase {
  final MidtransClient client = MidtransClient.instance;

  Future<Either<String, TransactionStatusResponse>> call(String orderId) async {
    final result = await client.coreRepository.getTransactionStatus(orderId);
    return result.mapLeft(
          (err) => err.statusMessage ?? "Gagal cek status transaksi.",
    );
  }
}
