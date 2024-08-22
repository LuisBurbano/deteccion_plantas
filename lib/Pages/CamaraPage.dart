import 'package:camera/camera.dart';
import 'package:deteccion_plantas/Controller/ScanController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CamaraPage extends StatelessWidget {
  const CamaraPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ScanController>(
        init: ScanController(),
        builder: (controller) {
          return controller.isCameraInitialized.value ? CameraPreview(controller.cameraController):
          const Center(child: Text("Cargando..."),);
        }
      ),
    );
  }
}
