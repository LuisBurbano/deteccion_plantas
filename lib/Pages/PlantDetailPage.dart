import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'PlantData.dart';

class PlantDetailPage extends StatelessWidget {
  final String planta;

  const PlantDetailPage({super.key, required this.planta});

  @override
  Widget build(BuildContext context) {
    final plantInfo = plantData[planta];

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
        padding: const EdgeInsets.all(16.0),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (plantInfo != null) ...[
              // Plant name
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
              // Plant image
              plantInfo['image'] != null
                  ? Image.asset(
                plantInfo['image']!,
                height: 150,
                width: 150,
                fit: BoxFit.cover,
              )
                  : SizedBox(height: 0), // Empty space if no image
              SizedBox(height: 16),
              // Plant description
              Text(
                plantInfo['description']!,
                textAlign: TextAlign.center,
                style: GoogleFonts.archivoNarrow(
                  textStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
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
    );
  }
}
