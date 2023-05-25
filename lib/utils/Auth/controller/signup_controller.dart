
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hanuven/utils/Auth/authentication_repository.dart';

class SignUpController extends GetxController{
  static SignUpController get instance => Get.find();

  // Text Editing Controllers
  final phoneNo = TextEditingController();

  // Get phone number from user and pass it to the phoneAuthentication function
  void phoneAuthentication(context, String phoneNo) async {
    AuthenticationRepository.instance.phoneAuthentication(context, phoneNo);
  }
}