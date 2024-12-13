import 'package:flutter/material.dart';
import 'package:green_grow/homepage/game/mulaigame.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_grow/homepage/game/panen/panen.dart';
import 'package:green_grow/homepage/game/pembibitan/pembibitan.dart';

class HasilPanen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Latar Belakang
          Positioned.fill(
            child: Image.asset(
              'assets/image/kuis.png', // Ganti dengan path gambar latar belakang Anda
              fit: BoxFit.cover,
            ),
          ),
          // Panel Hasil
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(color: Colors.green, width: 3),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'ANDA TELAH MENYELESAIKAN KUIS',
                    style: GoogleFonts.aBeeZee(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.green.shade700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                        Text(
                    "GREEN GROW",
                    style: GoogleFonts.luckiestGuy(
                      fontSize: 24,
                     color : Colors.green.shade900, // Warna stroke hijau
                    ),
                  ),
                  SizedBox(height: 10),
                    Text(
                    "100",
                    style: GoogleFonts.luckiestGuy(
                      fontSize: 60,
                     color: Colors.green.shade800,
                    ),
                  ),
                  SizedBox(height: 10),
                    
                  Text(
             'Skor Anda melebihi batas rata-rata petani lainnya dalam tes ini!',
            style: GoogleFonts.aBeeZee(
              fontSize: 16,
              color: Colors.green.shade800,
            ),
          ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Aksi tombol
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green.shade700,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                    ),
                    child: 
                    Text(
                      'LIHAT PERINGKAT',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'LuckiestGuy',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Ikon di Sudut
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
                  MaterialPageRoute(builder: (context) => const PanenPage()),
                );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
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
 Widget _buildIconButton(IconData icon, VoidCallback onPressed) {
    return IconButton(
      icon: Icon(icon, color: Colors.white, size: 30),
      onPressed: onPressed,
    );
  }