import 'package:fpdart/fpdart.dart';
import 'package:midtrans_dart_client/error/api_error_handler.dart';
import 'package:midtrans_dart_client/midtrans_dart_client.dart';
import 'package:midtrans_dart_client/models/request/transaction_request.dart';
import 'package:midtrans_dart_client/models/response/core/charge_success_response.dart';
import 'package:midtrans_dart_client/models/response/core/transaction_status_response.dart';
import 'package:midtrans_dart_client/models/response/error/midtrans_error_status_response.dart';
import 'package:midtrans_dart_client/remote/midtrans_client_remote.dart';

import 'base_repository.dart';

/// A repository class for Core API
class CoreRepository with BaseRepository {
  /// A client to interact with Midtrans Core API
  final MidtransClientRemote coreClient = MidtransClientRemote.createClient(
    baseUrl: MidtransClient.instance.environment.getCoreApiBaseUrl() ?? '',
  );

  /// Charge a transaction required [transaction] parameter type [TransactionRequest] ,
  Future<Either<MidtransErrorStatusResponse, ChargeSuccessResponse>> charge(
      TransactionRequest transaction) async {
    return handleApiCall(
      apiCall: () => coreClient.charge(transaction),
      errorHandler: ApiErrorHandler.handleMidtransErrorStatusResponse,
    );
  }

  /// Get Transaction Status required [orderId] parameter type [String] ,
  Future<Either<MidtransErrorStatusResponse, TransactionStatusResponse>>
      getTransactionStatus(String orderId) async {
    return handleApiCall(
      apiCall: () => coreClient.getTransactionStatus(orderId),
      errorHandler: ApiErrorHandler.handleMidtransErrorStatusResponse,
    );
  }
}
