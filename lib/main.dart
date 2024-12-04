import 'package:flutter/material.dart';
import 'package:green_grow/login/login.dart'; // Pastikan file ini ada dan sesuai dengan lokasi

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Green Grow',
      // theme: ThemeData(
      //   primarySwatch: Colors.green, 
      // ),
      home: const LoginPage(), 
    );
  }
}
