import 'package:json_annotation/json_annotation.dart';

part 'snap_success_response.g.dart';

@JsonSerializable()
class SnapSuccessResponse {
  final String? token;
  final String? redirectUrl;

  SnapSuccessResponse({this.token, this.redirectUrl});

  factory SnapSuccessResponse.fromJson(Map<String, dynamic> json) =>
      _$SnapSuccessResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SnapSuccessResponseToJson(this);
}
