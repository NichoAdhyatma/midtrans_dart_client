import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:midtrans_dart_client/models/response/error/midtrans_error_response.dart';

class ApiErrorHandler {
  static Either<MidtransErrorResponse, T> handleDioError<T>(DioException e) {
    if (e.response != null && e.response!.data != null) {
      try {
        final errorResponse = MidtransErrorResponse.fromJson(
          e.response!.data,
        );

        errorResponse.statusCode = e.response?.statusCode;

        return Either.left(errorResponse);
      } catch (decodeError) {
        return Either.left(
          MidtransErrorResponse(
            errorMessages: ["Failed to decode error response: $decodeError"],
            statusCode: e.response?.statusCode,
          ),
        );
      }
    } else {
      return Either.left(
        MidtransErrorResponse(
          errorMessages: ["Unexpected error: ${e.message}"],
          statusCode: e.response?.statusCode,
        ),
      );
    }
  }
}
