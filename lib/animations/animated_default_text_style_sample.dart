import 'package:flutter/material.dart';

class AnimatedDefaultTextStyleSample extends StatefulWidget {
  @override
  _AnimatedDefaultTextStyleSampleState createState() =>
      _AnimatedDefaultTextStyleSampleState();
}

class _AnimatedDefaultTextStyleSampleState
    extends State<AnimatedDefaultTextStyleSample> {
  bool isBigStyle = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Curved Animation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedDefaultTextStyle(
              style: isBigStyle
                  ? TextStyle(
                      fontSize: 50,
                      color: Colors.red,
                      fontWeight: FontWeight.bold)
                  : TextStyle(
                      fontSize: 24.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w100),
              duration: const Duration(milliseconds: 200),
              child: Text("Animate me!"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: () {
          _changeTextStyle();
        },
      ),
    );
  }

  void _changeTextStyle() {
    setState(() {
      isBigStyle = !isBigStyle;
    });
  }
}
