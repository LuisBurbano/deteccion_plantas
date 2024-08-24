import 'package:camera/camera.dart';
import 'package:deteccion_plantas/Controller/ScanController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'PlantDetailPage.dart';

class CamaraPage extends StatelessWidget {
  const CamaraPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ScanController>(
        init: ScanController(),
        builder: (controller) {
          return controller.isCameraInitialized.value
              ? Stack(
            children: [
              Center(
                child: CameraPreview(controller.cameraController),
              ),
              if (controller.label.isNotEmpty)
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.7,
                  left: 20,
                  right: 20,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Esta es una ${controller.label}",
                          style: const TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.explore, color: Colors.white),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PlantDetailPage(planta: controller.label),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          )
              : const Center(child: Text("Cargando..."));
        },
      ),
    );
  }
}
