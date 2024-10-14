import 'package:json_annotation/json_annotation.dart';

part 'transaction_request.g.dart';

@JsonSerializable(explicitToJson: true)
class TransactionRequest {
  final TransactionDetails? transactionDetails;
  final List<ItemDetails>? itemDetails;
  final CustomerDetails? customerDetails;
  final List<String>? enabledPayments;
  final CreditCard? creditCard;
  final Va? bcaVa;
  final Va? bniVa;
  final Va? briVa;
  final Va? cimbVa;
  final Va? permataVa;
  final Shopeepay? shopeepay;
  final Gopay? gopay;
  final Callbacks? callbacks;
  final UobEzpay? uobEzpay;
  final Expiry? expiry;
  final PageExpiry? pageExpiry;
  final Recurring? recurring;
  final String? customField1;
  final String? customField2;
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
  final String? orderId;
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
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;
  final Address? billingAddress;
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
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;
  final String? address;
  final String? city;
  final String? postalCode;
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
  final List<String>? whitelistBins;
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
  final String? merchantName;
  final String? cityName;
  final String? countryCode;

  DynamicDescriptor({this.merchantName, this.cityName, this.countryCode});

  factory DynamicDescriptor.fromJson(Map<String, dynamic> json) => _$DynamicDescriptorFromJson(json);
  Map<String, dynamic> toJson() => _$DynamicDescriptorToJson(this);
}

@JsonSerializable()
class Va {
  final String? vaNumber;
  final String? subCompanyCode;
  final FreeText? freeText;
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
  final String? callbackUrl;

  Shopeepay({this.callbackUrl});

  factory Shopeepay.fromJson(Map<String, dynamic> json) => _$ShopeepayFromJson(json);
  Map<String, dynamic> toJson() => _$ShopeepayToJson(this);
}

@JsonSerializable()
class Gopay {
  final bool? enableCallback;
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
  final String? callbackUrl;

  UobEzpay({this.callbackUrl});

  factory UobEzpay.fromJson(Map<String, dynamic> json) => _$UobEzpayFromJson(json);
  Map<String, dynamic> toJson() => _$UobEzpayToJson(this);
}

@JsonSerializable()
class Expiry {
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
  final String? startTime;
  final String? intervalUnit;

  Recurring({this.required, this.startTime, this.intervalUnit});

  factory Recurring.fromJson(Map<String, dynamic> json) => _$RecurringFromJson(json);
  Map<String, dynamic> toJson() => _$RecurringToJson(this);
}
