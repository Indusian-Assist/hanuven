import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../models/user.dart';

// Function 1: Text to JSON Cookies Converter return auth token
Map<String, String> textToJsonCookies(String cookiesText) {
  List<String> cookiesList = cookiesText.split('; ');
  Map<String, String> cookiesMap = {};
  for (String cookie in cookiesList) {
    List<String> datas = cookie.split(',');
    for (String data in datas) {
      try {
        List<dynamic> cookieParts = data.split('=');
        String key = cookieParts[0];
        String value = cookieParts[1];
        cookiesMap[key] = value;
        // ignore: empty_catches
      } catch (e) {}
    }
  }
  // return next auth
  return cookiesMap;
}

// Function 2: CSRF Generator
Future<String> generateCsrf() async {
  http.Response csrfResponse = await http.post(
    Uri.parse('https://hanuven.vercel.app/api/auth/callback/credentials'),
    body: {'json': 'true'},
  );
  String csrfToken = textToJsonCookies(
          csrfResponse.headers['set-cookie']!)['__Host-next-auth.csrf-token']
      .toString();

  var pref = await SharedPreferences.getInstance();
  pref.setString('csrfToken', csrfToken);
  return csrfToken;
}

// Function 3: Cookie String Generator
Future<(String, String)> generateCookieString() async {
  var prefs = await SharedPreferences.getInstance();
  // Get Locally Saved data
  var csrfToken = prefs.getString('csrfToken') ?? await generateCsrf();
  var authToken = prefs.getString('authToken');

  // Verify Weather the CsrfToken is stored Or Not
  var store = jsonToTextCookies({
    '__Host-next-auth.csrf-token': csrfToken,
    '__Secure-next-auth.session-token': authToken ?? '',
  });
  return (store, csrfToken);
}

// Function 4: Cookie Saver
Future<void> saveCookiesToLocalStorage(String cookieString) async {
  var cookieJson = textToJsonCookies(cookieString);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  try {
    await prefs.setString(
        'csrfToken', cookieJson['__Host-next-auth.csrf-token']!);
  } catch (e) {}
  try {
    await prefs.setString(
        'authToken', cookieJson['__Secure-next-auth.session-token']!);
  } catch (e) {}
}

// Function 5: Json to Text Cookies Converter
String jsonToTextCookies(Map<String, String> cookiesMap) {
  String cookiesText = '';
  for (String? key in cookiesMap.keys) {
    // if value is null, skip
    if (cookiesMap[key] == '') continue;
    String value = cookiesMap[key]!;
    cookiesText += '$key=$value; ';
  }
  return cookiesText;
}

// Function 6: Get Csrftoken from Local Storage
Future<String> getCsrfToken() async {
  var prefs = await SharedPreferences.getInstance();
  var csrfToken = prefs.getString('csrfToken');
  csrfToken ??= await generateCsrf();
  return csrfToken;
}

// Function 8: check user
Future<bool> checkUser() async {
  var cookies = await generateCookieString();
  http.Response response = await http.get(
    Uri.parse('https://hanuven.vercel.app/api/auth/session'),
    headers: {'cookie': cookies.toString()},
  );
  // save cookies
  await saveCookiesToLocalStorage(response.headers['set-cookie']!);

  // check if the user is logged in or not
  var pref = await SharedPreferences.getInstance();
  debugPrint(
      "Auth Token: ${pref.getString('authToken')} \nCsrf Token: ${pref.getString('csrfToken')}");
  debugPrint(response.body); // print name of the user
  // debugPrint(fetchUserData);
  if (response.body.contains('phone')) {
    return true;
  } else {
    return false;
  }
}

// Function 9: check the error message from  {"url":"https://hanuven.vercel.app/api/auth/error?error=Use-Old-Otp"} by splitting the url
Future<String> checkErrorMessage(String url) async {
  var error = url.split('=')[1].split('"')[0].replaceAll('-', ' ');
  return error;
}
