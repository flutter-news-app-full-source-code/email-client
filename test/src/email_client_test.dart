import 'package:email_client/email_client.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

// A mock implementation of the EmailClient for testing purposes.
class MockEmailClient extends Mock implements EmailClient {}

void main() {
  group('EmailClient', () {
    late EmailClient emailClient;
    setUp(() {
      emailClient = MockEmailClient();
    });

    test('can be implemented', () {
      expect(emailClient, isA<EmailClient>());
    });
  });
}
