import 'package:flutter/material.dart';
import 'package:green_grow/custom/globalaudioplayer.dart';

class PengaturanPage extends StatefulWidget {
  const PengaturanPage({super.key});

  @override
  State<PengaturanPage> createState() => _PengaturanPageState();
}

class _PengaturanPageState extends State<PengaturanPage> {
  bool isMusikOn = true; // Status musik (on/off)
  double volume = 0.5;   // Volume default

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
      appBar: AppBar(title: const Text('Pengaturan')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Switch On/Off Musik
            ListTile(
              title: const Text(
                'Musik',
                style: TextStyle(fontSize: 18),
              ),
              trailing: Switch(
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
            ),

            // Slider untuk Mengatur Volume
            ListTile(
              title: const Text(
                'Volume',
                style: TextStyle(fontSize: 18),
              ),
              subtitle: Slider(
                value: volume,
                min: 0,
                max: 1,
                divisions: 10,
                label: '${(volume * 100).round()}%',
                onChanged: isMusikOn
                    ? (value) {
                        setState(() {
                          volume = value;
                          audioPlayer.setVolume(volume); // Update volume musik
                        });
                      }
                    : null, // Nonaktifkan jika musik mati
              ),
            ),
          ],
        ),
      ),
    );
  }
}
