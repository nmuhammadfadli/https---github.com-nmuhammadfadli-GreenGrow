import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_grow/homepage/home.dart';
import 'package:green_grow/login/register.dart';
import 'package:green_grow/pengaturan.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _handleLogin() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (username.isEmpty || password.isEmpty) {
      _showDialog("Error", "Nama pengguna atau kata sandi tidak boleh kosong.");
    } else {
      if (username == "admin" && password == "1234") {
        _showDialog("Berhasil", "Login berhasil!");
        
        {
          Navigator.push(
           context,
           MaterialPageRoute(builder: (context) =>  HomePage()),
           );
           }
      } else {
        _showDialog("Gagal", "Nama pengguna atau kata sandi salah.");
      }
    }
  }

  void _showDialog(String title, String message) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Background Image
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/image/background.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Semi-Transparent Overlay
            Container(
              color: Colors.black.withOpacity(0.4),
            ),
            // Login Form
            SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 15),
                      Stack(
        alignment: Alignment.center,
        children: [
          Text(
            "LOGIN",
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
            "LOGIN",
            style: GoogleFonts.luckiestGuy(
              fontSize: 40,
              color: Colors.white, // Warna isi teks
              letterSpacing: 2,
            ),
          ),
        ],
      ),
                      const SizedBox(height: 0),
                     Container(
  padding: const EdgeInsets.all(20),
  margin: const EdgeInsets.symmetric(horizontal: 20),
  decoration: BoxDecoration(
    color: Colors.green.shade900,
    borderRadius: BorderRadius.circular(15),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.2),
        blurRadius: 10,
        offset: const Offset(0, 5),
      ),
    ],
  ),
  child: ConstrainedBox(
    constraints: BoxConstraints(
      maxWidth: MediaQuery.of(context).size.width * 0.4, 
      minWidth: 300, 
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: _usernameController,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: "Nama Pengguna",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(
                horizontal: 15, vertical: 10),
          ),
        ),
        const SizedBox(height: 15),
        TextField(
          controller: _passwordController,
          obscureText: true,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: "Kata Sandi",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(
                horizontal: 15, vertical: 10),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RegisterPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade700,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 10),
              ),
              child: Text(
                "Daftar",
                style: GoogleFonts.luckiestGuy(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _handleLogin,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange.shade800,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 10),
              ),
              child: Text(
                "Login",
                style: GoogleFonts.luckiestGuy(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  ),
),

                    ],
                  ),
                ),
              ),
            ),
            // Settings and Logout Buttons
            Positioned(
              bottom: 20,
              right: 20,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
        //                 Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => PengaturanPage()),
        // );
                    },
                    icon: const Icon(
                      Icons.settings,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                    onPressed: () {
                      _showDialog("Logout", "Anda belum login.");
                    },
                    icon: const Icon(
                      Icons.logout,
                      color: Colors.white,
                      size: 30,
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
