import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_grow/homepage/game/perawatan/hasilperawatan.dart';


class TestPerawatan extends StatefulWidget {
  @override
  _TestPerawatanState createState() => _TestPerawatanState();
}

class _TestPerawatanState extends State<TestPerawatan> {
  int currentQuestion = 0;
  int score = 0;

  final List<Map<String, Object>> questions = [
    {
      'question': 'Saat suhu lingkungan terlalu panas, alat IoT apa yang dapat membantu menjaga suhu di area pembibitan?',
      'answers': [
        {'text': 'Sensor suhu dan kipas otomatis', 'isCorrect': true},
        {'text': 'Timer lampu', 'isCorrect': false},
        {'text': 'Penyiram manual', 'isCorrect': false},
        {'text': 'Kipas angin biasa', 'isCorrect': false},
      ],
    },
    {
      'question': 'Apa fungsi utama dari sensor kelembaban tanah dalam pembibitan?',
      'answers': [
        {'text': 'Memantau tingkat kebutuhan air tanaman', 'isCorrect': true},
        {'text': 'Menjaga suhu tanaman', 'isCorrect': false},
        {'text': 'Mengontrol intensitas cahaya', 'isCorrect': false},
        {'text': 'Memberikan pupuk otomatis', 'isCorrect': false},
      ],
    },
    {
      'question': 'Apa manfaat utama penggunaan kamera IoT dalam area pembibitan?',
      'answers': [
        {'text': 'Memonitor pertumbuhan tanaman secara real-time', 'isCorrect': true},
        {'text': 'Menyiram tanaman secara otomatis', 'isCorrect': false},
        {'text': 'Mengukur tingkat pH tanah', 'isCorrect': false},
        {'text': 'Menghitung populasi tanaman', 'isCorrect': false},
      ],
    },
    {
      'question': 'Sistem IoT dapat diintegrasikan dengan aplikasi untuk...?',
      'answers': [
        {'text': 'Memantau cuaca dan jadwal penyiraman', 'isCorrect': true},
        {'text': 'Mengelola aktivitas panen', 'isCorrect': false},
        {'text': 'Menyediakan pupuk secara manual', 'isCorrect': false},
        {'text': 'Meningkatkan kadar oksigen', 'isCorrect': false},
      ],
    },
    {
      'question': 'Apa yang perlu diperhatikan dalam menggunakan lampu IoT untuk pembibitan?',
      'answers': [
        {'text': 'Intensitas cahaya sesuai kebutuhan tanaman', 'isCorrect': true},
        {'text': 'Warna lampu', 'isCorrect': false},
        {'text': 'Jarak lampu dari lahan pembibitan', 'isCorrect': false},
        {'text': 'Sumber daya listrik', 'isCorrect': false},
      ],
    },
    {
      'question': 'Manfaat utama menggunakan IoT pada sistem irigasi adalah...?',
      'answers': [
        {'text': 'Mengurangi biaya tenaga kerja', 'isCorrect': true},
        {'text': 'Menambah produksi tanaman', 'isCorrect': false},
        {'text': 'Mempercepat pertumbuhan bibit', 'isCorrect': false},
        {'text': 'Meningkatkan estetika lahan', 'isCorrect': false},
      ],
    },
    {
      'question': 'Sensor pH tanah pada pembibitan berfungsi untuk...?',
      'answers': [
        {'text': 'Memastikan tanah cocok untuk pembibitan', 'isCorrect': true},
        {'text': 'Menambah kadar air tanah', 'isCorrect': false},
        {'text': 'Memperbaiki struktur tanah', 'isCorrect': false},
        {'text': 'Meningkatkan suhu tanah', 'isCorrect': false},
      ],
    },
    {
      'question': 'Apa risiko utama jika tidak menggunakan teknologi IoT dalam pembibitan?',
      'answers': [
        {'text': 'Efisiensi pengelolaan lahan berkurang', 'isCorrect': true},
        {'text': 'Produksi tanaman meningkat', 'isCorrect': false},
        {'text': 'Waktu panen lebih cepat', 'isCorrect': false},
        {'text': 'Perawatan tanaman lebih mudah', 'isCorrect': false},
      ],
    },
    {
      'question': 'Apa yang terjadi jika data cuaca tidak diintegrasikan dengan sistem IoT?',
      'answers': [
        {'text': 'Pemeliharaan tanaman menjadi kurang optimal', 'isCorrect': true},
        {'text': 'Penyiraman tetap otomatis', 'isCorrect': false},
        {'text': 'Kelembaban tanah tetap terjaga', 'isCorrect': false},
        {'text': 'Tidak ada perubahan signifikan', 'isCorrect': false},
      ],
    },
    {
      'question': 'Apa tujuan utama dari penggunaan IoT di pembibitan?',
      'answers': [
        {'text': 'Mengoptimalkan hasil tanaman', 'isCorrect': true},
        {'text': 'Menambah tenaga kerja', 'isCorrect': false},
        {'text': 'Mengurangi aktivitas otomatis', 'isCorrect': false},
        {'text': 'Menambah biaya operasional', 'isCorrect': false},
      ],
    },
  ];

