import 'package:flutter/material.dart';
import 'package:flutter_animations_app/utils/sample_container.dart';

class AnimatedAlignExample extends StatefulWidget {
  @override
  _AnimatedAlignExampleState createState() => _AnimatedAlignExampleState();
}

class _AnimatedAlignExampleState extends State<AnimatedAlignExample> {
  final _duration = Duration(milliseconds: 500);
  final double _width = 75;
  final double _height = 75;
  Alignment _alignment = Alignment.topRight;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Curved Animation'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
        child: Container(
          child: AnimatedAlign(
            alignment: _alignment,
            curve: Curves.easeInOutBack,
            duration: _duration,
            child: SampleContainer(
              mHeight: _height,
              mWidth: _width,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: () {
          setState(() {
            _changePositionAlignment();
          });
        },
      ),
    );
  }

  void _changePositionAlignment() {
    if (_alignment == Alignment.topRight) {
      _alignment = Alignment.bottomLeft;
    } else {
      _alignment = Alignment.topRight;
    }
  }
}
