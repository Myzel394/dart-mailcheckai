class MailCheckAIDomainResult {
  final String domain;
  final bool hasMXRecord;
  final bool isDisposable;
  final String? didYouMean;

  const MailCheckAIDomainResult({
    required this.domain,
    required this.hasMXRecord,
    required this.isDisposable,
    this.didYouMean,
  });

  static MailCheckAIDomainResult parse(Map<String, dynamic> json) {
    return MailCheckAIDomainResult(
      domain: json['domain'],
      hasMXRecord: json['mx'],
      isDisposable: json['disposable'],
      didYouMean: json['did_you_mean'],
    );
  }
}

class MailCheckAIEMailResult {
  final String email;
  final String domain;
  final bool hasMXRecord;
  final bool isDisposable;
  final bool isAlias;
  final String? didYouMean;

  const MailCheckAIEMailResult({
    required this.email,
    required this.domain,
    required this.hasMXRecord,
    required this.isDisposable,
    required this.isAlias,
    this.didYouMean,
  });

  static MailCheckAIEMailResult parse(Map<String, dynamic> json) {
    return MailCheckAIEMailResult(
      email: json['email'],
      domain: json['domain'],
      hasMXRecord: json['mx'],
      isDisposable: json['disposable'],
      isAlias: json['alias'],
      didYouMean: json['did_you_mean'],
    );
  }
}
