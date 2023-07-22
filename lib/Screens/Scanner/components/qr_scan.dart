import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../../../api/Manager/dialog_manager.dart';
import '../../../api/services/base_client.dart';
import '../../../utils/Components/animationScreen/animaton.dart';
import 'qr_scanner_overlay.dart';

const Color kScannerBg = Color.fromARGB(255, 255, 254, 254);

class QRScanner extends StatefulWidget {
  const QRScanner({super.key});

  @override
  State<QRScanner> createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner> with TickerProviderStateMixin {
  bool _isScanComplete = false;

  void closeScreen() {
    setState(() {
      _isScanComplete = false;
    });
  }

  late AnimationController _controller;
  late Animation<Alignment> _topAlignmentAnimation;
  late Animation<Alignment> _bottomAlignmentAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    topAnimation();
    bottomAnimation();
    _controller.repeat();
  }

  Animation<Alignment> bottomAnimation() {
    return _bottomAlignmentAnimation = TweenSequence<Alignment>(
      [
        TweenSequenceItem(
          tween: AlignmentTween(
            begin: Alignment.bottomCenter,
            end: Alignment.bottomCenter,
          ),
          weight: 1,
        ),
        TweenSequenceItem(
          tween: AlignmentTween(
            begin: Alignment.bottomCenter,
            end: Alignment.bottomCenter,
          ),
          weight: 1,
        ),
      ],
    ).animate(_controller);
  }

  Animation<Alignment> topAnimation() {
    return _topAlignmentAnimation = TweenSequence<Alignment>(
      [
        TweenSequenceItem(
          tween: AlignmentTween(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          weight: 1,
        ),
        TweenSequenceItem(
          tween: AlignmentTween(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
          weight: 1,
        ),
      ],
    ).animate(_controller);
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }
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
    MobileScannerController cameraController = MobileScannerController();
    return Scaffold(
      backgroundColor: kScannerBg,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kScannerBg,
        elevation: 0,
        title: const Text(
          'QR Scanner',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Expanded(
              child: Column(
                children: [
                  Text(
                    "Place the QR code inside the frame",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text("Scanning will be started automatically."),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Stack(
                children: [
                  MobileScanner(
                    // fit: BoxFit.contain,
                    controller: cameraController,
                    onDetect: (capture) async {
                      final List<Barcode> barcodes = capture.barcodes;
                      // ignore: unused_local_variable
                      final Uint8List? image = capture.image;

                      if (barcodes.isNotEmpty && !_isScanComplete) {
                        String code = barcodes.first.rawValue ?? '---';
                        for (final barcode in barcodes) {
                          debugPrint('Barcode found! ${barcode.rawValue}');
                        }
                        _isScanComplete = true;
                        await qrVerify(context, code);
                        return;
                      }
                    },
                  ),
                  AnimatedBg(
                      controller: _controller,
                      topAlignmentAnimation: _topAlignmentAnimation,
                      bottomAlignmentAnimation: _bottomAlignmentAnimation),
                  const QRScannerOverlay(overlayColour: Colors.white),
                ],
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: const Text(
                  "Developed by IndusianAssist",
                  style: TextStyle(
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
