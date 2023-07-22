import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hanuven/api/Manager/dialog_manager.dart';
import 'package:hanuven/api/services/base_client.dart';
import 'package:hanuven/utils/constants/color.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ResultScreen extends StatelessWidget {
  final String code;
  final Function() closeScreen;

  const ResultScreen({
    super.key,
    required this.code,
    required this.closeScreen,
  });
  qrVerify(context, String code) async {
    var response = await BaseClient().post('https://hanuven.vercel.app',
        '/api/activation', {"qr": code.toString()}).catchError((err) {
      debugPrint(err.toString());
    });
    var message = json.decode(response);
    var status = message['verified'].toString();
    debugPrint(message.toString());
    if (status == "true") {
      Navigator.pushReplacementNamed(context, '/success');
      DialogManager.customSnackBar(
          context, message['message'].toString(), Colors.green);
    } else if(status == "false") {
      Navigator.pushReplacementNamed(context, '/error');
      DialogManager.customSnackBar(
          context, message['message'].toString(), Colors.red);
    }
    // Navigator.pushReplacementNamed(context, '/success');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            closeScreen();
            // Navigator.pop(context);
            Navigator.pushReplacementNamed(context, '/home');
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
        ),
        title: const Text(
          'QR Scanner',
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
              letterSpacing: 1),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // scanned QR code here
              QrImageView(
                data: code,
                version: QrVersions.auto,
                size: 200,
              ),
              const Text(
                'Scanned Result',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    letterSpacing: 1),
              ),
              const SizedBox(height: 20),
              const Text(
                'This is the result of the scanned QR code',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                code,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width - 100,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kSuccessColor,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    textStyle: const TextStyle(
                      letterSpacing: 1,
                    ),
                  ),
                  onPressed: () async {
                    Clipboard.setData(ClipboardData(text: code));
                    await qrVerify(context, code);

                    // buildCustomDialog(context);
                  },
                  child: const Text(
                    'Verify The QR Code',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<String?> buildCustomDialog(BuildContext context) {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Copied to clipboard'),
        content: const Text('it`s copied to clipboard'),
        actions: <Widget>[
          TextButton(
            onPressed: () {},
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
