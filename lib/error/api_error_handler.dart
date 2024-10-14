import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:midtrans_client_flutter/models/response/midtrans_error_response.dart';

class ApiErrorHandler {
  static Either<MidtransErrorResponse, T> handleDioError<T>(DioException e) {
    if (e.response != null && e.response!.data != null) {
      try {
        final errorResponse = MidtransErrorResponse.fromJson(e.response!.data);
        return Either.left(errorResponse);
      } catch (decodeError) {
        return Either.left(
          MidtransErrorResponse(
            errorMessages: ["Failed to decode error response: $decodeError"],
          ),
        );
      }
    } else {
      return Either.left(
        MidtransErrorResponse(
          errorMessages: ["Unexpected error: ${e.message}"],
        ),
      );
    }
  }
}
