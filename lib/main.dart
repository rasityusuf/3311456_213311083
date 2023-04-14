import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FitApp',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
          title: Text(
        "Hoş Geldiniz",
        style: TextStyle(fontSize: 35),
      )),
      body: Container(
        width: screenSize.width,
        height: screenSize.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/image4.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HareketVideolari(),
                  ),
                );
              },
              child: Text(
                'Hareket Videoları',
                style: TextStyle(fontSize: 40, color: Colors.amberAccent),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Antp(),
                  ),
                );
              },
              child: Text(
                'Antreman Programları',
                style: TextStyle(fontSize: 36, color: Colors.amberAccent),
              ),
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.transparent),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Kronometre(),
                  ),
                );
              },
              child: Text(
                'Kronometre',
                style: TextStyle(fontSize: 40, color: Colors.amberAccent),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => KaloriHesapla(),
                  ),
                );
              },
              child: Text(
                'Kalori Hesaplayıcı',
                style: TextStyle(fontSize: 40, color: Colors.amberAccent),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class HareketVideolari extends StatelessWidget {
  const HareketVideolari({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: Text("Hareket Videoları")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => VideoSayfasi(
                          videoUrl:
                              'https://www.youtube.com/watch?v=rT7DgCr-3pg')),
                );
              },
              child: Text(
                'Bench Press',
                style: TextStyle(fontSize: 50),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => VideoSayfasi(
                          videoUrl:
                              'https://www.youtube.com/watch?v=SW_C1A-rejs')),
                );
              },
              child: Text(
                'Squat',
                style: TextStyle(fontSize: 50),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => VideoSayfasi(
                          videoUrl:
                              'https://www.youtube.com/watch?v=sAq_ocpRh_I')),
                );
              },
              child: Text(
                'Dumbbell Curl',
                style: TextStyle(fontSize: 50),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => VideoSayfasi(
                          videoUrl:
                              'https://www.youtube.com/watch?v=9efgcAjQe7E')),
                );
              },
              child: Text(
                'Barbell Row',
                style: TextStyle(fontSize: 50),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Anasayfa',
                style: TextStyle(fontSize: 35),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class Antp extends StatefulWidget {
  const Antp({Key? key}) : super(key: key);

  @override
  State<Antp> createState() => _AntpState();
}

class _AntpState extends State<Antp> {
  int _currentImageIndex = 0;
  final List<String> _imagePaths = [
    'images/image1.png',
    'images/image2.jpg',
    'images/image3.png',
  ];

  void _changeImage() {
    setState(() {
      _currentImageIndex = (_currentImageIndex + 1) % _imagePaths.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Antreman Programları')),
      body: Center(
        child: GestureDetector(
          onTap: _changeImage,
          child: Image.asset(_imagePaths[_currentImageIndex]),
        ),
      ),
    );
  }
}

@override
Widget build(BuildContext context) {
  return const Placeholder();
}

class Kronometre extends StatefulWidget {
  @override
  _KronometreState createState() => _KronometreState();
}

class _KronometreState extends State<Kronometre> {
  late Timer _timer;
  int _milliseconds = 0;
  bool _isRunning = false;

  @override
  void initState() {
    super.initState();
  }

  void _start() {
    _isRunning = true;
    _timer = Timer.periodic(Duration(milliseconds: 10), (timer) {
      setState(() {
        _milliseconds += 10;
      });
    });
  }

  void _stop() {
    _isRunning = false;
    _timer.cancel();
  }

  void _reset() {
    _milliseconds = 0;
    _isRunning = false;
    _timer.cancel();
  }

  String _formatMilliseconds(int milliseconds) {
    int hundreds = (milliseconds / 10).truncate();
    int seconds = (hundreds / 100).truncate();
    int minutes = (seconds / 60).truncate();

    String minuteStr = (minutes % 60).toString().padLeft(2, '0');
    String secondStr = (seconds % 60).toString().padLeft(2, '0');
    String hundredthStr = (hundreds % 100).toString().padLeft(2, '0');

    return '$minuteStr:$secondStr:$hundredthStr';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kronometre'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Text(
              _formatMilliseconds(_milliseconds),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 48),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: _isRunning ? _stop : _start,
                child: Text(_isRunning ? 'Durdur' : 'Başlat'),
              ),
              ElevatedButton(
                onPressed: _reset,
                child: Text('Sıfırla'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class KaloriHesapla extends StatefulWidget {
  @override
  _KaloriHesaplaState createState() => _KaloriHesaplaState();
}

class _KaloriHesaplaState extends State<KaloriHesapla> {
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  double _calories = 0;

  void _calculateCalories() {
    int age = int.tryParse(_ageController.text) ?? 0;
    double height = double.tryParse(_heightController.text) ?? 0;
    double weight = double.tryParse(_weightController.text) ?? 0;

    setState(() {
      _calories = 655 + (9.6 * weight) + (1.8 * height) - (4.7 * age);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Günlük Kalori Hesaplama'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _ageController,
              decoration: InputDecoration(
                labelText: 'Yaş',
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _heightController,
              decoration: InputDecoration(
                labelText: 'Boy (cm)',
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _weightController,
              decoration: InputDecoration(
                labelText: 'Kilo (kg)',
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          ElevatedButton(
            child: Text(
              'Hesapla',
              style: TextStyle(fontSize: 23),
            ),
            onPressed: _calculateCalories,
          ),
          SizedBox(height: 20),
          Text(
            _calories == 0
                ? 'Kalori ihtiyacınızı hesaplayın.'
                : 'Günlük kalori ihtiyacınız: $_calories',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}

class VideoSayfasi extends StatefulWidget {
  final String videoUrl;

  VideoSayfasi({required this.videoUrl});

  @override
  _VideoSayfasiState createState() => _VideoSayfasiState();
}

class _VideoSayfasiState extends State<VideoSayfasi> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.videoUrl)!,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Sayfasi'),
      ),
      body: YoutubePlayer(
        controller: _controller,
        liveUIColor: Colors.amber,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
