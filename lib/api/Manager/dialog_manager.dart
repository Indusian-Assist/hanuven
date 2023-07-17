import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogManager {
  // show dialog
  void showErrorDialog({String title = 'Error', String description = ''}) {
    Get.dialog(
      Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(title, style: Get.textTheme.headline6),
              Text(description, style: Get.textTheme.bodyText2),
              ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Ok'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // show toast
  // show loading
  static void showLoading([String? message]) {
    Get.dialog(
      Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(height: 8.0),
              Text(message ?? 'Loading...'),
            ],
          ),
        ),
      ),
    );
  }

  // hide loading
  static void hideLoading() {
    if (Get.isDialogOpen ?? false) Get.back();
  }
  


  // show snackbar
  static ScaffoldFeatureController customSnackBar(BuildContext context, String error, Color color) {
    final snackBar = SnackBar(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          error.toUpperCase(),
          style: const TextStyle(color: Colors.white, letterSpacing: 1.5, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: color
          .withOpacity(0.8)
          .withAlpha(200),
    );

    return ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

}
