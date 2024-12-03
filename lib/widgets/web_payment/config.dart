import 'package:flutter/foundation.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:midtrans_dart_client/models/request/transaction_request.dart';
import 'package:midtrans_dart_client/models/response/core/transaction_status_response.dart';
import 'package:midtrans_dart_client/repository/core_repository.dart';
import 'package:midtrans_dart_client/repository/snap_repository.dart';

WebViewEnvironment? webViewEnvironment;

void initPaymentWidget() async {
  if (!kIsWeb && defaultTargetPlatform == TargetPlatform.windows) {
    final availableVersion = await WebViewEnvironment.getAvailableVersion();
    assert(availableVersion != null,
    'Failed to find an installed WebView2 Runtime or non-stable Microsoft Edge installation.');

    webViewEnvironment = await WebViewEnvironment.create(
        settings:
        WebViewEnvironmentSettings(userDataFolder: 'midtrans_payment'));
  }

  if (!kIsWeb && defaultTargetPlatform == TargetPlatform.android) {
    await InAppWebViewController.setWebContentsDebuggingEnabled(kDebugMode);
  }

  PlatformInAppWebViewController.debugLoggingSettings.excludeFilter.add(
    RegExp(r"onScrollChanged"),
  );
}

class TokenController {
  final SnapRepository _snapRepository = SnapRepository();
  final CoreRepository _coreRepository = CoreRepository();

  Future<String?> getSnapUrl(TransactionRequest transaction) async {
    final result = await _snapRepository.getSnapToken(transaction);

    return result.match(
          (error) => error.errorMessages?.first,
          (success) => success.redirectUrl,
    );
  }

  Future<TransactionStatusResponse?> getTransactionStatus(String orderId) async {
    final result = await _coreRepository.getTransactionStatus(orderId);

    return result.match(
          (error) => null,
          (success) => success,
    );
  }
}