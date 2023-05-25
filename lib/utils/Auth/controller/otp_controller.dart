
import 'package:get/get.dart';

import '../authentication_repository.dart';


class OPTController extends GetxController{
  static OPTController get instance => Get.find();

  // Get phone number from user and pass it to the phoneAuthentication function
  void verifyOTP(context, String otp) async {
    AuthenticationRepository.instance.verifyOTP(context, otp);
  }
}