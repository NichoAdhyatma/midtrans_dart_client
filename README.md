Here's an updated `README.md` file with the new title "Midtrans Dart Client":

---

# Midtrans Dart Client Example

This is an example implementation using the `midtrans_client_flutter` package, which provides integration with Midtrans, a popular payment gateway in Southeast Asia. This example demonstrates how to initialize the Midtrans client, create a transaction, and retrieve a Snap token.

## Installation

To use `midtrans_client_flutter`, add it to your `pubspec.yaml` file:

```yaml
   midtrans_client_flutter:
    git:
      url: https://github.com/NichoAdhyatma/midtrans_client_flutter.git
      ref: main
  pretty_dio_logger: ^1.4.0
```

Run `flutter pub get` to install the package.

## Getting Started

Before starting, you'll need to sign up for a [Midtrans](https://midtrans.com/) account and obtain your `Client Key` and `Server Key`.

### Example Code

The following code initializes the `MidtransClientFlutter`, creates a transaction request, and fetches the Snap token.

```dart
import 'dart:developer';
import 'package:midtrans_client_flutter/midtrans_client_flutter.dart';

void main() async {
  // Initialize the MidtransClientFlutter
  MidtransClientFlutter.initialize(
    clientKey: 'YOUR-CLIENT-KEY',
    serverKey: 'YOUR-SERVER-KEY',
    midtransEnvironment: Environments.sandbox,
  );

  // Get the instance of MidtransClientFlutter
  final midtransClientFlutter = MidtransClientFlutter.instance;

  // Get the SnapRepository
  final snapRepository = midtransClientFlutter.snapRepository;

  // Create a TransactionRequest
  final transactionRequest = TransactionRequest(
    transactionDetails: TransactionDetails(
      orderId: '123456',
      grossAmount: 20000,
    ),
    creditCard: CreditCard(
      secure: true,
    ),
  );

  // Get the Snap Token
  final snapToken = await snapRepository.getSnapToken(transactionRequest);

  // Handle the response
  snapToken.fold(
    // Handle the error scenario
    (error) => log('Error: ${error.errorMessages}'),

    // Handle the success scenario
    (success) {
      log('Success: $success');
      log('Snap Token: ${success.token}');
      log('Redirect Url: ${success.redirectUrl}');
    },
  );
}
```

### How It Works

1. **Initialize Midtrans**: Set up the Midtrans client by providing your `Client Key` and `Server Key`. Use `Environments.sandbox` for testing and `Environments.production` for live transactions.
2. **Create a Transaction Request**: Define the transaction details such as `orderId`, `grossAmount`, and payment method (in this case, a secure credit card).
3. **Fetch Snap Token**: Retrieve the Snap token using the `getSnapToken` method. You can use this token to redirect users to Midtrans for payment processing.

### Error Handling

The example uses a `fold` function to handle both success and error scenarios:
- **Error**: Logs error messages if the token request fails.
- **Success**: Logs the Snap token and redirect URL if the request succeeds.

## License

This example code is provided under the MIT license.

## Resources

- [Midtrans Documentation](https://api-docs.midtrans.com/)
- [Midtrans Flutter SDK GitHub](https://github.com/Midtrans/)

---

This `README.md` provides a clear and concise guide for setting up and using the Midtrans Dart Client. Let me know if there's anything else to add!
