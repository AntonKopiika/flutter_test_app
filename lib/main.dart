import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyTestApp());
}

class MyTestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Test App",
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _redShade = 0;
  int _greenShade = 0;
  int _blueShade = 0;
  double _opacity = 0.8;
  Color _fontColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(_redShade, _greenShade, _blueShade, _opacity),
        child: InkWell(
          onTap: _changeColor,
          child: Center(
            child: Text(
              "Hey there",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: _fontColor),
            ),
          ),
        ),
      ),
    );
  }

  void _changeColor() {
    setState(() {
      var _rand = new Random();
      _redShade = _rand.nextInt(255);
      _greenShade = _rand.nextInt(255);
      _blueShade = _rand.nextInt(255);
      _fontColor = (_redShade * 299 + _greenShade * 587 + _blueShade * 114) / 1000 > 125 ? Colors.black : Colors.white;
      _opacity = _rand.nextDouble();
    });
  }
}
