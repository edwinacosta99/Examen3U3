import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Votaciones Albumes de Rock!'),
        ),
        body: Center(
          child: Container(
            child: Text('Ingresa tu votacion:'),
            
          ),
        ),
      ),
    );
  }
}