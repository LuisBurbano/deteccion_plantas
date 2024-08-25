import 'dart:ui';
import 'package:deteccion_plantas/Pages/CamaraPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Imagen de fondo
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/wallpaper.png'), // Ruta de la imagen
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
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Título
                Text(
                  'PLANT VISION',
                  style: GoogleFonts.nerkoOne(
                    textStyle: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),

                Text(
                  'Smart Plant Identifier',
                  style: GoogleFonts.eduVicWaNtBeginner(
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),

                // GIF
                Image.asset(
                  'assets/images/plantas.gif',
                  width: 100,
                  height: 100,
                ),
                SizedBox(height: 20),

                // Botón para redirigir a otra página
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CamaraPage(),
                      ),
                    );
                  },
                  child: Text('Start'),
                ),
              ],
            ),
          ),
          // Nombres de los autores al final de la pantalla
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '© 2024 Luis Burbano & Steven Pozo',
                style: GoogleFonts.archivoNarrow(
                  textStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
