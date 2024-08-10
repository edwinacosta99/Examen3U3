import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddAlbumScreen extends StatelessWidget {
  final TextEditingController albumController = TextEditingController();
  final TextEditingController bandController = TextEditingController();
  final TextEditingController yearController = TextEditingController();

  void addAlbum() {
    FirebaseFirestore.instance.collection('albums').add({
      'nombre_album': albumController.text,
      'nombre_banda': bandController.text,
      'anio_lanzamiento': int.parse(yearController.text),
      'votos': 0,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Agregar Álbum de Rock')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: albumController,
              decoration: InputDecoration(labelText: 'Nombre del Álbum'),
            ),
            TextField(
              controller: bandController,
              decoration: InputDecoration(labelText: 'Nombre de la Banda'),
            ),
            TextField(
              controller: yearController,
              decoration: InputDecoration(labelText: 'Año de Lanzamiento'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: addAlbum,
              child: Text('Agregar Álbum'),
            ),
          ],
        ),
      ),
    );
  }
}