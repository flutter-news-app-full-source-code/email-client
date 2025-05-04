import 'package:ht_email_client/ht_email_client.dart';
import 'package:test/test.dart';

void main() {
  group('HtEmailClient Interface', () {
    test('type is exported', () {
      // This test simply checks that the abstract class type is accessible.
      // It doesn't instantiate it.
      expect(HtEmailClient, isA<Type>());
    });
  });
}
