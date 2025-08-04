import 'package:core/core.dart';

/// {@template email_client}
/// Defines the interface for sending emails within the backend system.
///
/// Concrete implementations (e.g., using specific email providers like
/// SendGrid, AWS SES, or a local SMTP server for testing) will handle the
/// actual email dispatch.
/// {@endtemplate}
abstract class EmailClient {
  /// {@macro email_client}
  const EmailClient();

  /// Sends a transactional email using a pre-defined template.
  ///
  /// This method is designed to be provider-agnostic, relying on the email
  /// service (e.g., SendGrid, AWS SES) to manage the actual email content
  /// via templates. This decouples the application logic from the email
  /// presentation layer.
  ///
  /// - [senderEmail]: The email address of the sender.
  /// - [recipientEmail]: The email address of the recipient.
  /// - [subject]: The subject line of the email.
  /// - [templateId]: The unique identifier for the dynamic template stored in
  ///   the email service provider.
  /// - [templateData]: A map of dynamic data to be merged into the template.
  ///   For example: `{'otpCode': '123456', 'username': 'Alex'}`.
  ///
  /// Throws [HttpException] or its subtypes on failure:
  /// - [InvalidInputException] if input parameters are invalid.
  /// - [NetworkException] for connectivity issues with the email service.
  /// - [ServerException] if the email service reports a server-side error.
  /// - [OperationFailedException] for other unexpected errors during sending.
  Future<void> sendTransactionalEmail({
    required String senderEmail,
    required String recipientEmail,
    required String subject,
    required String templateId,
    required Map<String, dynamic> templateData,
  });
}
