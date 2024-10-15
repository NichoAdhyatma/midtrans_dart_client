import 'package:dio/dio.dart';
import 'package:midtrans_client_flutter/app_enviromennt.dart';
import 'package:midtrans_client_flutter/midtrans_client_flutter.dart';
import 'package:midtrans_client_flutter/models/request/transaction_request.dart';
import 'package:midtrans_client_flutter/models/response/snap_success_response.dart';
import 'package:midtrans_client_flutter/remote/interceptor/dio_config.dart';
import 'package:midtrans_client_flutter/utils/extension/string.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'midtrans_client_remote.g.dart';

// flutter pub run build_runner watch --delete-conflicting-outputs

@RestApi()
abstract class MidtransClientRemote {
  factory MidtransClientRemote(Dio dio, {String baseUrl}) =
      _MidtransClientRemote;

  static MidtransClientRemote create({
    Map<String, dynamic> headers = const {},
    int connectTimeout = 30000,
    int receiveTimeout = 30000,
    String? baseUrl,
  }) {
    Map<String, dynamic> newHeaders = {
      'Authorization':
          'Basic ${MidtransClientFlutter.instance.serverKey.base64Encode}',
      ...headers,
    };

    return MidtransClientRemote(
      DioConfig.createDio(
        headers: newHeaders,
        connectTimeout: connectTimeout,
        receiveTimeout: receiveTimeout,
      ),
      baseUrl: baseUrl ?? AppEnvironment.getSnapApiBaseUrl().toString(),
    );
  }

  /// Get Snap Token required [body] parameter type [TransactionRequest] , return [SnapSuccessResponse] or throw [DioException]
  @POST('/transactions')
  Future<SnapSuccessResponse> getSnapToken(@Body() TransactionRequest body);
}
