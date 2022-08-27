class RateLimitError implements Exception {
  RateLimitError();
}

class MailCheckAIError implements Exception {
  final String message;

  MailCheckAIError({
    required this.message,
  });
}
