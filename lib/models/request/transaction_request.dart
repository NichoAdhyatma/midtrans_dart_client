import 'package:json_annotation/json_annotation.dart';

part 'transaction_request.g.dart';

@JsonSerializable(explicitToJson: true)
class TransactionRequest {
  @JsonKey(name: 'transaction_details')
  final TransactionDetails? transactionDetails;

  @JsonKey(name: 'item_details')
  final List<ItemDetails>? itemDetails;

  @JsonKey(name: 'customer_details')
  final CustomerDetails? customerDetails;

  @JsonKey(name: 'enabled_payments')
  final List<String>? enabledPayments;

  @JsonKey(name: 'credit_card')
  final CreditCard? creditCard;

  @JsonKey(name: 'bca_va')
  final Va? bcaVa;

  @JsonKey(name: 'bni_va')
  final Va? bniVa;

  @JsonKey(name: 'bri_va')
  final Va? briVa;

  @JsonKey(name: 'cimb_va')
  final Va? cimbVa;

  @JsonKey(name: 'permata_va')
  final Va? permataVa;

  final Shopeepay? shopeepay;
  final Gopay? gopay;
  final Callbacks? callbacks;

  @JsonKey(name: 'uob_ezpay')
  final UobEzpay? uobEzpay;

  final Expiry? expiry;

  @JsonKey(name: 'page_expiry')
  final PageExpiry? pageExpiry;

  final Recurring? recurring;

  @JsonKey(name: 'custom_field_1')
  final String? customField1;

  @JsonKey(name: 'custom_field_2')
  final String? customField2;

  @JsonKey(name: 'custom_field_3')
  final String? customField3;

  TransactionRequest({
    this.transactionDetails,
    this.itemDetails,
    this.customerDetails,
    this.enabledPayments,
    this.creditCard,
    this.bcaVa,
    this.bniVa,
    this.briVa,
    this.cimbVa,
    this.permataVa,
    this.shopeepay,
    this.gopay,
    this.callbacks,
    this.uobEzpay,
    this.expiry,
    this.pageExpiry,
    this.recurring,
    this.customField1,
    this.customField2,
    this.customField3,
  });

  factory TransactionRequest.fromJson(Map<String, dynamic> json) => _$TransactionRequestFromJson(json);
  Map<String, dynamic> toJson() => _$TransactionRequestToJson(this);
}

@JsonSerializable()
class TransactionDetails {
  @JsonKey(name: 'order_id')
  final String? orderId;

  @JsonKey(name: 'gross_amount')
  final int? grossAmount;

  TransactionDetails({this.orderId, this.grossAmount});

  factory TransactionDetails.fromJson(Map<String, dynamic> json) => _$TransactionDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$TransactionDetailsToJson(this);
}

@JsonSerializable()
class ItemDetails {
  final String? id;
  final int? price;
  final int? quantity;
  final String? name;
  final String? brand;
  final String? category;

  @JsonKey(name: 'merchant_name')
  final String? merchantName;

  final String? url;

  ItemDetails({
    this.id,
    this.price,
    this.quantity,
    this.name,
    this.brand,
    this.category,
    this.merchantName,
    this.url,
  });

  factory ItemDetails.fromJson(Map<String, dynamic> json) => _$ItemDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$ItemDetailsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CustomerDetails {
  @JsonKey(name: 'first_name')
  final String? firstName;

  @JsonKey(name: 'last_name')
  final String? lastName;

  final String? email;
  final String? phone;

  @JsonKey(name: 'billing_address')
  final Address? billingAddress;

  @JsonKey(name: 'shipping_address')
  final Address? shippingAddress;

  CustomerDetails({
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.billingAddress,
    this.shippingAddress,
  });

  factory CustomerDetails.fromJson(Map<String, dynamic> json) => _$CustomerDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$CustomerDetailsToJson(this);
}

@JsonSerializable()
class Address {
  @JsonKey(name: 'first_name')
  final String? firstName;

  @JsonKey(name: 'last_name')
  final String? lastName;

  final String? email;
  final String? phone;
  final String? address;
  final String? city;

  @JsonKey(name: 'postal_code')
  final String? postalCode;

  @JsonKey(name: 'country_code')
  final String? countryCode;

  Address({
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.address,
    this.city,
    this.postalCode,
    this.countryCode,
  });

  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);
  Map<String, dynamic> toJson() => _$AddressToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreditCard {
  final bool? secure;
  final String? channel;
  final String? bank;
  final Installment? installment;

  @JsonKey(name: 'whitelist_bins')
  final List<String>? whitelistBins;

  @JsonKey(name: 'dynamic_descriptor')
  final DynamicDescriptor? dynamicDescriptor;

  CreditCard({
    this.secure,
    this.channel,
    this.bank,
    this.installment,
    this.whitelistBins,
    this.dynamicDescriptor,
  });

  factory CreditCard.fromJson(Map<String, dynamic> json) => _$CreditCardFromJson(json);
  Map<String, dynamic> toJson() => _$CreditCardToJson(this);
}

@JsonSerializable()
class Installment {
  final bool? required;
  final Map<String, List<int>>? terms;

