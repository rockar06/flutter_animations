import 'package:flutter/material.dart';

class AnimatedAlignSample extends StatefulWidget {
  @override
  _AnimatedAlignSampleState createState() => _AnimatedAlignSampleState();
}

class _AnimatedAlignSampleState extends State<AnimatedAlignSample> {
  final _duration = Duration(milliseconds: 500);
  final double _width = 75;
  final double _height = 75;
  final Color _color = Colors.blue;
  final BorderRadiusGeometry _borderRadius = BorderRadius.circular(8.0);
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
            child: Container(
              height: _height,
              width: _width,
              decoration: BoxDecoration(
                color: _color,
                borderRadius: _borderRadius,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0.0, 4.0),
                      blurRadius: 4,
                      color: Colors.black26)
                ],
              ),
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
    if(_alignment == Alignment.topRight) {
      _alignment = Alignment.bottomLeft;
    } else {
      _alignment = Alignment.topRight;
    }
  }
}
