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
  });
}