  Installment({this.required, this.terms});

  factory Installment.fromJson(Map<String, dynamic> json) => _$InstallmentFromJson(json);
  Map<String, dynamic> toJson() => _$InstallmentToJson(this);
}

@JsonSerializable()
class DynamicDescriptor {
  @JsonKey(name: 'merchant_name')
  final String? merchantName;

  @JsonKey(name: 'city_name')
  final String? cityName;

  @JsonKey(name: 'country_code')
  final String? countryCode;

  DynamicDescriptor({this.merchantName, this.cityName, this.countryCode});

  factory DynamicDescriptor.fromJson(Map<String, dynamic> json) => _$DynamicDescriptorFromJson(json);
  Map<String, dynamic> toJson() => _$DynamicDescriptorToJson(this);
}

@JsonSerializable()
class Va {
  @JsonKey(name: 'va_number')
  final String? vaNumber;

  @JsonKey(name: 'sub_company_code')
  final String? subCompanyCode;

  @JsonKey(name: 'free_text')
  final FreeText? freeText;

  @JsonKey(name: 'recipient_name')
  final String? recipientName;

  Va({this.vaNumber, this.subCompanyCode, this.freeText, this.recipientName});

  factory Va.fromJson(Map<String, dynamic> json) => _$VaFromJson(json);
  Map<String, dynamic> toJson() => _$VaToJson(this);
}

@JsonSerializable()
class FreeText {
  final List<LanguageText>? inquiry;
  final List<LanguageText>? payment;

  FreeText({this.inquiry, this.payment});

  factory FreeText.fromJson(Map<String, dynamic> json) => _$FreeTextFromJson(json);
  Map<String, dynamic> toJson() => _$FreeTextToJson(this);
}

@JsonSerializable()
class LanguageText {
  final String? en;
  final String? id;

  LanguageText({this.en, this.id});

  factory LanguageText.fromJson(Map<String, dynamic> json) => _$LanguageTextFromJson(json);
  Map<String, dynamic> toJson() => _$LanguageTextToJson(this);
}

@JsonSerializable()
class Shopeepay {
  @JsonKey(name: 'callback_url')
  final String? callbackUrl;

  Shopeepay({this.callbackUrl});

  factory Shopeepay.fromJson(Map<String, dynamic> json) => _$ShopeepayFromJson(json);
  Map<String, dynamic> toJson() => _$ShopeepayToJson(this);
}

@JsonSerializable()
class Gopay {
  @JsonKey(name: 'enable_callback')
  final bool? enableCallback;

  @JsonKey(name: 'callback_url')
  final String? callbackUrl;

  Gopay({this.enableCallback, this.callbackUrl});

  factory Gopay.fromJson(Map<String, dynamic> json) => _$GopayFromJson(json);
  Map<String, dynamic> toJson() => _$GopayToJson(this);
}

@JsonSerializable()
class Callbacks {
  final String? finish;

  Callbacks({this.finish});

  factory Callbacks.fromJson(Map<String, dynamic> json) => _$CallbacksFromJson(json);
  Map<String, dynamic> toJson() => _$CallbacksToJson(this);
}

@JsonSerializable()
class UobEzpay {
  @JsonKey(name: 'callback_url')
  final String? callbackUrl;

  UobEzpay({this.callbackUrl});

  factory UobEzpay.fromJson(Map<String, dynamic> json) => _$UobEzpayFromJson(json);
  Map<String, dynamic> toJson() => _$UobEzpayToJson(this);
}

@JsonSerializable()
class Expiry {
  @JsonKey(name: 'start_time')
  final String? startTime;

  final String? unit;
  final int? duration;

  Expiry({this.startTime, this.unit, this.duration});

  factory Expiry.fromJson(Map<String, dynamic> json) => _$ExpiryFromJson(json);
  Map<String, dynamic> toJson() => _$ExpiryToJson(this);
}

@JsonSerializable()
class PageExpiry {
  final int? duration;
  final String? unit;

  PageExpiry({this.duration, this.unit});

  factory PageExpiry.fromJson(Map<String, dynamic> json) => _$PageExpiryFromJson(json);
  Map<String, dynamic> toJson() => _$PageExpiryToJson(this);
}

@JsonSerializable()
class Recurring {
  final bool? required;

  @JsonKey(name: 'start_time')
  final String? startTime;

  @JsonKey(name: 'interval_unit')
  final String? intervalUnit;

  Recurring({this.required, this.startTime, this.intervalUnit});

  factory Recurring.fromJson(Map<String, dynamic> json) => _$RecurringFromJson(json);
  Map<String, dynamic> toJson() => _$RecurringToJson(this);
}
