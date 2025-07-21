import 'package:ht_email_client/ht_email_client.dart';
import 'package:ht_shared/ht_shared.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

// A mock implementation of the HtEmailClient for testing purposes.
class MockHtEmailClient extends Mock implements HtEmailClient {}

void main() {
  group('HtEmailClient', () {
    late HtEmailClient emailClient;

    setUp(() {
      emailClient = MockHtEmailClient();
    });

    test('can be implemented', () {
      expect(emailClient, isA<HtEmailClient>());
    });

    group('sendTransactionalEmail', () {
      const recipientEmail = 'test@example.com';
      const templateId = 'd-12345';
      const templateData = {'name': 'Test User'};

      test('completes normally when call is successful', () {
        when(
          () => emailClient.sendTransactionalEmail(
            recipientEmail: any(named: 'recipientEmail'),
            templateId: any(named: 'templateId'),
            templateData: any(named: 'templateData'),
          ),
        ).thenAnswer((_) async {});

        expect(
          emailClient.sendTransactionalEmail(
            recipientEmail: recipientEmail,
            templateId: templateId,
            templateData: templateData,
          ),
          completes,
        );
      });

      test('throws HtHttpException when call fails', () {
        const exception = ServerException('Failed to send email');
        when(
          () => emailClient.sendTransactionalEmail(
            recipientEmail: any(named: 'recipientEmail'),
            templateId: any(named: 'templateId'),
            templateData: any(named: 'templateData'),
          ),
        ).thenThrow(exception);

        expect(
          () => emailClient.sendTransactionalEmail(
            recipientEmail: recipientEmail,
            templateId: templateId,
            templateData: templateData,
          ),
          throwsA(isA<HtHttpException>()),
        );
      });
    });
  });
}
