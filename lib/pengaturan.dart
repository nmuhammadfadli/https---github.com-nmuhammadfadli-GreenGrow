import 'package:flutter/material.dart';
import 'package:green_grow/custom/globalaudioplayer.dart';
import 'package:google_fonts/google_fonts.dart';

class PengaturanPage extends StatefulWidget {
  const PengaturanPage({super.key});

  @override
  State<PengaturanPage> createState() => _PengaturanPageState();
}

class _PengaturanPageState extends State<PengaturanPage> {
  bool isMusikOn = true; // Status musik (on/off)
  double volume = 0.5; // Volume default

  final GlobalAudioPlayer audioPlayer = GlobalAudioPlayer();

  @override
  void initState() {
    super.initState();
    // Set volume awal saat halaman dimuat
    audioPlayer.setVolume(volume);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Latar belakang gambar
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image/home.png'), // Ganti dengan path gambar Anda
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Konten utama
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Stack(
                  alignment: Alignment.center,
                  children: [
                    Text(
                      "PENGATURAN",
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
                      "PENGATURAN",
                      style: GoogleFonts.luckiestGuy(
                        fontSize: 40,
                        color: Colors.white, // Warna isi teks
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),

                // Musik On/Off
                _buildCustomToggle(
                  context: context,
                  label: 'Musik',
                  value: isMusikOn,
                  onChanged: (value) {
                    setState(() {
                      isMusikOn = value;
                      if (isMusikOn) {
                        audioPlayer.playMusic();
                      } else {
                        audioPlayer.stopMusic();
                      }
                    });
                  },
                ),

                const SizedBox(height: 20),

                // Slider Volume
                _buildCustomSlider(
                  context: context,
                  label: 'Suara',
                  value: volume,
                  onChanged: isMusikOn
                      ? (value) {
                          setState(() {
                            volume = value;
                            audioPlayer.setVolume(volume);
                          });
                        }
                      : null,
                ),

                const SizedBox(height: 40),

                // Tombol Keluar
                _buildCustomButton(
                  context: context,
                  label: 'KEMBALI',
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget Custom untuk Toggle Musik
  Widget _buildCustomToggle({
    required BuildContext context,
    required String label,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.green.shade700, width: 2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: Colors.green,
          ),
        ],
      ),
    );
  }

  // Widget Custom untuk Slider Volume
  Widget _buildCustomSlider({
    required BuildContext context,
    required String label,
    required double value,
    required ValueChanged<double>? onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.green.shade700, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Slider(
            value: value,
            min: 0,
            max: 1,
            divisions: 10,
            label: '${(value * 100).round()}%',
            onChanged: onChanged,
            activeColor: Colors.green,
          ),
        ],
      ),
    );
  }

  // Widget Custom untuk Tombol Keluar
  Widget _buildCustomButton({
    required BuildContext context,
    required String label,
    required VoidCallback onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: const Offset(0, 4),
              blurRadius: 6,
            ),
          ],
        ),
        child: Text(
          label,
          style:  GoogleFonts.luckiestGuy(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
