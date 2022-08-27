import 'package:mailcheckai/mailcheckai.dart';
import 'package:test/test.dart';

void main() {
  group('Domain validation', () {
    test('works with non-disposable domain', () async {
      final result = await MailCheckManager.validateDomain('google.com');

      expect(result.domain, 'google.com');
      expect(result.hasMXRecord, true);
      expect(result.isDisposable, false);
    });

    test('works with valid domain', () async {
      final result = await MailCheckManager.validateDomain('a-1.site');

      expect(result.domain, 'a-1.site');
      expect(result.isDisposable, true);
    });
  });

  group('Email validation', () {
    test('works with non-disposable domain', () async {
      final result =
          await MailCheckManager.validateEmail('johnmaynard@google.com');

      expect(result.email, 'johnmaynard@google.com');
      expect(result.domain, 'google.com');
      expect(result.hasMXRecord, true);
      expect(result.isDisposable, false);
    });

    test('works with non-disposable alias domain', () async {
      final result = await MailCheckManager.validateEmail(
          'johnmaynard+alias@protonmail.com');

      expect(result.email, 'johnmaynard+alias@protonmail.com');
      expect(result.domain, 'protonmail.com');
      expect(result.hasMXRecord, true);
      expect(result.isDisposable, false);
    });
  });
}
