import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AlbumListScreen extends StatelessWidget {
  void incrementVotes(String albumId, int currentVotes) {
    FirebaseFirestore.instance
        .collection('albums')
        .doc(albumId)
        .update({'votos': currentVotes + 1});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Álbumes de Rock')),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('albums').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                var album = snapshot.data!.docs[index];
                return ListTile(
                  title: Text(album['nombre_album']),
                  subtitle: Text('Banda: ${album['nombre_banda']} - Año: ${album['anio_lanzamiento']}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Votos: ${album['votos']}'),
                      IconButton(
                        icon: Icon(Icons.thumb_up),
                        onPressed: () => incrementVotes(album.id, album['votos']),
                      ),
                    ],
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}