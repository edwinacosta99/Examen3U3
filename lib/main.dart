import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'add_album_screen.dart';
import 'album_list_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rock Album Voting App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AlbumListScreen(),
      routes: {
        '/addAlbum': (context) => AddAlbumScreen(),
      },
    );
  }
}