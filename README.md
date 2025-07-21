# ht_email_client

![coverage: percentage](https://img.shields.io/badge/coverage-XX-green)
[![style: very good analysis](https://img.shields.io/badge/style-very_good_analysis-B22C89.svg)](https://pub.dev/packages/very_good_analysis)
[![License: PolyForm Free Trial](https://img.shields.io/badge/License-PolyForm%20Free%20Trial-blue)](https://polyformproject.org/licenses/free-trial/1.0.0)

Defines the abstract interface for email clients used within the Headlines Toolkit backend system. This package provides the contract (`HtEmailClient`) that concrete implementations (e.g., SMTP, AWS SES, SendGrid clients) should adhere to.

## Getting Started

To use this package in your Dart backend project (like Dart Frog), add it to your `pubspec.yaml` file:

```yaml
dependencies:
  ht_email_client:
    git:
      url: https://github.com/headlines-toolkit/ht-email-client.git
      # Use a specific ref/tag for stability in production
      # ref: main 
```

Then run `dart pub get`.

## Features

*   **`HtEmailClient` Abstract Class:** Defines a generic, provider-agnostic interface for sending transactional emails. This approach decouples application logic from email content and styling, which can be managed directly within your email service provider (e.g., SendGrid, AWS SES).
    *   `Future<void> sendTransactionalEmail({required String senderEmail, required String recipientEmail, required String templateId, required Map<String, dynamic> templateData})`: Sends an email using a pre-defined template. Implementations must handle underlying service errors and map them to standard `ht_shared` exceptions.

## Usage

This package only provides the abstract interface. You need a concrete implementation package (e.g., `ht_email_sendgrid`) that implements `HtEmailClient`.

In your backend application (e.g., Dart Frog), you would typically:

1.  Depend on a concrete implementation package.
2.  Configure and provide an instance of the concrete client using dependency injection.
3.  Inject `HtEmailClient` into your services where email sending is required.

```dart
// Example (Conceptual - in a service or route handler)
import 'package:ht_email_client/ht_email_client.dart';
import 'package:ht_shared/ht_shared.dart';

class AuthService {
  const AuthService({required HtEmailClient emailClient}) 
    : _emailClient = emailClient;

  final HtEmailClient _emailClient;

  Future<void> sendVerificationEmail(String email, String otp) async {
    try {
      // Use the generic method to send an email via a template.
      // The template ID and data structure are managed by the email provider.
      await _emailClient.sendTransactionalEmail(
        senderEmail: 'noreply@example.com',
        recipientEmail: email,
        templateId: 'd-1234567890abcdef1234567890abcdef', // Example SendGrid Template ID
        templateData: {
          'otp_code': otp,
          'username': 'Valued User',
        },
      );
      // Handle success
    } on HtHttpException {
      // Handle specific email sending errors (e.g., log, return error response)
      rethrow; 
    }
  }
}
```

## License

This package is licensed under the [PolyForm Free Trial](LICENSE). Please review the terms before use.
