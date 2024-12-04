import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image/home.png'), // Ganti dengan path gambar Anda
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Buttons dan Konten di Tengah
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "GREEN GROW",
                  style: GoogleFonts.luckiestGuy(
                    fontSize: 40,
                    color: Colors.white,
                    letterSpacing: 2,
                  ),
                ),
                const SizedBox(height: 20),
                _buildMenuButton(context, 'MULAI', () {
                  // Aksi untuk MULAI, misalnya navigasi ke halaman lain
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MulaiPage()), // Ganti dengan halaman yang sesuai
                  );
                }),
                _buildMenuButton(context, 'PERINGKAT', () {
                  // Aksi untuk PERINGKAT
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PeringkatPage()), // Ganti dengan halaman yang sesuai
                  );
                }),
                _buildMenuButton(context, 'PETUNJUK', () {
                  // Aksi untuk PETUNJUK
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PetunjukPage()), // Ganti dengan halaman yang sesuai
                  );
                }),
              ],
            ),
          ),
          // Settings dan Logout di Kanan Bawah
          Positioned(
            bottom: 20,
            right: 20,
            child: Row(
              children: [
                _buildIconButton(Icons.settings, () {
                  // Aksi untuk Settings
                  _showDialog(context, "Pengaturan", "Fitur pengaturan belum tersedia.");
                }),
                const SizedBox(width: 10),
                _buildIconButton(Icons.logout, () {
                  // Aksi untuk Logout
                  _showDialog(context, "Logout", "Anda belum login.");
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuButton(BuildContext context, String text, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.lightGreen,
          padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: GoogleFonts.luckiestGuy(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildIconButton(IconData icon, VoidCallback onPressed) {
    return IconButton(
      icon: Icon(icon, color: Colors.white, size: 30),
      onPressed: onPressed,
    );
  }

  // Fungsi untuk menampilkan dialog
  void _showDialog(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }
}

// Halaman placeholder untuk MULAI, PERINGKAT, dan PETUNJUK
class MulaiPage extends StatelessWidget {
  const MulaiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Mulai")),
      body: const Center(child: Text("Halaman MULAI")),
    );
  }
}

class PeringkatPage extends StatelessWidget {
  const PeringkatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Peringkat")),
      body: const Center(child: Text("Halaman PERINGKAT")),
    );
  }
}

class PetunjukPage extends StatelessWidget {
  const PetunjukPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Petunjuk")),
      body: const Center(child: Text("Halaman PETUNJUK")),
    );
  }
}
