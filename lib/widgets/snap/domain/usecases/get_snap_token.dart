import 'package:fpdart/fpdart.dart';
import 'package:midtrans_dart_client/midtrans_dart_client.dart';
import 'package:midtrans_dart_client/models/request/transaction_request.dart';

class GetSnapTokenUseCase {
  final MidtransClient client = MidtransClient.instance;

  Future<Either<String, String>> call(TransactionRequest request) async {
    final result = await client.snapRepository.getSnapToken(request);
    return result.map(
          (res) => res.redirectUrl ?? "",
    ).mapLeft(
          (err) => err.errorMessages?.first ?? "Snap token gagal diambil.",
    );
  }
}
