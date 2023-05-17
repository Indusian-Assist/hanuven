import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:hanuven/Screens/Scanner/components/scan_result.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../../../utils/Components/animationScreen/animaton.dart';
import '../../../utils/Components/custom_page_route.dart';
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

  @override
  Widget build(BuildContext context) {
    MobileScannerController cameraController = MobileScannerController();
    return Scaffold(
      backgroundColor: kScannerBg,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kScannerBg,
        elevation: 0,
        title: Text(
          'QR Scanner',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Container(
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
            ),
            Expanded(
              flex: 3,
              child: Stack(
                children: [
                  MobileScanner(
                    // fit: BoxFit.contain,
                    controller: cameraController,
                    onDetect: (capture) {
                      final List<Barcode> barcodes = capture.barcodes;
                      // ignore: unused_local_variable
                      final Uint8List? image = capture.image;

                      if (barcodes.isNotEmpty && !_isScanComplete) {
                        String code = barcodes.first.rawValue ?? '---';
                        for (final barcode in barcodes) {
                          debugPrint('Barcode found! ${barcode.rawValue}');
                        }
                        _isScanComplete = true;
                        Navigator.pushReplacement(
                          context,
                          CustomPageRoute(
                              child: ResultScreen(
                                  closeScreen: closeScreen, code: code),
                              direction: AxisDirection.up),
                        );
                        return;
                      }
                    },
                  ),
                  AnimatedBg(
                      controller: _controller,
                      topAlignmentAnimation: _topAlignmentAnimation,
                      bottomAlignmentAnimation: _bottomAlignmentAnimation),
                  QRScannerOverlay(overlayColour: Colors.white),
                ],
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Text(
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
