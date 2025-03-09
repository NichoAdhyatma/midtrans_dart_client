import 'package:dio/dio.dart';
import 'package:midtrans_dart_client/models/response/error/midtrans_error_response.dart';
import 'package:midtrans_dart_client/models/response/error/midtrans_error_status_response.dart';

class ApiErrorHandler {
  static MidtransErrorResponse handleMidtransErrorResponse(DioException e) {
    if (e.response != null && e.response?.data != null) {
      try {
        final errorResponse = MidtransErrorResponse.fromJson(
          e.response?.data,
        );

        return errorResponse;
      } catch (decodeError) {
        return MidtransErrorResponse(
          errorMessages: ["Failed to decode error response: $decodeError"],
          statusCode: e.response?.statusCode,
        );
      }
    } else {
      return MidtransErrorResponse(
        errorMessages: ["Unexpected error: ${e.message}"],
        statusCode: e.response?.statusCode,
      );
    }
  }

  static MidtransErrorStatusResponse handleMidtransErrorStatusResponse(DioException e) {
    if (e.response != null && e.response?.data != null) {
      try {
        final errorResponse = MidtransErrorStatusResponse.fromJson(
          e.response?.data,
        );

        return errorResponse;
      } catch (decodeError) {
        return MidtransErrorStatusResponse(
          statusCode: "500",
          statusMessage: e.message,
        );
      }
    } else {
      return MidtransErrorStatusResponse(
        statusCode: "500",
        statusMessage: e.message,
      );
    }
  }
}
