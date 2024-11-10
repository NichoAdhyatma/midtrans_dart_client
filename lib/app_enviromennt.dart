enum Environments { production, sandbox }

extension EnvironmentsExtension on Environments {
  bool get isDev => this == Environments.sandbox;

  bool get isProduction => this == Environments.production;
}

class AppEnvironment {
  Environments _currentEnvironment = Environments.sandbox;

  setEnvironment(Environments value) => _currentEnvironment = value;

  Environments get getEnvironment => _currentEnvironment;

  final List<Map<String, String>> _availableSnapEnvironments = [
    {
      'env': Environments.sandbox.name,
      'url': 'https://app.sandbox.midtrans.com/snap/v1',
    },
    {
      'env': Environments.production.name,
      'url': 'https://app.midtrans.com/snap/v1',
    },
  ];

  final List<Map<String, String>> _availableCoreApiEnvironments = [
    {
      'env': Environments.sandbox.name,
      'url': 'https://api.sandbox.midtrans.com/v2',
    },
    {
      'env': Environments.production.name,
      'url': 'https://api.midtrans.com/v2',
    },
  ];

  String? getSnapApiBaseUrl() {
    return _availableSnapEnvironments.firstWhere(
      (envItem) => envItem['env'] == _currentEnvironment.name,
    )['url'];
  }

  String? getCoreApiBaseUrl() {
    return _availableCoreApiEnvironments.firstWhere(
      (envItem) => envItem['env'] == _currentEnvironment.name,
    )['url'];
  }
}
