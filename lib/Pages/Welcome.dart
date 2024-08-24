import 'package:deteccion_plantas/Pages/CamaraPage.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green[200]!, Colors.green[800]!],
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
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              // Icono de plantas
              Image.asset(
                'assets/images/plantas.gif', // Asegúrate de que la ruta sea correcta
                width: 100, // Ajusta el tamaño según sea necesario
                height: 100,
              ),
              SizedBox(height: 20),
              // Nombres de los autores
              Text(
                'Luis Burbano\nSteven Pozo',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
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
