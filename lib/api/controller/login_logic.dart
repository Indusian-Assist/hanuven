import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Manager/session_token_manager.dart';

Future<String> login(String phoneNumber) async {
  // Step 1: Get CSRF Token & Cookie
  var (cookie, csrfToken) = await generateCookieString();
  // Step 2: Perform Login
  http.Response response = await http.post(
    Uri.parse('https://hanuven.vercel.app/api/auth/callback/credentials'),
    headers: {'cookie': cookie},
    body: {
      "phoneNumber": phoneNumber,
      'json': 'true',
      'csrfToken': csrfToken.split('%')[0],
    },
  );
  // Step 3: Save the Cookie
  await saveCookiesToLocalStorage(response.headers['set-cookie']!);
  return response.body;
}

// Verify OTP
Future<String> verifyOTP(String phoneNumber, String otp) async {
  // Step 1: Get CSRF Token & Cookie
  var (cookie, csrfToken) = await generateCookieString();
  // Step 2: Perform Login
  http.Response response = await http.post(
    Uri.parse('https://hanuven.vercel.app/api/auth/callback/credentials'),
    headers: {'cookie': cookie},
    body: {
      "phoneNumber": phoneNumber,
      "otp": otp,
      'json': 'true',
      'csrfToken': csrfToken.split('%')[0],
    },
  );
  // Step 3: Save the Cookie
  await saveCookiesToLocalStorage(response.headers['set-cookie']!);
  return response.body;
}

// Logout & delete cookies
Future<void> logout(context) async {
  var cookies = await generateCookieString();
  http.Response response = await http.post(
    Uri.parse('https://hanuven.vercel.app/api/auth/callback/credentials'),
    headers: {'cookie': cookies.toString()},
  );
  debugPrint(response.body);
  var pref = await SharedPreferences.getInstance();
  pref.remove('authToken');
  pref.remove('csrfToken');
  debugPrint("Auth Token: ${pref.getString('authToken')} \nCsrf Token: ${pref.getString('csrfToken')}");
  (await checkUser()) == false
                ? Navigator.pushNamed(context, '/login')
                : Navigator.pushNamed(context, '/home');
}

