// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_status_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionStatusResponse _$TransactionStatusResponseFromJson(
        Map<String, dynamic> json) =>
    TransactionStatusResponse(
      maskedCard: json['masked_card'] as String?,
      approvalCode: json['approval_code'] as String?,
      bank: json['bank'] as String?,
      eci: json['eci'] as String?,
      channelResponseCode: json['channel_response_code'] as String?,
      channelResponseMessage: json['channel_response_message'] as String?,
      transactionTime: json['transaction_time'] as String?,
      grossAmount: json['gross_amount'] as String?,
      currency: json['currency'] as String?,
      orderId: json['order_id'] as String?,
      paymentType: json['payment_type'] as String?,
      signatureKey: json['signature_key'] as String?,
      statusCode: json['status_code'] as String?,
      transactionId: json['transaction_id'] as String?,
      transactionStatus: json['transaction_status'] as String?,
      fraudStatus: json['fraud_status'] as String?,
      settlementTime: json['settlement_time'] as String?,
      statusMessage: json['status_message'] as String?,
      merchantId: json['merchant_id'] as String?,
      cardType: json['card_type'] as String?,
      threeDsVersion: json['three_ds_version'] as String?,
      challengeCompletion: json['challenge_completion'] as bool?,
    );

Map<String, dynamic> _$TransactionStatusResponseToJson(
        TransactionStatusResponse instance) =>
    <String, dynamic>{
      'masked_card': instance.maskedCard,
      'approval_code': instance.approvalCode,
      'bank': instance.bank,
      'eci': instance.eci,
      'channel_response_code': instance.channelResponseCode,
      'channel_response_message': instance.channelResponseMessage,
      'transaction_time': instance.transactionTime,
      'gross_amount': instance.grossAmount,
      'currency': instance.currency,
      'order_id': instance.orderId,
      'payment_type': instance.paymentType,
      'signature_key': instance.signatureKey,
      'status_code': instance.statusCode,
      'transaction_id': instance.transactionId,
      'transaction_status': instance.transactionStatus,
      'fraud_status': instance.fraudStatus,
      'settlement_time': instance.settlementTime,
      'status_message': instance.statusMessage,
      'merchant_id': instance.merchantId,
      'card_type': instance.cardType,
      'three_ds_version': instance.threeDsVersion,
      'challenge_completion': instance.challengeCompletion,
    };
