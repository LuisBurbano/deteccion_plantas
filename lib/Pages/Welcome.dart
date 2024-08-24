import 'package:deteccion_plantas/Pages/CamaraPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF200122), // Color #200122
              Color(0xFF6f0000), // Color #6f0000
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Título
              Text(
                'Detector de Plantas',
                style: GoogleFonts.archivoNarrow(
                  textStyle: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),

              //gif
              Image.asset(
                'assets/images/plantas.gif',
                width: 100,
                height: 100,
              ),
              SizedBox(height: 20),

              // Nombres de los autores
              Text(
                'Luis Burbano\nSteven Pozo',
                style: GoogleFonts.archivoNarrow(
                  textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
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
                child: Text('Comenzar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
