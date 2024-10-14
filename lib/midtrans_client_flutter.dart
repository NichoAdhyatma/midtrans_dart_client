library midtrans_client_flutter;

/// A Midtrans Client for Flutter.
class MidtransClientFlutter {
  final String clientKey;
  final String serverKey;

  MidtransClientFlutter._internal({
    required this.clientKey,
    required this.serverKey,
  });

  static MidtransClientFlutter? _instance;

  factory MidtransClientFlutter({
    required String clientKey,
    required String serverKey,
  }) {
    _instance ??= MidtransClientFlutter._internal(
      clientKey: clientKey,
      serverKey: serverKey,
    );


    return _instance!;
  }

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
