import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:midtrans_dart_client/error/api_error_handler.dart';
import 'package:midtrans_dart_client/midtrans_dart_client.dart';
import 'package:midtrans_dart_client/models/request/transaction_request.dart';
import 'package:midtrans_dart_client/models/response/core/charge_success_response.dart';
import 'package:midtrans_dart_client/models/response/core/transaction_status_response.dart';
import 'package:midtrans_dart_client/models/response/error/midtrans_error_response.dart';
import 'package:midtrans_dart_client/remote/midtrans_client_remote.dart';

/// A repository class for Core API
class CoreRepository {
  final MidtransClientRemote _midtransClientFlutter =
      MidtransClientRemote.createSnapClient(
          baseUrl: MidtransClient.instance.environment.getCoreApiBaseUrl());

  /// Charge a transaction required [transaction] parameter type [TransactionRequest] ,
  Future<Either<MidtransErrorResponse, ChargeSuccessResponse>> charge(
      TransactionRequest transaction) async {
    try {
      final chargeSuccessResponse =
          await _midtransClientFlutter.charge(transaction);

      return right(chargeSuccessResponse);
    } on DioException catch (e) {
      return ApiErrorHandler.handleDioError(e);
    }
  }

  /// Get Transaction Status required [orderId] parameter type [String] ,
  Future<Either<MidtransErrorResponse, TransactionStatusResponse>>
      getTransactionStatus(String orderId) async {
    try {
      final transactionStatusResponse =
          await _midtransClientFlutter.getTransactionStatus(orderId);

      return right(transactionStatusResponse);
    } on DioException catch (e) {
      return ApiErrorHandler.handleDioError(e);
    }
  }
}
