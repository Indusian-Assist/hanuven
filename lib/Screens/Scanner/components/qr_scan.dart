// import 'package:flutter/material.dart';
// import 'package:mobile_scanner/mobile_scanner.dart';

// class QRScanner extends StatefulWidget {
//   @override
//   _QRScannerState createState() => _QRScannerState();
// }

// class _QRScannerState extends State<QRScanner> {
//   String _qrCodeResult = '';

//   Future<void> _scanQRCode() async {
//     try {
//       final qrCodeResult = await MobileScanner.scanQRCode();
//       setState(() {
//         _qrCodeResult = qrCodeResult;
//       });
//     } on Exception catch (e) {
//       setState(() {
//         _qrCodeResult = 'Error scanning QR code: $e';
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('QR Scanner'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'Scan Result:',
//               style: TextStyle(fontSize: 20),
//             ),
//             SizedBox(height: 20),
//             Text(
//               _qrCodeResult,
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _scanQRCode,
//         tooltip: 'Scan QR Code',
//         child: Icon(Icons.qr_code_scanner),
//       ),
//     );
//   }
// }
