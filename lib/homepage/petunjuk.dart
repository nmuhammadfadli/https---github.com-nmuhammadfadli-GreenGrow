import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_grow/pengaturan.dart';

class PetunjukPage extends StatelessWidget {
  const PetunjukPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Latar Belakang
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image/home.png'), // Sesuaikan path gambar
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Konten Petunjuk di Tengah
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.green, width: 3),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "CARA BERMAIN",
                      style: GoogleFonts.luckiestGuy(
                        fontSize: 26,
                        color: Colors.green.shade900,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Fase 1: Pemberian Materi\n"
                      "Pelajari dasar-dasar teknologi IoT di pertanian melalui tutorial interaktif dan kuis singkat.\n\n"
                      "Fase 2: Simulasi\n"
                      "Terapkan pengetahuan dengan memilih alat IoT seperti sensor atau drone untuk mengelola lahan. Keputusanmu memengaruhi pertumbuhan tanaman.\n\n"
                      "Fase 3: Post-Test\n"
                      "Jawab kuis berbasis skenario setelah setiap siklus tanaman untuk evaluasi hasil dan efisiensi penggunaan teknologi.",
                      style: GoogleFonts.aBeeZee(
                        
                        fontSize: 13,
                        color: Colors.green[800],
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Ikon Pengaturan dan Keluar di Kanan Bawah
          Positioned(
            bottom: 10,
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
                  Navigator.pop(context);
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Fungsi untuk Membuat Tombol Ikon
  Widget _buildIconButton(IconData icon, VoidCallback onPressed) {
    return IconButton(
      icon: Icon(icon, color: Colors.white, size: 35),
      onPressed: onPressed,
    );
  }

  // Fungsi untuk Menampilkan Dialog
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
