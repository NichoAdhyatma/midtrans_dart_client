import 'package:dio/dio.dart';
import 'package:midtrans_client_flutter/utils/base.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

abstract class DioConfig {
  static Dio createDio({
    Map<String, dynamic> headers = const {},
    int connectTimeout = 30000,
    int receiveTimeout = 30000,
  }) {
    final dio = Dio(BaseOptions(
      connectTimeout: Duration(milliseconds: connectTimeout),
      receiveTimeout: Duration(milliseconds: receiveTimeout),
    ));

    dio.options.headers.addAll({
      ...Base.baseHeaders,
      ...headers,
    });

    final prettyDioLogger = PrettyDioLogger(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      error: true,
      compact: true,
    );

    // dio.interceptors.add(APILogInterceptor());
    dio.interceptors.add(prettyDioLogger);

    return dio;
  }
}
