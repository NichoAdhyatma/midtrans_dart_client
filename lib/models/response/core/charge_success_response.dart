import 'package:json_annotation/json_annotation.dart';

part 'charge_success_response.g.dart';

@JsonSerializable()
class ChargeSuccessResponse {
  @JsonKey(name: 'status_code')
  final String statusCode;

  @JsonKey(name: 'status_message')
  final String statusMessage;

  @JsonKey(name: 'transaction_id')
  final String transactionId;

  @JsonKey(name: 'order_id')
  final String orderId;

  @JsonKey(name: 'merchant_id')
  final String merchantId;

  @JsonKey(name: 'gross_amount')
  final String grossAmount;

  final String currency;

  @JsonKey(name: 'payment_type')
  final String paymentType;

  @JsonKey(name: 'transaction_time')
  final String transactionTime;

  @JsonKey(name: 'transaction_status')
  final String transactionStatus;

  @JsonKey(name: 'fraud_status')
  final String fraudStatus;

  final String acquirer;

  final List<Action> actions;

  @JsonKey(name: 'expiry_time')
  final String expiryTime;

  ChargeSuccessResponse({
    required this.statusCode,
    required this.statusMessage,
    required this.transactionId,
    required this.orderId,
    required this.merchantId,
    required this.grossAmount,
    required this.currency,
    required this.paymentType,
    required this.transactionTime,
    required this.transactionStatus,
    required this.fraudStatus,
    required this.acquirer,
    required this.actions,
    required this.expiryTime,
  });

  factory ChargeSuccessResponse.fromJson(Map<String, dynamic> json) =>
      _$ChargeSuccessResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ChargeSuccessResponseToJson(this);
}

@JsonSerializable()
class Action {
  final String name;
  final String method;
  final String url;

  Action({
    required this.name,
    required this.method,
    required this.url,
  });

  factory Action.fromJson(Map<String, dynamic> json) => _$ActionFromJson(json);

  Map<String, dynamic> toJson() => _$ActionToJson(this);
}
