import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
        ),
        title: Text(
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
              // QrImage(
              //   data: code,
              //   version: QrVersions.auto,
              //   size: 200.0,
              // ),
              Text(
                'Scanned Result',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    letterSpacing: 1),
              ),
              SizedBox(height: 20),
              Text(
                'This is the result of the scanned QR code',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Text(
                code,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width - 100,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kSuccessColor,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    textStyle: TextStyle(
                      letterSpacing: 1,
                    ),
                  ),
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: code));
                    Navigator.pushReplacementNamed(context, '/success');
                    // buildCustomDialog(context);
                  },
                  child: Text(
                    'Copy to clipboard',
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
