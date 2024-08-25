import 'dart:ui';
import 'package:camera/camera.dart';
import 'package:deteccion_plantas/Controller/ScanController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'PlantDetailPage.dart';

class CamaraPage extends StatelessWidget {
  const CamaraPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Imagen de fondo
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/wallapper2.png'), // Ruta de la imagen
                fit: BoxFit.cover, // Ajusta la imagen al tamaño del contenedor
              ),
            ),
          ),
          // Efecto de difuminado
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
              color: Colors.black.withOpacity(0), // Ajusta la opacidad si es necesario
            ),
          ),
          // Contenido de la página
          GetBuilder<ScanController>(
            init: ScanController(),
            builder: (controller) {
              final cleanedLabel = _cleanPlantLabel(controller.label);
              return controller.isCameraInitialized.value
                  ? Stack(
                children: [
                  // Vista previa de la cámara
                  Center(
                    child: CameraPreview(controller.cameraController),
                  ),
                  // Texto superpuesto sobre la vista previa de la cámara
                  Positioned(
                    top: 30,
                    left: 20,
                    right: 20,
                    child: Container(
                      child: Column(
                        children: [

                          IconButton(
                            icon: Icon(Icons.arrow_back, color: Colors.white),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            iconSize: 30,
                          ),
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            child: Text(
                              'BACK', // Texto que quieres mostrar
                              style: GoogleFonts.eduVicWaNtBeginner(
                                textStyle: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  shadows: [
                                    Shadow(
                                      blurRadius: 10.0,
                                      color: Colors.black,
                                      offset: Offset(2.0, 2.0),
                                    ),
                                  ],
                                ),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.70,
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
                            style: GoogleFonts.eduVicWaNtBeginner(
                              textStyle: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                shadows: [
                                  Shadow(
                                    blurRadius: 10.0,
                                    color: Colors.black,
                                    offset: Offset(2.0, 2.0),
                                  ),
                                ],
                              ),
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
        ],
      ),
    );
  }

  String _cleanPlantLabel(String label) {
    // Eliminar números y espacios al principio del texto
    return label.replaceFirst(RegExp(r'^\d+\s*'), '');
  }
}
