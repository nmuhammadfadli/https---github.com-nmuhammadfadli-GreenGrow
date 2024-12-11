import 'package:flutter/material.dart';
import 'package:green_grow/splashscreen.dart';
import 'package:green_grow/custom/globalaudioplayer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inisialisasi audio player global
  final audioPlayer = GlobalAudioPlayer();
  await audioPlayer.playMusic();

  // Jalankan aplikasi
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Green Grow',
      home: const SplashScreen(), // Pastikan SplashScreen benar
    );
  }
}
