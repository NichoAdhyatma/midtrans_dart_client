import 'package:json_annotation/json_annotation.dart';

part 'midtrans_error_response.g.dart';

@JsonSerializable()
class MidtransErrorResponse {
  @JsonKey(name: 'error_messages')
  final List<String>? errorMessages;
  int? statusCode;

  MidtransErrorResponse({this.errorMessages, this.statusCode = 404});

  factory MidtransErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$MidtransErrorResponseFromJson(json);
  Map<String, dynamic> toJson() => _$MidtransErrorResponseToJson(this);
}
