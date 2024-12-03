import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:midtrans_dart_client/error/api_error_handler.dart';
import 'package:midtrans_dart_client/midtrans_dart_client.dart';
import 'package:midtrans_dart_client/models/request/transaction_request.dart';
import 'package:midtrans_dart_client/models/response/error/midtrans_error_response.dart';
import 'package:midtrans_dart_client/models/response/snap/snap_success_response.dart';
import 'package:midtrans_dart_client/remote/midtrans_client_remote.dart';

/// A repository class for Snap API
class SnapRepository {
  final MidtransClientRemote _midtransClientFlutter =
      MidtransClientRemote.createSnapClient(
          baseUrl: MidtransClient.instance.environment.getSnapApiBaseUrl());

  /// Get Snap Token required [transaction] parameter type [TransactionRequest] ,
  /// return [SnapSuccessResponse] or [MidtransErrorResponse]
  /// Example:
  /// ```dart
  /// final transaction = TransactionRequest(
  ///  transactionDetails: TransactionDetails(
  ///  orderId: 'order-123',
  ///  grossAmount: 20000,
  ///  ),
  ///  creditCard: CreditCard(
  ///  secure: true,
  ///  ),
  ///  );
  ///  final result = await _snapRepository.getSnapToken(transaction);
  ///  ```
  Future<Either<MidtransErrorResponse, SnapSuccessResponse>> getSnapToken(
      TransactionRequest transaction) async {
    try {
      final snapSuccessResponse =
          await _midtransClientFlutter.getSnapToken(transaction);

      return right(snapSuccessResponse);
    } on DioException catch (e) {
      return ApiErrorHandler.handleDioError(e);
    }
  }
}
