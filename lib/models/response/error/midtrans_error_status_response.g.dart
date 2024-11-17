// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'midtrans_error_status_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MidtransErrorStatusResponse _$MidtransErrorStatusResponseFromJson(
        Map<String, dynamic> json) =>
    MidtransErrorStatusResponse(
      statusCode: json['status_code'] as String?,
      statusMessage: json['status_message'] as String?,
    );

Map<String, dynamic> _$MidtransErrorStatusResponseToJson(
        MidtransErrorStatusResponse instance) =>
    <String, dynamic>{
      'status_code': instance.statusCode,
      'status_message': instance.statusMessage,
    };