  void _answerQuestion(bool isCorrect) {
    if (isCorrect) {
      setState(() {
        score++;
      });
    }
    if (currentQuestion < questions.length - 1) {
      setState(() {
        currentQuestion++;
      });
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HasilPerawatan()
              //ScorePage(score: score, totalQuestions: questions.length),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image/kuis.png'),
                fit: BoxFit.cover,
                
              ),
            ),
          ),
          Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Text(
                    "POST TEST PERAWATAN",
                    style: GoogleFonts.luckiestGuy(
                      fontSize: 40,
                      letterSpacing: 2,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 6
                        ..color = Colors.green.shade900,
                    ),
                  ),
                  Text(
                    "POST TEST PERAWATAN",
                    style: GoogleFonts.luckiestGuy(
                      fontSize: 40,
                      color: Colors.white,
                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                 margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0), // Lebih kecil dari sebelumnya
  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        questions[currentQuestion]['question'] as String,
                        style: GoogleFonts.aBeeZee(fontSize: 18, fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 0),
                      Expanded(
                        child: GridView.count(
                          crossAxisCount: 2,
                          mainAxisSpacing: 12,
                          crossAxisSpacing: 7,
                          childAspectRatio: 3.9,
                          children: (questions[currentQuestion]['answers']
                                  as List<Map<String, Object>>)
                              .map((answer) {
                            return ElevatedButton(
  style: ElevatedButton.styleFrom(
    padding: const EdgeInsets.all(0.0), // Hilangkan padding agar gambar proporsional
    backgroundColor: Colors.transparent, // Transparan untuk gambar latar
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    shadowColor: Colors.transparent, // Hilangkan bayangan default
  ),
  onPressed: () => _answerQuestion(answer['isCorrect'] as bool),
  child: Stack(
    alignment: Alignment.center, // Pusatkan teks di tengah tombol
    children: [
      // Tambahkan gambar latar belakang
       ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          'assets/image/tombol.png', // Path ke gambar
          fit: BoxFit.cover, // Isi tombol tanpa terpotong
          width: double.infinity, // Penuhi lebar tombol
          height: double.infinity, // Penuhi tinggi tombol
        ),
      ),
      // Teks tombol
      Text(
        answer['text'] as String,
        style: GoogleFonts.akshar(
          fontSize: 18,
          color: Colors.green.shade700,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    ],
  ),
);
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }
}

class ScorePage extends StatelessWidget {
  final int score;
  final int totalQuestions;

  const ScorePage({required this.score, required this.totalQuestions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Skor Anda',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              '$score / $totalQuestions',
              style: TextStyle(fontSize: 40, color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
