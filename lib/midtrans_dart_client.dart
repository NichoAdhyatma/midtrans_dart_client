library midtrans_dart_client;

import 'package:midtrans_dart_client/repository/snap_repository.dart';
import 'app_environment.dart';

export 'app_environment.dart';

/// A client to interact with Midtrans APIs. Ensure to call [initialize] to configure it with required credentials.
class MidtransClient {
  /// [clientKey] - obtained from the Midtrans Dashboard, used for client-side requests.
  final String clientKey;

  /// [serverKey] - obtained from the Midtrans Dashboard, used for server-side requests.
  final String serverKey;

  /// [environment] - sets the API environment, either sandbox or production.
  static final AppEnvironment _environment = AppEnvironment();

  /// Repository to handle Snap API requests.
  late final SnapRepository _snapRepository;

  // Private constructor for singleton pattern
  MidtransClient._internal({
    required this.clientKey,
    required this.serverKey,
  });

  static MidtransClient? _instance;

  /// Initializes the Midtrans Client with required keys and environment.
  /// Call this method once at the start of your application.
  ///
  /// Example:
  /// ```dart
  /// MidtransClient.initialize(
  ///   clientKey: 'your-client-key',
  ///   serverKey: 'your-server-key',
  ///   midtransEnvironment: Environments.sandbox,
  /// );
  /// ```
  static void initialize({
    required String clientKey,
    required String serverKey,
    required Environments midtransEnvironment,
  }) {
    if (_instance != null) {
      throw Exception('MidtransClient has already been initialized.');
    }

    _instance = MidtransClient._internal(
      clientKey: clientKey,
      serverKey: serverKey,
    );

    _instance!._snapRepository = SnapRepository();

    _environment.setEnvironment(midtransEnvironment);
  }

  /// Provides the singleton instance of [MidtransClient].
  /// Throws an exception if [initialize] was not called.
  static MidtransClient get instance {
    if (_instance == null) {
      throw Exception(
        'MidtransClient has not been initialized. '
        'Please call MidtransClient.initialize(clientKey: "your-client-key", serverKey: "your-server-key", midtransEnvironment: Environments.sandbox) '
        'in your main method or app initialization before accessing the instance.',
      );
    }
    return _instance!;
  }

  /// Provides the SnapRepository instance.
  SnapRepository get snapRepository => _snapRepository;

  /// Sets the API environment, either sandbox or production.
  void setEnvironment(Environments midtransEnvironment) {
    _environment.setEnvironment(midtransEnvironment);
  }

  /// App Environment instance getter.
  AppEnvironment get environment => _environment;
}
