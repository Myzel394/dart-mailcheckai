class RateLimitError implements Exception {
  RateLimitError();
}

class MailCheckAiError implements Exception {
  final String message;

  MailCheckAiError({
    required this.message,
  });
}
