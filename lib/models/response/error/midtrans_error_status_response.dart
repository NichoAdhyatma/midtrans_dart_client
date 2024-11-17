
import 'package:json_annotation/json_annotation.dart';

part 'midtrans_error_status_response.g.dart';

@JsonSerializable()
class MidtransErrorStatusResponse {
  @JsonKey(name: 'status_code')
  final String? statusCode;

  @JsonKey(name: 'status_message')
  final String? statusMessage;

  MidtransErrorStatusResponse({this.statusCode, this.statusMessage});

  factory MidtransErrorStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$MidtransErrorStatusResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MidtransErrorStatusResponseToJson(this);
}