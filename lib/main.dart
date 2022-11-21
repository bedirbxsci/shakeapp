import 'package:flutter/material.dart';
import 'package:shake/shake.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ShakeToSee',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(title: 'Shake to See'),
    );
  }
}

class MyHomePage extends StatefulWidget {

  
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List imageurl = ['assets/alek.png', 'assets/dylan.png', 'assets/eric.PNG', 'assets/gang.png', 'assets/img.jpeg', 'assets/jusky.png', 'assets/moe.png', 'assets/monkey.png', 'assets/pray.png', 'assets/swim.png', 'assets/umer.png'];
  int _counter = 0;
  Random rand = Random();

  @override
  void initState() {
    super.initState();
    ShakeDetector detector = ShakeDetector.autoStart(onPhoneShake: () {
      setState(() {
        _counter = rand.nextInt(10);
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Image(
        image: AssetImage(imageurl[_counter]),
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center
      )
    );
  }
}
