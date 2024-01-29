import 'package:camera/camera.dart';
import 'package:find_my_pet/screens/add_pet_details/add_pet_details_screen.dart';
import 'package:find_my_pet/utils/app_navigator.dart';
import 'package:qr_scanner_overlay/qr_scanner_overlay.dart';
import 'package:flutter/material.dart';

class QrScannerScreen extends StatefulWidget {
  const QrScannerScreen({super.key});

  @override
  State<QrScannerScreen> createState() => _QrScannerScreenState();
}

class _QrScannerScreenState extends State<QrScannerScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  List<String> capturedImages = [];

  @override
  void initState() {
    super.initState();

    _initializeControllerFuture = _initializeController();
  }

  Future<void> _initializeController() async {
    final cameras = await availableCameras();
    if (cameras.isNotEmpty) {
      _controller = CameraController(cameras[0], ResolutionPreset.medium);

      await _controller.initialize();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool isLoading = false;
  void _captureImage() async {
    try {
      setState(() {
        isLoading = true;
      });
      await _initializeControllerFuture;

      final XFile file = await _controller.takePicture();

      capturedImages.add(file.path);
      if (capturedImages.length == 3 && context.mounted) {
        AppNavigator.pushReplacement(
            context, AddPetDetails(images: capturedImages));
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading = false;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: ElevatedButton(
          onPressed: () {
            _captureImage();
          },
          child: Text(capturedImages.length < 3 ? "Capture" : "Next"),
        ),
      ),
      appBar: AppBar(
        title: const Text("Scan or Capture Pet"),
      ),
      body: Stack(
        children: [
          FutureBuilder<void>(
            future: _initializeControllerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return CameraPreview(_controller);
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
          QRScannerOverlay(
            overlayColor: Colors.white,
            borderColor: Colors.grey.shade700,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: RichText(
              text: TextSpan(
                style: const TextStyle(color: Colors.black, fontSize: 17),
                children: <TextSpan>[
                  const TextSpan(
                      text: "Capture at least three pictures. You took "),
                  TextSpan(
                    text: '${capturedImages.length}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const TextSpan(text: " pictures"),
                ],
              ),
            ),
          ),
          if (isLoading) const LinearProgressIndicator(),
        ],
      ),
    );
  }
}
