// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'midtrans_error_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MidtransErrorResponse _$MidtransErrorResponseFromJson(
        Map<String, dynamic> json) =>
    MidtransErrorResponse(
      errorMessages: (json['errorMessages'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$MidtransErrorResponseToJson(
        MidtransErrorResponse instance) =>
    <String, dynamic>{
      'errorMessages': instance.errorMessages,
    };
