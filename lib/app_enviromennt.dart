enum Environments { production, sandbox }

extension EnvironmentsExtension on Environments {
  bool get isDev => this == Environments.sandbox;

  bool get isProduction => this == Environments.production;
}

class AppEnvironment {
  static Environments _currentEnvironment = Environments.sandbox;

  static setEnvironment(Environments value) => _currentEnvironment = value;

  static Environments get getEnvironment => _currentEnvironment;

  static final List<Map<String, String>> _availableSnapEnvironments = [
    {
      'env': Environments.sandbox.name,
      'url': 'https://app.sandbox.midtrans.com/snap/v1',
    },
    {
      'env': Environments.production.name,
      'url': 'https://app.midtrans.com/snap/v1',
    },
  ];

  static String? getSnapApiBaseUrl() {
    return _availableSnapEnvironments.firstWhere(
          (envItem) => envItem['env'] == _currentEnvironment.name,
    )['url'];
  }
}