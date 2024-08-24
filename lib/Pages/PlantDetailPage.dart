import 'package:flutter/material.dart';

class PlantDetailPage extends StatelessWidget {
  final String planta;

  const PlantDetailPage({super.key, required this.planta});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Información sobre $planta'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              planta,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            // Aquí puedes agregar más información sobre la planta
            Text(
              'Aquí va la información detallada sobre $planta. '
                  'Podrías agregar una imagen, descripción, y cualquier otro dato relevante.',
              style: TextStyle(fontSize: 18),
            ),
            // Agrega más widgets según tus necesidades
          ],
        ),
      ),
    );
  }
}
