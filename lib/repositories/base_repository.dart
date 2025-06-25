import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

mixin BaseRepository {
  Future<Either<Error, Success>> handleApiCall<Success, Error>(
      {required Future<Success> Function() apiCall,
      required Error Function(DioException e) errorHandler}) async {
    try {
      final response = await apiCall();

      return right(response);
    } on DioException catch (e) {
      return left(errorHandler(e));
    }
  }
}
