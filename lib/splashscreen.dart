import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_grow/login/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _progressValue = 0.0;

  @override
  void initState() {
    super.initState();
    _simulateLoading();
  }

  // Simulate a loading process
  void _simulateLoading() {
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        _progressValue += 0.05;
        if (_progressValue < 1.0) {
          _simulateLoading();
        } else {
          // Navigate to the next screen when loading is complete
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginPage(), // Replace with your next page
            ),
          );
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image/bg1.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Semi-transparent overlay
          Container(
            color: Colors.black.withOpacity(0.3),
          ),
          // Content in the center
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "GREEN GROW",
                  style: GoogleFonts.luckiestGuy(
                    fontSize: 48,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        color: Colors.black.withOpacity(0.3),
                        offset: const Offset(2, 2),
                        blurRadius: 5,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Gamifikasi Pertanian Meningkatkan Pendidikan\n"
                  "dan Mendukung SDGs Berkelanjutan",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.aBeeZee(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 30),
                // Progress bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Column(
                    children: [
                      LinearProgressIndicator(
                        value: _progressValue,
                        backgroundColor: Colors.white,
                        color: Colors.green,
                        minHeight: 10,
                      ),
                      const SizedBox(height: 40),
                      Text(
                        "${(_progressValue * 100).toInt()}%",
                        style: GoogleFonts.roboto(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


