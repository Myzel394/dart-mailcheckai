import 'package:mailcheckai/mailcheckai.dart';

void main() async {
  final domainResult = await MailCheckManager.validateDomain('protonmail.com');

  print(domainResult.hasMXRecord); // true
  print(domainResult.domain); // protonmail.com
  print(domainResult.isDisposable); // false
  print(domainResult.didYouMean); // Null

  final emailResult =
      await MailCheckManager.validateEmail('test@protoonmail.com');

  print(emailResult.domain); // protoonmail.com
  print(emailResult.email); // test@protoonmail.com
  print(emailResult.isDisposable); // false
  print(emailResult.hasMXRecord); // true
  print(emailResult.isAlias); // false
  print(emailResult.didYouMean); // test@protonmail.com
}
