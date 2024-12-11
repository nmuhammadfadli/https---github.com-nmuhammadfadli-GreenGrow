import 'package:audioplayers/audioplayers.dart';

class GlobalAudioPlayer {
  // Singleton instance
  static final GlobalAudioPlayer _instance = GlobalAudioPlayer._internal();
  final AudioPlayer _audioPlayer = AudioPlayer();

  // Factory constructor
  factory GlobalAudioPlayer() {
    return _instance;
  }

  // Internal constructor
  GlobalAudioPlayer._internal();

  Future<void> playMusic() async {
    try {
      // Tentukan sumber audio menggunakan metode 'Source.asset'
      await _audioPlayer.play(AssetSource('audio/backsound.mp3'));
      await _audioPlayer.setReleaseMode(ReleaseMode.loop); // Ulangi terus
    } catch (e) {
      print('Error playing music: $e');
    }
  }

  Future<void> stopMusic() async {
    try {
      await _audioPlayer.stop();
    } catch (e) {
      print('Error stopping music: $e');
    }
  }

  Future<void> pauseMusic() async {
    try {
      await _audioPlayer.pause();
    } catch (e) {
      print('Error pausing music: $e');
    }
  }

  Future<void> resumeMusic() async {
    try {
      await _audioPlayer.resume();
    } catch (e) {
      print('Error resuming music: $e');
    }
  }

  Future<void> setVolume(double volume) async {
    try {
      await _audioPlayer.setVolume(volume); // Volume dalam rentang 0.0 - 1.0
    } catch (e) {
      print('Error setting volume: $e');
    }
  }
}
