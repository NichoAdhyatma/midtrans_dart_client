import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:midtrans_client_flutter/error/api_error_handler.dart';
import 'package:midtrans_client_flutter/models/request/transaction_request.dart';
import 'package:midtrans_client_flutter/models/response/midtrans_error_response.dart';
import 'package:midtrans_client_flutter/models/response/snap_success_response.dart';
import 'package:midtrans_client_flutter/remote/midtrans_client_remote.dart';

class SnapRepository {
  final MidtransClientRemote _midtransClientFlutter = MidtransClientRemote.create();

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
