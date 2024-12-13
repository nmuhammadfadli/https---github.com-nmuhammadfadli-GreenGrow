import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_grow/custom/custommenubutton.dart';
import 'package:green_grow/homepage/game/pembibitan/testpembibitan.dart';
import 'package:green_grow/homepage/game/pembibitan/tutorialpembibitan.dart';
import 'package:green_grow/homepage/home.dart';
import 'package:green_grow/homepage/petunjuk.dart';
import 'package:green_grow/login/login.dart';
import 'package:green_grow/pengaturan.dart';

class PembibitanPage extends StatelessWidget {
  const PembibitanPage({super.key});

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
            "PEMBIBITAN",
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
            "PEMBIBITAN",
            style: GoogleFonts.luckiestGuy(
              fontSize: 40,
              color: Colors.white, // Warna isi teks
              letterSpacing: 2,
            ),
          ),
        ],
      ),
                const SizedBox(height: 20),
             _buildMenuButton(context, 'VIDEO TUTORIAL', () {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const TutorialPembibitanPage()),
  );
}),
_buildMenuButton(context, 'SIMULASI', () {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const PeringkatPage()),
  );
}),
_buildMenuButton(context, 'POST TEST', () {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => TestPembibitan()),
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
                 Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PengaturanPage()),
                );
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


