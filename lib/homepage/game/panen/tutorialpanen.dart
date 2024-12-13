import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class TutorialPanenPage extends StatefulWidget {
  const TutorialPanenPage({Key? key}) : super(key: key);

  @override
  State<TutorialPanenPage> createState() => _TutorialPanenPageState();
}

class _TutorialPanenPageState extends State<TutorialPanenPage> {
  // YouTube Video IDs
  final String video1Id = 'TGBfeymCaE8';
  final String video2Id = 'VTlkbIwBTQw';

  late YoutubePlayerController _controller1;
  late YoutubePlayerController _controller2;

  bool isVideo1Completed = false;

  @override
  void initState() {
    super.initState();

    // Initialize YouTube Player Controllers
    _controller1 = YoutubePlayerController(
      initialVideoId: video1Id,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        controlsVisibleAtStart: true,
      ),
    )..addListener(() {
        // Check if Video 1 is completed
        if (_controller1.value.playerState == PlayerState.ended) {
          setState(() {
            isVideo1Completed = true;
          });
        }
      });

    _controller2 = YoutubePlayerController(
      initialVideoId: video2Id,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        controlsVisibleAtStart: true,
      ),
    );
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }

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
          // Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Text(
                      "TUTORIAL PEMBIBITAN",
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
                      "TUTORIAL PEMBIBITAN",
                      style: GoogleFonts.luckiestGuy(
                        fontSize: 40,
                        color: Colors.white, // Warna isi teks
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // Video Layout (Side by Side)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildVideoPlayer(_controller1),
                    const SizedBox(width: 20),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        _buildVideoPlayer(_controller2),
                        if (!isVideo1Completed)
                          Container(
                            color: Colors.black.withOpacity(0.7),
                            height: 200,
                            width: 300,
                            child: const Center(
                              child: Text(
                                'Selesaikan Video 1 Terlebih Dahulu',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // Button for Simulasi
                _buildMenuButton(context, 'HALAMAN SIMULASI', () {
                  // Tambahkan navigasi ke halaman simulasi di sini
                  Navigator.pop(context);
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVideoPlayer(YoutubePlayerController controller) {
    return Container(
      width: 300,
      child: YoutubePlayer(
        controller: controller,
        showVideoProgressIndicator: true,
        onReady: () {
          debugPrint('Video Ready');
        },
      ),
    );
  }

  Widget _buildMenuButton(BuildContext context, String text, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 250,
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage('assets/image/bg2.png'), // Path ke background tombol Anda
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
    );
  }
}
