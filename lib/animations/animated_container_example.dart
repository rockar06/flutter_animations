import 'dart:math';

import 'package:flutter/material.dart';

/// Reference for curves animations https://api.flutter.dev/flutter/animation/Curves-class.html
class AnimatedContainerExample extends StatefulWidget {
  @override
  _AnimatedContainerExampleState createState() => _AnimatedContainerExampleState();
}

class _AnimatedContainerExampleState extends State<AnimatedContainerExample> {
  final _duration = Duration(seconds: 1);
  final _random = Random();
  double _width = 50;
  double _height = 50;
  Color _color = Colors.blue;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Curved Animation'),
      ),
      body: Center(
        child: AnimatedContainer(
          width: _width,
          height: _height,
          decoration: BoxDecoration(
              color: _color,
              borderRadius: _borderRadius,
              boxShadow: [
                BoxShadow(
                    offset: Offset(0.0, 4.0),
                    blurRadius: 4,
                    color: Colors.black26)
              ]),
          duration: _duration,
          // This value should change according the required Curve animation
          curve: Curves.easeOutCirc,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: () {
          _changeNewValuesForContainer();
        },
      ),
    );
  }

  void _changeNewValuesForContainer() {
    setState(() {
      _width = _random.nextInt(300).toDouble();
      _height = _random.nextInt(300).toDouble();
      _color = Color.fromRGBO(
          _random.nextInt(256), _random.nextInt(256), _random.nextInt(256), 1);
      _borderRadius = BorderRadius.circular(_random.nextInt(100).toDouble());
    });
  }
}
