import 'dart:ui';
import 'dart:math'; // Import to generate random layout
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'PlantData.dart';

class PlantDetailPage extends StatelessWidget {
  final String planta;

  const PlantDetailPage({super.key, required this.planta});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? plantInfo = plantData[planta] as Map<String, dynamic>?;

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
      body: Stack(
        children: [
          // Imagen de fondo
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/wal.png'), // Ruta de la imagen local
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
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (plantInfo != null) ...[
                    // Nombre de la planta
                    Text(
                      planta,
                      style: GoogleFonts.archivoNarrow(
                        textStyle: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    // Galería de imágenes de la planta (superior) usando URLs
                    plantInfo['images'] != null
                        ? SizedBox(
                      height: 150, // Altura de la galería
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: (plantInfo['images'] as List).length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.network(
                              (plantInfo['images'] as List<String>)[index],
                              height: 150,
                              width: 150,
                              fit: BoxFit.cover,
                              loadingBuilder: (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Center(
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes != null
                                        ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                        : null,
                                  ),
                                );
                              },
                              errorBuilder: (context, error, stackTrace) {
                                return Icon(Icons.error, color: Colors.red, size: 150);
                              },
                            ),
                          );
                        },
                      ),
                    )
                        : SizedBox(height: 0), // Espacio vacío si no hay imágenes
                    SizedBox(height: 16),
                    Text(
                      "Origen",
                      style: GoogleFonts.archivoNarrow(
                        textStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    SizedBox(height: 16),
                    // Descripción de la planta
                    Text(
                      plantInfo['description'] as String,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.archivoNarrow(
                        textStyle: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    // Título para las imágenes debajo de la descripción
                    Text(
                      "Más información",
                      style: GoogleFonts.archivoNarrow(
                        textStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    // Descripción de la planta
                    Text(
                      plantInfo['Usos'] as String,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.archivoNarrow(
                        textStyle: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    // Imágenes debajo de la descripción (extraImages) usando URLs
                    plantInfo['extraImages'] != null
                        ? Wrap(
                      spacing: 8.0,
                      runSpacing: 8.0,
                      children: (plantInfo['extraImages'] as List<String>)
                          .map((image) => Transform.rotate(
                        angle: (Random().nextDouble() - 0.5) * 0.1, // Rotates image randomly
                        child: Image.network(
                          image,
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes != null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            );
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(Icons.error, color: Colors.red, size: 100);
                          },
                        ),
                      ))
                          .toList(),
                    )
                        : SizedBox(height: 0),
                  ] else ...[
                    Text(
                      'No se encontró información para $planta.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.archivoNarrow(
                        textStyle: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
