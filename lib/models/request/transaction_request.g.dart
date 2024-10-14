// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionRequest _$TransactionRequestFromJson(Map<String, dynamic> json) =>
    TransactionRequest(
      transactionDetails: json['transactionDetails'] == null
          ? null
          : TransactionDetails.fromJson(
              json['transactionDetails'] as Map<String, dynamic>),
      itemDetails: (json['itemDetails'] as List<dynamic>?)
          ?.map((e) => ItemDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      customerDetails: json['customerDetails'] == null
          ? null
          : CustomerDetails.fromJson(
              json['customerDetails'] as Map<String, dynamic>),
      enabledPayments: (json['enabledPayments'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      creditCard: json['creditCard'] == null
          ? null
          : CreditCard.fromJson(json['creditCard'] as Map<String, dynamic>),
      bcaVa: json['bcaVa'] == null
          ? null
          : Va.fromJson(json['bcaVa'] as Map<String, dynamic>),
      bniVa: json['bniVa'] == null
          ? null
          : Va.fromJson(json['bniVa'] as Map<String, dynamic>),
      briVa: json['briVa'] == null
          ? null
          : Va.fromJson(json['briVa'] as Map<String, dynamic>),
      cimbVa: json['cimbVa'] == null
          ? null
          : Va.fromJson(json['cimbVa'] as Map<String, dynamic>),
      permataVa: json['permataVa'] == null
          ? null
          : Va.fromJson(json['permataVa'] as Map<String, dynamic>),
      shopeepay: json['shopeepay'] == null
          ? null
          : Shopeepay.fromJson(json['shopeepay'] as Map<String, dynamic>),
      gopay: json['gopay'] == null
          ? null
          : Gopay.fromJson(json['gopay'] as Map<String, dynamic>),
      callbacks: json['callbacks'] == null
          ? null
          : Callbacks.fromJson(json['callbacks'] as Map<String, dynamic>),
      uobEzpay: json['uobEzpay'] == null
          ? null
          : UobEzpay.fromJson(json['uobEzpay'] as Map<String, dynamic>),
      expiry: json['expiry'] == null
          ? null
          : Expiry.fromJson(json['expiry'] as Map<String, dynamic>),
      pageExpiry: json['pageExpiry'] == null
          ? null
          : PageExpiry.fromJson(json['pageExpiry'] as Map<String, dynamic>),
      recurring: json['recurring'] == null
          ? null
          : Recurring.fromJson(json['recurring'] as Map<String, dynamic>),
      customField1: json['customField1'] as String?,
      customField2: json['customField2'] as String?,
      customField3: json['customField3'] as String?,
    );

Map<String, dynamic> _$TransactionRequestToJson(TransactionRequest instance) =>
    <String, dynamic>{
      'transactionDetails': instance.transactionDetails?.toJson(),
      'itemDetails': instance.itemDetails?.map((e) => e.toJson()).toList(),
      'customerDetails': instance.customerDetails?.toJson(),
      'enabledPayments': instance.enabledPayments,
      'creditCard': instance.creditCard?.toJson(),
      'bcaVa': instance.bcaVa?.toJson(),
      'bniVa': instance.bniVa?.toJson(),
      'briVa': instance.briVa?.toJson(),
      'cimbVa': instance.cimbVa?.toJson(),
      'permataVa': instance.permataVa?.toJson(),
      'shopeepay': instance.shopeepay?.toJson(),
      'gopay': instance.gopay?.toJson(),
      'callbacks': instance.callbacks?.toJson(),
      'uobEzpay': instance.uobEzpay?.toJson(),
      'expiry': instance.expiry?.toJson(),
      'pageExpiry': instance.pageExpiry?.toJson(),
      'recurring': instance.recurring?.toJson(),
      'customField1': instance.customField1,
      'customField2': instance.customField2,
      'customField3': instance.customField3,
    };

TransactionDetails _$TransactionDetailsFromJson(Map<String, dynamic> json) =>
    TransactionDetails(
      orderId: json['orderId'] as String?,
      grossAmount: (json['grossAmount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TransactionDetailsToJson(TransactionDetails instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'grossAmount': instance.grossAmount,
    };

ItemDetails _$ItemDetailsFromJson(Map<String, dynamic> json) => ItemDetails(
      id: json['id'] as String?,
      price: (json['price'] as num?)?.toInt(),
      quantity: (json['quantity'] as num?)?.toInt(),
      name: json['name'] as String?,
      brand: json['brand'] as String?,
      category: json['category'] as String?,
      merchantName: json['merchantName'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$ItemDetailsToJson(ItemDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'quantity': instance.quantity,
      'name': instance.name,
      'brand': instance.brand,
      'category': instance.category,
      'merchantName': instance.merchantName,
      'url': instance.url,
    };

CustomerDetails _$CustomerDetailsFromJson(Map<String, dynamic> json) =>
    CustomerDetails(
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      billingAddress: json['billingAddress'] == null
          ? null
          : Address.fromJson(json['billingAddress'] as Map<String, dynamic>),
      shippingAddress: json['shippingAddress'] == null
          ? null
          : Address.fromJson(json['shippingAddress'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CustomerDetailsToJson(CustomerDetails instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'phone': instance.phone,
      'billingAddress': instance.billingAddress?.toJson(),
      'shippingAddress': instance.shippingAddress?.toJson(),
    };

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
      city: json['city'] as String?,
      postalCode: json['postalCode'] as String?,
      countryCode: json['countryCode'] as String?,
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'phone': instance.phone,
      'address': instance.address,
      'city': instance.city,
      'postalCode': instance.postalCode,
      'countryCode': instance.countryCode,
    };

CreditCard _$CreditCardFromJson(Map<String, dynamic> json) => CreditCard(
      secure: json['secure'] as bool?,
      channel: json['channel'] as String?,
      bank: json['bank'] as String?,
      installment: json['installment'] == null
          ? null
          : Installment.fromJson(json['installment'] as Map<String, dynamic>),
      whitelistBins: (json['whitelistBins'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      dynamicDescriptor: json['dynamicDescriptor'] == null
          ? null
          : DynamicDescriptor.fromJson(
              json['dynamicDescriptor'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreditCardToJson(CreditCard instance) =>
    <String, dynamic>{
      'secure': instance.secure,
      'channel': instance.channel,
      'bank': instance.bank,
      'installment': instance.installment?.toJson(),
      'whitelistBins': instance.whitelistBins,
      'dynamicDescriptor': instance.dynamicDescriptor?.toJson(),
    };

Installment _$InstallmentFromJson(Map<String, dynamic> json) => Installment(
      required: json['required'] as bool?,
      terms: (json['terms'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            k, (e as List<dynamic>).map((e) => (e as num).toInt()).toList()),
      ),
    );

Map<String, dynamic> _$InstallmentToJson(Installment instance) =>
    <String, dynamic>{
      'required': instance.required,
      'terms': instance.terms,
    };

DynamicDescriptor _$DynamicDescriptorFromJson(Map<String, dynamic> json) =>
    DynamicDescriptor(
      merchantName: json['merchantName'] as String?,
      cityName: json['cityName'] as String?,
      countryCode: json['countryCode'] as String?,
    );

Map<String, dynamic> _$DynamicDescriptorToJson(DynamicDescriptor instance) =>
    <String, dynamic>{
      'merchantName': instance.merchantName,
      'cityName': instance.cityName,
      'countryCode': instance.countryCode,
    };

Va _$VaFromJson(Map<String, dynamic> json) => Va(
      vaNumber: json['vaNumber'] as String?,
      subCompanyCode: json['subCompanyCode'] as String?,
      freeText: json['freeText'] == null
          ? null
          : FreeText.fromJson(json['freeText'] as Map<String, dynamic>),
      recipientName: json['recipientName'] as String?,
    );

Map<String, dynamic> _$VaToJson(Va instance) => <String, dynamic>{
      'vaNumber': instance.vaNumber,
      'subCompanyCode': instance.subCompanyCode,
      'freeText': instance.freeText,
      'recipientName': instance.recipientName,
    };

FreeText _$FreeTextFromJson(Map<String, dynamic> json) => FreeText(
      inquiry: (json['inquiry'] as List<dynamic>?)
          ?.map((e) => LanguageText.fromJson(e as Map<String, dynamic>))
          .toList(),
      payment: (json['payment'] as List<dynamic>?)
          ?.map((e) => LanguageText.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FreeTextToJson(FreeText instance) => <String, dynamic>{
      'inquiry': instance.inquiry,
      'payment': instance.payment,
    };

LanguageText _$LanguageTextFromJson(Map<String, dynamic> json) => LanguageText(
      en: json['en'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$LanguageTextToJson(LanguageText instance) =>
    <String, dynamic>{
      'en': instance.en,
      'id': instance.id,
    };

Shopeepay _$ShopeepayFromJson(Map<String, dynamic> json) => Shopeepay(
      callbackUrl: json['callbackUrl'] as String?,
    );

Map<String, dynamic> _$ShopeepayToJson(Shopeepay instance) => <String, dynamic>{
      'callbackUrl': instance.callbackUrl,
    };

Gopay _$GopayFromJson(Map<String, dynamic> json) => Gopay(
      enableCallback: json['enableCallback'] as bool?,
      callbackUrl: json['callbackUrl'] as String?,
    );

Map<String, dynamic> _$GopayToJson(Gopay instance) => <String, dynamic>{
      'enableCallback': instance.enableCallback,
      'callbackUrl': instance.callbackUrl,
    };

Callbacks _$CallbacksFromJson(Map<String, dynamic> json) => Callbacks(
      finish: json['finish'] as String?,
    );

Map<String, dynamic> _$CallbacksToJson(Callbacks instance) => <String, dynamic>{
      'finish': instance.finish,
    };

UobEzpay _$UobEzpayFromJson(Map<String, dynamic> json) => UobEzpay(
      callbackUrl: json['callbackUrl'] as String?,
    );

Map<String, dynamic> _$UobEzpayToJson(UobEzpay instance) => <String, dynamic>{
      'callbackUrl': instance.callbackUrl,
    };

Expiry _$ExpiryFromJson(Map<String, dynamic> json) => Expiry(
      startTime: json['startTime'] as String?,
      unit: json['unit'] as String?,
      duration: (json['duration'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ExpiryToJson(Expiry instance) => <String, dynamic>{
      'startTime': instance.startTime,
      'unit': instance.unit,
      'duration': instance.duration,
    };

PageExpiry _$PageExpiryFromJson(Map<String, dynamic> json) => PageExpiry(
      duration: (json['duration'] as num?)?.toInt(),
      unit: json['unit'] as String?,
    );

Map<String, dynamic> _$PageExpiryToJson(PageExpiry instance) =>
    <String, dynamic>{
      'duration': instance.duration,
      'unit': instance.unit,
    };

Recurring _$RecurringFromJson(Map<String, dynamic> json) => Recurring(
      required: json['required'] as bool?,
      startTime: json['startTime'] as String?,
      intervalUnit: json['intervalUnit'] as String?,
    );

Map<String, dynamic> _$RecurringToJson(Recurring instance) => <String, dynamic>{
      'required': instance.required,
      'startTime': instance.startTime,
      'intervalUnit': instance.intervalUnit,
    };
