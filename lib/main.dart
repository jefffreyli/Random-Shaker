import 'package:flutter/material.dart';
import 'package:shake/shake.dart';
import "dart:math";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

List imagePATHs = [
  "assets/aaron-1.jpeg",
  "assets/aaron-2.jpeg",
  "assets/ben-1.jpeg",
  "assets/ben-2.jpeg",
  "assets/ben-3.jpeg",
  "assets/ben-4.jpeg",
  "assets/crooked-teeth-LOL.jpeg",
  "assets/elmo.jpeg",
  "assets/jerry-high.jpeg",
  "assets/qiu.jpeg",
  "assets/sleepy.jpeg"
];
Random r = new Random();
int randIndex = r.nextInt(imagePATHs.length);

class _MyHomePageState extends State<MyHomePage> {
  void initState() {
    super.initState();
    ShakeDetector detector = ShakeDetector.autoStart(onPhoneShake: () {
      setState(() {
        randIndex = r.nextInt(imagePATHs.length);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Shaker"), centerTitle: true),
        body: Container(
          child:Image.asset(imagePATHs[randIndex], fit: BoxFit.fill)));
  }
}
