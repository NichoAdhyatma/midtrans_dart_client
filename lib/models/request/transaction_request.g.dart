// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionRequest _$TransactionRequestFromJson(Map<String, dynamic> json) =>
    TransactionRequest(
      transactionDetails: json['transaction_details'] == null
          ? null
          : TransactionDetails.fromJson(
              json['transaction_details'] as Map<String, dynamic>),
      itemDetails: (json['item_details'] as List<dynamic>?)
          ?.map((e) => ItemDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      customerDetails: json['customer_details'] == null
          ? null
          : CustomerDetails.fromJson(
              json['customer_details'] as Map<String, dynamic>),
      enabledPayments: (json['enabled_payments'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      creditCard: json['credit_card'] == null
          ? null
          : CreditCard.fromJson(json['credit_card'] as Map<String, dynamic>),
      bcaVa: json['bca_va'] == null
          ? null
          : Va.fromJson(json['bca_va'] as Map<String, dynamic>),
      bniVa: json['bni_va'] == null
          ? null
          : Va.fromJson(json['bni_va'] as Map<String, dynamic>),
      briVa: json['bri_va'] == null
          ? null
          : Va.fromJson(json['bri_va'] as Map<String, dynamic>),
      cimbVa: json['cimb_va'] == null
          ? null
          : Va.fromJson(json['cimb_va'] as Map<String, dynamic>),
      permataVa: json['permata_va'] == null
          ? null
          : Va.fromJson(json['permata_va'] as Map<String, dynamic>),
      shopeepay: json['shopeepay'] == null
          ? null
          : Shopeepay.fromJson(json['shopeepay'] as Map<String, dynamic>),
      gopay: json['gopay'] == null
          ? null
          : Gopay.fromJson(json['gopay'] as Map<String, dynamic>),
      callbacks: json['callbacks'] == null
          ? null
          : Callbacks.fromJson(json['callbacks'] as Map<String, dynamic>),
      uobEzpay: json['uob_ezpay'] == null
          ? null
          : UobEzpay.fromJson(json['uob_ezpay'] as Map<String, dynamic>),
      expiry: json['expiry'] == null
          ? null
          : Expiry.fromJson(json['expiry'] as Map<String, dynamic>),
      pageExpiry: json['page_expiry'] == null
          ? null
          : PageExpiry.fromJson(json['page_expiry'] as Map<String, dynamic>),
      recurring: json['recurring'] == null
          ? null
          : Recurring.fromJson(json['recurring'] as Map<String, dynamic>),
      customField1: json['custom_field_1'] as String?,
      customField2: json['custom_field_2'] as String?,
      customField3: json['custom_field_3'] as String?,
    );

Map<String, dynamic> _$TransactionRequestToJson(TransactionRequest instance) =>
    <String, dynamic>{
      'transaction_details': instance.transactionDetails?.toJson(),
      'item_details': instance.itemDetails?.map((e) => e.toJson()).toList(),
      'customer_details': instance.customerDetails?.toJson(),
      'enabled_payments': instance.enabledPayments,
      'credit_card': instance.creditCard?.toJson(),
      'bca_va': instance.bcaVa?.toJson(),
      'bni_va': instance.bniVa?.toJson(),
      'bri_va': instance.briVa?.toJson(),
      'cimb_va': instance.cimbVa?.toJson(),
      'permata_va': instance.permataVa?.toJson(),
      'shopeepay': instance.shopeepay?.toJson(),
      'gopay': instance.gopay?.toJson(),
      'callbacks': instance.callbacks?.toJson(),
      'uob_ezpay': instance.uobEzpay?.toJson(),
      'expiry': instance.expiry?.toJson(),
      'page_expiry': instance.pageExpiry?.toJson(),
      'recurring': instance.recurring?.toJson(),
      'custom_field_1': instance.customField1,
      'custom_field_2': instance.customField2,
      'custom_field_3': instance.customField3,
    };

TransactionDetails _$TransactionDetailsFromJson(Map<String, dynamic> json) =>
    TransactionDetails(
      orderId: json['order_id'] as String?,
      grossAmount: (json['gross_amount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TransactionDetailsToJson(TransactionDetails instance) =>
    <String, dynamic>{
      'order_id': instance.orderId,
      'gross_amount': instance.grossAmount,
    };

ItemDetails _$ItemDetailsFromJson(Map<String, dynamic> json) => ItemDetails(
      id: json['id'] as String?,
      price: (json['price'] as num?)?.toInt(),
      quantity: (json['quantity'] as num?)?.toInt(),
      name: json['name'] as String?,
      brand: json['brand'] as String?,
      category: json['category'] as String?,
      merchantName: json['merchant_name'] as String?,
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
      'merchant_name': instance.merchantName,
      'url': instance.url,
    };

CustomerDetails _$CustomerDetailsFromJson(Map<String, dynamic> json) =>
    CustomerDetails(
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      billingAddress: json['billing_address'] == null
          ? null
          : Address.fromJson(json['billing_address'] as Map<String, dynamic>),
      shippingAddress: json['shipping_address'] == null
          ? null
          : Address.fromJson(json['shipping_address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CustomerDetailsToJson(CustomerDetails instance) =>
    <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
      'phone': instance.phone,
      'billing_address': instance.billingAddress?.toJson(),
      'shipping_address': instance.shippingAddress?.toJson(),
    };

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
      city: json['city'] as String?,
      postalCode: json['postal_code'] as String?,
      countryCode: json['country_code'] as String?,
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
      'phone': instance.phone,
      'address': instance.address,
      'city': instance.city,
      'postal_code': instance.postalCode,
      'country_code': instance.countryCode,
    };

CreditCard _$CreditCardFromJson(Map<String, dynamic> json) => CreditCard(
      secure: json['secure'] as bool?,
      channel: json['channel'] as String?,
      bank: json['bank'] as String?,
      installment: json['installment'] == null
          ? null
          : Installment.fromJson(json['installment'] as Map<String, dynamic>),
      whitelistBins: (json['whitelist_bins'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      dynamicDescriptor: json['dynamic_descriptor'] == null
          ? null
          : DynamicDescriptor.fromJson(
              json['dynamic_descriptor'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreditCardToJson(CreditCard instance) =>
    <String, dynamic>{
      'secure': instance.secure,
      'channel': instance.channel,
      'bank': instance.bank,
      'installment': instance.installment?.toJson(),
      'whitelist_bins': instance.whitelistBins,
      'dynamic_descriptor': instance.dynamicDescriptor?.toJson(),
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
      merchantName: json['merchant_name'] as String?,
      cityName: json['city_name'] as String?,
      countryCode: json['country_code'] as String?,
    );

Map<String, dynamic> _$DynamicDescriptorToJson(DynamicDescriptor instance) =>
    <String, dynamic>{
      'merchant_name': instance.merchantName,
      'city_name': instance.cityName,
      'country_code': instance.countryCode,
    };

Va _$VaFromJson(Map<String, dynamic> json) => Va(
      vaNumber: json['va_number'] as String?,
      subCompanyCode: json['sub_company_code'] as String?,
      freeText: json['free_text'] == null
          ? null
          : FreeText.fromJson(json['free_text'] as Map<String, dynamic>),
      recipientName: json['recipient_name'] as String?,
    );

Map<String, dynamic> _$VaToJson(Va instance) => <String, dynamic>{
      'va_number': instance.vaNumber,
      'sub_company_code': instance.subCompanyCode,
      'free_text': instance.freeText,
      'recipient_name': instance.recipientName,
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
      callbackUrl: json['callback_url'] as String?,
    );

Map<String, dynamic> _$ShopeepayToJson(Shopeepay instance) => <String, dynamic>{
      'callback_url': instance.callbackUrl,
    };

Gopay _$GopayFromJson(Map<String, dynamic> json) => Gopay(
      enableCallback: json['enable_callback'] as bool?,
      callbackUrl: json['callback_url'] as String?,
    );

Map<String, dynamic> _$GopayToJson(Gopay instance) => <String, dynamic>{
      'enable_callback': instance.enableCallback,
      'callback_url': instance.callbackUrl,
    };

Callbacks _$CallbacksFromJson(Map<String, dynamic> json) => Callbacks(
      finish: json['finish'] as String?,
    );

Map<String, dynamic> _$CallbacksToJson(Callbacks instance) => <String, dynamic>{
      'finish': instance.finish,
    };

UobEzpay _$UobEzpayFromJson(Map<String, dynamic> json) => UobEzpay(
      callbackUrl: json['callback_url'] as String?,
    );

Map<String, dynamic> _$UobEzpayToJson(UobEzpay instance) => <String, dynamic>{
      'callback_url': instance.callbackUrl,
    };

Expiry _$ExpiryFromJson(Map<String, dynamic> json) => Expiry(
      startTime: json['start_time'] as String?,
      unit: json['unit'] as String?,
      duration: (json['duration'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ExpiryToJson(Expiry instance) => <String, dynamic>{
      'start_time': instance.startTime,
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
      startTime: json['start_time'] as String?,
      intervalUnit: json['interval_unit'] as String?,
    );

Map<String, dynamic> _$RecurringToJson(Recurring instance) => <String, dynamic>{
      'required': instance.required,
      'start_time': instance.startTime,
      'interval_unit': instance.intervalUnit,
    };
