import 'package:json_annotation/json_annotation.dart';

part 'transaction_status_response.g.dart';

@JsonSerializable()
class TransactionStatusResponse {
  @JsonKey(name: 'masked_card')
  final String? maskedCard;
  @JsonKey(name: 'approval_code')
  final String? approvalCode;
  final String? bank;
  final String? eci;
  @JsonKey(name: 'channel_response_code')
  final String? channelResponseCode;
  @JsonKey(name: 'channel_response_message')
  final String? channelResponseMessage;
  @JsonKey(name: 'transaction_time')
  final String? transactionTime;
  @JsonKey(name: 'gross_amount')
  final String? grossAmount;
  final String? currency;
  @JsonKey(name: 'order_id')
  final String? orderId;
  @JsonKey(name: 'payment_type')
  final String? paymentType;
  @JsonKey(name: 'signature_key')
  final String? signatureKey;
  @JsonKey(name: 'status_code')
  final String? statusCode;
  @JsonKey(name: 'transaction_id')
  final String? transactionId;
  @JsonKey(name: 'transaction_status')
  final String? transactionStatus;
  @JsonKey(name: 'fraud_status')
  final String? fraudStatus;
  @JsonKey(name: 'settlement_time')
  final String? settlementTime;
  @JsonKey(name: 'status_message')
  final String? statusMessage;
  @JsonKey(name: 'merchant_id')
  final String? merchantId;
  @JsonKey(name: 'card_type')
  final String? cardType;
  @JsonKey(name: 'three_ds_version')
  final String? threeDsVersion;
  @JsonKey(name: 'challenge_completion')
  final bool? challengeCompletion;

  TransactionStatusResponse({
    this.maskedCard,
    this.approvalCode,
    this.bank,
    this.eci,
    this.channelResponseCode,
    this.channelResponseMessage,
    this.transactionTime,
    this.grossAmount,
    this.currency,
    this.orderId,
    this.paymentType,
    this.signatureKey,
    this.statusCode,
    this.transactionId,
    this.transactionStatus,
    this.fraudStatus,
    this.settlementTime,
    this.statusMessage,
    this.merchantId,
    this.cardType,
    this.threeDsVersion,
    this.challengeCompletion,
  });

  factory TransactionStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$TransactionStatusResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionStatusResponseToJson(this);
}
