import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomMenuButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomMenuButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Stack(
        children: [
          // Latar belakang dekoratif
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('assets/image/bg2.png'), // Sesuaikan path gambar latar belakang
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          // Tombol teks
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shadowColor: Colors.transparent, 
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
        ],
      ),
    );
  }
}
