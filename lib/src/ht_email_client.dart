import 'package:ht_shared/ht_shared.dart';

/// {@template ht_email_client}
/// Defines the interface for sending emails within the backend system.
///
/// Concrete implementations (e.g., using specific email providers like
/// SendGrid, AWS SES, or a local SMTP server for testing) will handle the
/// actual email dispatch.
/// {@endtemplate}
abstract class HtEmailClient {
  /// {@macro ht_email_client}
  const HtEmailClient();

  /// Sends a One-Time Password (OTP) email to the specified recipient.
  ///
  /// Implementations are responsible for constructing the email content
  /// (subject, body) using the provided [otpCode] and sending it via
  /// their configured email service.
  ///
  /// Throws [HtHttpException] subtypes on failure:
  /// - [InvalidInputException] if the recipient email format is invalid.
  /// - [NetworkException] for connectivity issues with the email service.
  /// - [ServerException] if the email service reports a server-side error.
  /// - [OperationFailedException] for other unexpected errors during sending.
  Future<void> sendOtpEmail({
    required String recipientEmail,
    required String otpCode,
    // Optional: Add parameters like subject, templateId if needed later
  });

  // Add other email sending methods here as needed (e.g., sendWelcomeEmail)
}
