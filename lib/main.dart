import 'package:flutter/material.dart';
import 'package:green_grow/login/login.dart'; 
import 'package:green_grow/splashscreen.dart';

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
      home: const SplashScreen(), 
    );
  }
}
