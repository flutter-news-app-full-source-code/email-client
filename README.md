# email_client

![coverage: percentage](https://img.shields.io/badge/coverage-XX-green)
[![style: very good analysis](https://img.shields.io/badge/style-very_good_analysis-B22C89.svg)](https://pub.dev/packages/very_good_analysis)
[![License: PolyForm Free Trial](https://img.shields.io/badge/License-PolyForm%20Free%20Trial-blue)](https://polyformproject.org/licenses/free-trial/1.0.0)

This package provides the contract (`EmailClient`) that concrete implementations (e.g., SMTP, AWS SES, SendGrid clients) should adhere to.

## Getting Started

To use this package in your Dart backend project (like Dart Frog), add it to your `pubspec.yaml` file:

```yaml
dependencies:
  email_client:
    git:
      url: https://github.com/flutter-news-app-full-source-code/email-client.git
      # Use a specific ref/tag for stability in production
      # ref: main 
```

Then run `dart pub get`.

## Features

*   **`EmailClient` Abstract Class:** Defines a generic, provider-agnostic interface for sending transactional emails. This approach decouples application logic from email content and styling, which can be managed directly within your email service provider (e.g., SendGrid, AWS SES).
    *   `Future<void> sendTransactionalEmail({required String senderEmail, required String recipientEmail, required String subject, required String templateId, required Map<String, dynamic> templateData})`: Sends an email using a pre-defined template. Implementations must handle underlying service errors and map them to standard `core` exceptions.

## Usage

This package only provides the abstract interface. You need a concrete implementation package (e.g., `ht_email_sendgrid`) that implements `EmailClient`.

In your backend application (e.g., Dart Frog), you would typically:

1.  Depend on a concrete implementation package.
2.  Configure and provide an instance of the concrete client using dependency injection.
3.  Inject `EmailClient` into your services where email sending is required.

```dart
// Example (Conceptual - in a service or route handler)
import 'package:email_client/email_client.dart';
import 'package:core/core.dart';

class AuthService {
  const AuthService({required EmailClient emailClient}) 
    : _emailClient = emailClient;

  final EmailClient _emailClient;

  Future<void> sendVerificationEmail(String email, String otp) async {
    try {
      // Use the generic method to send an email via a template.
      // The template ID and data structure are managed by the email provider.
      await _emailClient.sendTransactionalEmail(
        senderEmail: 'noreply@example.com',
        recipientEmail: email,
        subject: 'Your Verification Code',
        templateId: 'd-1234567890abcdef1234567890abcdef', // Example SendGrid Template ID
        templateData: {
          'otp_code': otp,
          'username': 'Valued User',
        },
      );
      // Handle success
    } on HttpException {
      // Handle specific email sending errors (e.g., log, return error response)
      rethrow; 
    }
  }
}
```


## 🔑 Licensing

This package is source-available and licensed under the [PolyForm Free Trial 1.0.0](LICENSE). Please review the terms before use.

For commercial licensing options that grant the right to build and distribute unlimited applications, please visit the main [**Flutter News App - Full Source Code Toolkit**](https://github.com/flutter-news-app-full-source-code) organization.
