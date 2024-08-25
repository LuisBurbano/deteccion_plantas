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
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF0A0A0A),
              Color(0xFF0A0A0A),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: GetBuilder<ScanController>(
          init: ScanController(),
          builder: (controller) {
            final cleanedLabel = _cleanPlantLabel(controller.label);
            return controller.isCameraInitialized.value
                ? Stack(
              children: [
                Center(
                  child: CameraPreview(controller.cameraController),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.67,
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
                          "Esta es una $cleanedLabel",
                          style: const TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                        if (controller.label != "ninguna planta detectada")
                          IconButton(
                            icon: Icon(Icons.explore, color: Colors.white),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PlantDetailPage(planta: cleanedLabel),
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
      ),
    );
  }

  String _cleanPlantLabel(String label) {
    // Eliminar números y espacios al principio del texto
    return label.replaceFirst(RegExp(r'^\d+\s*'), '');
  }
}

