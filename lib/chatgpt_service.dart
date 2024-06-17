import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GptAPI {
  final String apiKey = 'sk-G6QwkynisJCFz8D0427d78B22a3b4aB2Bb208547BdA33630';
  final Uri apiAddress;

  GptAPI()
      : apiAddress =
            Uri.parse('https://api.k' + 'ksj.org/v' + '1/chat/completions');

  Future<String> emitMessage(
      {required String message, String role = 'user'}) async {
    final requestBody = _formatRequestBody(message: message, role: role);
    final headers = _setHeaders();

    print('Sending request with headers: $headers');
    print('Sending request with body: $requestBody');

    try {
      final response = await http.post(
        apiAddress,
        headers: headers,
        body: requestBody,
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      return _parseResponse(response);
    } on http.ClientException catch (e) {
      print('HTTP error occurred: $e');
      return 'HTTP error occurred: $e';
    } catch (e) {
      print('Encountered error: $e');
      return 'Encountered error: $e';
    }
  }

  Map<String, String> _setHeaders() {
    return {
      'Content-Type': 'application/json; charset=utf-8',
      'Authorization': 'Bearer $apiKey',
    };
  }

  String _formatRequestBody({required String message, required String role}) {
    return json.encode({
      // 'model': 'gpt-3.5-turbo-16k',gpt-4o
      'model': 'gpt-4o',
      'messages': [
        {'role': 'system', 'content': _generateSystemMessage()},
        {'role': role, 'content': message},
      ],
    });
  }

  String _generateSystemMessage() {
    return "You are a passionate and friendly virtual sports coach and Assistant. Please answer the user's questions. Please determine the user's input language and answer in the same language. And avoid answering medical and health related content. With medical and health information you should include links to sources for the information. Refuse to answer medical and health related content.";
  }

  String _parseResponse(http.Response response) {
    if (response.statusCode == 200) {
      var responseBody = utf8.decode(response.bodyBytes);
      var decodedResponse = json.decode(responseBody);
      return decodedResponse['choices'][0]['message']['content'];
    } else {
      print('Failed to fetch response: ${response.statusCode}');
      return 'Failed to fetch response, please try again later. Status code: ${response.statusCode}';
    }
  }
}
