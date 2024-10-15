// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'midtrans_error_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MidtransErrorResponse _$MidtransErrorResponseFromJson(
        Map<String, dynamic> json) =>
    MidtransErrorResponse(
      errorMessages: (json['error_messages'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      statusCode: (json['statusCode'] as num?)?.toInt() ?? 404,
    );

Map<String, dynamic> _$MidtransErrorResponseToJson(
        MidtransErrorResponse instance) =>
    <String, dynamic>{
      'error_messages': instance.errorMessages,
      'statusCode': instance.statusCode,
    };
