import 'package:flutter/material.dart';

class SimulasiPage extends StatefulWidget {
  @override
  _SimulasiPageState createState() => _SimulasiPageState();
}

class _SimulasiPageState extends State<SimulasiPage> {
  String currentInstruction =
      "Pilih alat IoT yang cocok untuk situasi penyiraman agar lebih efisien!";
  bool isAnswerCorrect = false;

  // Posisi target
  final Offset targetPosition = Offset(250, 300);

  // Alat yang benar
  final String correctTool = "Sprinkler IoT";

  // List pilihan alat (dengan nama dan gambar)
  final List<Map<String, String>> tools = [
    {"name": "Sensor Kelembaban", "image": "assets/image/sensor.png"},
    {"name": "Sprinkler IoT", "image": "assets/image/sprinkler.png"},
    {"name": "Drone Pemantau", "image": "assets/image/drone.png"},
  ];

  // Posisi alat yang sedang dipilih
  Offset selectedToolPosition = Offset(50, 200);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Latar belakang
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image/sawah.png'), // Path gambar sawah
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Instruksi
          Positioned(
            top: 20,
            left: 20,
            right: 20,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Text(
                currentInstruction,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),

          // Lokasi target
          Positioned(
            left: targetPosition.dx,
            top: targetPosition.dy,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green, width: 3),
                borderRadius: BorderRadius.circular(50),
              ),
              child: isAnswerCorrect
                  ? Image.asset(
                      'assets/image/sprinkler.png', // Path alat yang benar
                      width: 50,
                      height: 50,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return const Center(
                          child: Icon(Icons.check_circle, color: Colors.green),
                        );
                      },
                    )
                  : const Center(
                      child: Text(
                        "Target",
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
            ),
          ),

          // Gambar alat yang bergerak
          AnimatedPositioned(
            duration: const Duration(milliseconds: 700),
            left: selectedToolPosition.dx,
            top: selectedToolPosition.dy,
            child: Image.asset(
              'assets/image/drone.png',
              width: 80,
              height: 80,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.broken_image, size: 80);
              },
            ),
          ),

          // Pilihan alat (di sisi kiri layar)
          Positioned(
            left: 20,
            top: 75,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: tools.map((tool) {
                final name = tool['name'] ?? 'Tidak diketahui';
                final imagePath = tool['image'] ?? 'assets/image/drone.png';
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: GestureDetector(
                    onTap: () {
                      _checkAnswer(tool['name'], tool['image']);
                    },
                    child: Container(
                      width: 100,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            imagePath, // Path gambar
                            width: 50,
                            height: 50,
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(Icons.broken_image, size: 50);
                            },
                          ),
                          const SizedBox(height: 4),
                          Text(
                            name, // Nama alat
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),

          // Penjelasan alat di sisi kanan
          Positioned(
            right: 20,
            top: 75,
            child: Container(
              width: 250,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Tentang Alat IoT",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Sprinkler IoT digunakan untuk menyiram lahan secara otomatis berdasarkan kondisi cuaca dan kelembaban tanah. Dengan alat ini, penyiraman menjadi lebih efisien dan hemat air.",
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Fungsi untuk memeriksa jawaban
  void _checkAnswer(String? selectedTool, String? imagePath) {
    if (selectedTool == null || imagePath == null) {
      setState(() {
        currentInstruction = "Data alat tidak valid. Coba lagi.";
      });
      return;
    }

    setState(() {
      if (selectedTool == correctTool) {
        isAnswerCorrect = true;
        currentInstruction = "Benar! Alat IoT yang cocok adalah $correctTool.";
        selectedToolPosition = targetPosition;
      } else {
        isAnswerCorrect = false;
        currentInstruction =
            "Salah! $selectedTool tidak cocok. Coba lagi dengan alat lain.";
        selectedToolPosition = Offset(50, 200); // Reset posisi alat
      }
    });
  }
}
