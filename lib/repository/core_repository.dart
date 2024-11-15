import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:midtrans_dart_client/error/api_error_handler.dart';
import 'package:midtrans_dart_client/midtrans_dart_client.dart';
import 'package:midtrans_dart_client/models/request/transaction_request.dart';
import 'package:midtrans_dart_client/models/response/charge/charge_success_response.dart';
import 'package:midtrans_dart_client/models/response/midtrans_error_response.dart';
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
}
