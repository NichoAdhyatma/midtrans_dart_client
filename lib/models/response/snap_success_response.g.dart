// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'snap_success_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SnapSuccessResponse _$SnapSuccessResponseFromJson(Map<String, dynamic> json) =>
    SnapSuccessResponse(
      token: json['token'] as String?,
      redirectUrl: json['redirectUrl'] as String?,
    );

Map<String, dynamic> _$SnapSuccessResponseToJson(
        SnapSuccessResponse instance) =>
    <String, dynamic>{
      'token': instance.token,
      'redirectUrl': instance.redirectUrl,
    };
