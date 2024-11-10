library midtrans_client_flutter;

import 'package:midtrans_client_flutter/repository/snap_repository.dart';

import 'app_enviromennt.dart';
export 'app_enviromennt.dart';
export 'package:midtrans_client_flutter/models/request/transaction_request.dart';
export 'package:midtrans_client_flutter/models/response/snap_success_response.dart';
export 'package:midtrans_client_flutter/models/response/midtrans_error_response.dart';
export 'package:midtrans_client_flutter/repository/snap_repository.dart';

/// A Midtrans Client for Flutter, call [initialize] method to initialize it. before using it.
class MidtransClientFlutter {
  ///[clientKey] is a key that you get from Midtrans Dashboard
  final String clientKey;

  ///[serverKey] is a key that you get from Midtrans Dashboard
  final String serverKey;

  ///[environment] is an enum with two values [Environments.production] and [Environments.sandbox]
  static AppEnvironment environment = AppEnvironment();

  ///[snapRepository] is a repository class for Snap API
  late final SnapRepository snapRepository;

  MidtransClientFlutter._internal({
    required this.clientKey,
    required this.serverKey,
  });

  static MidtransClientFlutter? _instance;

  ///Initialize it with your [clientKey] , [serverKey] and [midtransEnvironment].
  ///[midtransEnvironment] is an enum with two values [Environments.production] and [Environments.sandbox]
  static void initialize({
    required String clientKey,
    required String serverKey,
    required Environments midtransEnvironment,
  }) {
    _instance ??= MidtransClientFlutter._internal(
      clientKey: clientKey,
      serverKey: serverKey,
    );

    if(_instance != null) _instance!.snapRepository = SnapRepository();

    environment.setEnvironment(midtransEnvironment);
  }

  /// Get the instance of [MidtransClientFlutter]
  static MidtransClientFlutter get instance {
    if (_instance == null) {
      throw Exception(
        'MidtransClientFlutter has not been initialized. '
        'Please call MidtransClientFlutter(clientKey: "your-client-key", serverKey: "your-server-key") '
        'in your main method or app initialization before accessing the instance.',
      );
    }
    return _instance!;
  }
}
