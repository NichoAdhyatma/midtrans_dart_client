import 'package:dio/dio.dart';
import 'package:midtrans_dart_client/midtrans_dart_client.dart';
import 'package:midtrans_dart_client/models/request/transaction_request.dart';
import 'package:midtrans_dart_client/models/response/core/charge_success_response.dart';
import 'package:midtrans_dart_client/models/response/core/transaction_status_response.dart';
import 'package:midtrans_dart_client/models/response/snap/snap_success_response.dart';
import 'package:midtrans_dart_client/remote/interceptor/dio_config.dart';
import 'package:midtrans_dart_client/utils/extension/string.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'midtrans_client_remote.g.dart';

// flutter pub run build_runner watch --delete-conflicting-outputs

@RestApi()
abstract class MidtransClientRemote {
  factory MidtransClientRemote(Dio dio, {String baseUrl}) =
      _MidtransClientRemote;

  static MidtransClientRemote createClient({
    Map<String, dynamic> headers = const {},
    int connectTimeout = 30000,
    int receiveTimeout = 30000,
    required String baseUrl,
  }) {
    Map<String, dynamic> newHeaders = {
      'Authorization':
          'Basic ${MidtransClient.instance.serverKey.base64Encode}',
      ...headers,
    };

    return MidtransClientRemote(
      DioConfig.createDio(
        headers: newHeaders,
        connectTimeout: connectTimeout,
        receiveTimeout: receiveTimeout,
      ),
      baseUrl: baseUrl
    );
  }

  /// Get Snap Token required [body] parameter type [TransactionRequest] , return [SnapSuccessResponse] or throw [DioException]
  @POST('/transactions')
  Future<SnapSuccessResponse> getSnapToken(@Body() TransactionRequest body);

  /// Charge a transaction required [body] parameter type [TransactionRequest] , return [ChargeSuccessResponse] or throw [DioException]
  @POST('/charge')
  Future<ChargeSuccessResponse> charge(@Body() TransactionRequest body);

  /// Get Transaction Status required [orderId] parameter type [String] , return [TransactionStatusResponse] or throw [DioException]
  @GET('/{orderId}/status')
  Future<TransactionStatusResponse> getTransactionStatus(@Path('orderId') String orderId);
}
