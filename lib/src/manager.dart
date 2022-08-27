import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mailcheckai/src/constants.dart';

import 'exceptions.dart';
import 'foreign_types.dart';

class MailCheckManager {
  static Future<Map<String, dynamic>> _get(
    final String url, {
    final String? apiKey,
  }) async {
    final uri = Uri.parse(url);

    final response = await http.get(
      uri,
      headers: apiKey == null
          ? {}
          : {
              'Authorization': 'Bearer $apiKey',
            },
    );

    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body);
      case 400:
        final data = jsonDecode(response.body);

        throw MailCheckAIError(
          message: data['error'],
        );
      case 404:
        throw MailCheckAIError(
          message:
              'mailcheck returned 404, did you forget to provide a domain/email?"',
        );
      case 429:
        throw RateLimitError();
      default:
        throw Exception(
          'MailCheckAI has changed its API while this code is still on it\'s old version. Please open an issue on GitHub.',
        );
    }
  }

  static Future<MailCheckAIDomainResult> validateDomain(
    final String domain, {
    final String? apiKey,
  }) async {
    final url = '$BASE_URL/domain/$domain';
    final data = await _get(url, apiKey: apiKey);

    return MailCheckAIDomainResult.parse(data);
  }

  static Future<MailCheckAIEMailResult> validateEmail(
    final String email, {
    final String? apiKey,
  }) async {
    final url = '$BASE_URL/email/$email';
    final data = await _get(url, apiKey: apiKey);

    return MailCheckAIEMailResult.parse(data);
  }
}
