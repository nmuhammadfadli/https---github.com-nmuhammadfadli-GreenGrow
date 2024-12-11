import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TutorialPembibitanPage extends StatefulWidget {
  const TutorialPembibitanPage({Key? key}) : super(key: key);

  @override
  State<TutorialPembibitanPage> createState() => _TutorialPembibitanPageState();
}

class _TutorialPembibitanPageState extends State<TutorialPembibitanPage> {
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
      appBar: AppBar(
        title: const Text('Video Tutorial'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Video 1
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: YoutubePlayer(
                controller: _controller1,
                showVideoProgressIndicator: true,
                onReady: () {
                  debugPrint('Video 1 Ready');
                },
              ),
            ),

            // Video 2 (Locked until Video 1 is completed)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  YoutubePlayer(
                    controller: _controller2,
                    showVideoProgressIndicator: true,
                    onReady: () {
                      debugPrint('Video 2 Ready');
                    },
                  ),
                  if (!isVideo1Completed)
                    Container(
                      color: Colors.black.withOpacity(0.7),
                      height: 200, // Match YouTube player height
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
            ),
          ],
        ),
      ),
    );
  }
}
