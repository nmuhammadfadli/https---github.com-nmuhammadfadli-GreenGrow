import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_grow/custom/custommenubutton.dart';
import 'package:green_grow/homepage/game/pembibitan/pembibitan.dart';
import 'package:green_grow/homepage/home.dart';
import 'package:green_grow/homepage/petunjuk.dart';
import 'package:green_grow/login/login.dart';

class MulaiGamePage extends StatelessWidget {
  const MulaiGamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image/bg3.png'), // Ganti dengan path gambar Anda
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Buttons dan Konten di Tengah
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
        alignment: Alignment.center,
        children: [
          Text(
            "GREEN GROW",
            style: GoogleFonts.luckiestGuy(
              fontSize: 40,
              letterSpacing: 2,
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 6 // Ketebalan stroke
                ..color = Colors.green.shade900, // Warna stroke hijau
            ),
          ),
          // Lapisan isi teks putih
          Text(
            "GREEN GROW",
            style: GoogleFonts.luckiestGuy(
              fontSize: 40,
              color: Colors.white, // Warna isi teks
              letterSpacing: 2,
            ),
          ),
        ],
      ),
                const SizedBox(height: 20),
             _buildMenuButton(context, 'PEMBIBITAN', () {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const PembibitanPage()),
  );
}),
_buildMenuButton(context, 'PERAWATAN', () {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const PeringkatPage()),
  );
}),
_buildMenuButton(context, 'PANEN', () {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => PetunjukPage()),
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
                   Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
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
    child: GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 250, // Sesuaikan ukuran tombol
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage('assets/image/bg2.png'), // Path ke gambar background tombol Anda
            fit: BoxFit.fill,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.luckiestGuy(
              fontSize: 20,
              color: Colors.green.shade800,
            ),
          ),
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



