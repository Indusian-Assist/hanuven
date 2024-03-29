import 'dart:async';
import 'dart:convert';
import 'dart:io';

// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

import '../../api/services/app_exceptions.dart';
import '../Manager/session_token_manager.dart';

class BaseClient {
  // ignore: constant_identifier_names
  static const int TIME_OUT_DURATION = 20;
  // static var client = http.Client();
  // GET request
  Future<dynamic> get(String baseUrl, String api) async {
    var uri = Uri.parse(baseUrl + api);
    try {
      var cookies = await generateCookieString();
      var response = await http.get(uri, headers: {
        'cookie': cookies.toString()
      }).timeout(const Duration(seconds: TIME_OUT_DURATION));
      // save cookies to local storage (update csrfToken)
      await saveCookiesToLocalStorage(response.headers['set-cookie']!);
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }

  // POST request
  Future<dynamic> post(String baseUrl, String api, dynamic payloadObj) async {
    var uri = Uri.parse(baseUrl + api);
    var payload = json.encode(payloadObj);
    try {
      var response = await http
          .post(uri, body: payload)
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }

  dynamic _processResponse(http.Response response) {
    final responseBody = response.body;
    switch (response.statusCode) {
      case 200:
        return responseBody;
      case 201:
        return responseBody;
      case 400:
        throw BadRequestException(
          responseBody,
          response.request!.url.toString(),
        );
      case 401:
        throw BadRequestException(
          responseBody,
          response.request!.url.toString(),
        );
      case 403:
        throw UnauthorisedException(
          responseBody,
          response.request!.url.toString(),
        );
      case 404:
        throw Exception('Not found');
      case 500:
        throw Exception('Internal server error');
      default:
        throw FetchDataException(
          "Error occurred with code: ${response.statusCode}",
          response.request!.url.toString(),
        );
    }
  }

}
