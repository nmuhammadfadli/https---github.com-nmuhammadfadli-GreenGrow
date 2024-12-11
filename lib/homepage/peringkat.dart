import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PeringkatPage extends StatelessWidget {
  const PeringkatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Latar Belakang
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image/peringkat.png'), // Sesuaikan path gambar
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: -6,
            right: 20,
            child: Row(
              children: [
                _buildIconButton(Icons.settings, () {
                  _showDialog(context, "Pengaturan", "Fitur pengaturan belum tersedia.");
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
