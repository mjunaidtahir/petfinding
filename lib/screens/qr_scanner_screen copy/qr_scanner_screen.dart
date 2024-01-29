import 'package:qr_scanner_overlay/qr_scanner_overlay.dart';
import 'package:flutter/material.dart';

class QrScannerScreen extends StatelessWidget {
  const QrScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: ElevatedButton(onPressed: () {}, child: const Text("Next")),
      ),
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              "Scan Bike QR-Code",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
          Expanded(
            child: QRScannerOverlay(
              overlayColor: Colors.white,
              borderColor: Colors.grey.shade700,
            ),
          )
        ],
      ),
    );
  }
}
