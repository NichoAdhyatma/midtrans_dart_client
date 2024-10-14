import 'package:json_annotation/json_annotation.dart';

part 'midtrans_error_response.g.dart';

@JsonSerializable()
class MidtransErrorResponse {
  final List<String>? errorMessages;

  MidtransErrorResponse({this.errorMessages});

  factory MidtransErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$MidtransErrorResponseFromJson(json);
  Map<String, dynamic> toJson() => _$MidtransErrorResponseToJson(this);
}
