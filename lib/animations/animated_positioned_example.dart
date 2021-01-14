import 'package:flutter/material.dart';

class AnimatedPositionedExample extends StatefulWidget {
  @override
  _AnimatedPositionedExampleState createState() =>
      _AnimatedPositionedExampleState();
}

class _AnimatedPositionedExampleState extends State<AnimatedPositionedExample> {
  bool showMessage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Positioned'),
      ),
      body: Center(
        child: Stack(
          children: [
            Positioned(
              bottom: 300,
              right: 140,
              child: Text(
                'Hidden!',
                style: TextStyle(fontSize: 24),
              ),
            ),
            AnimatedPositioned(
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue,
              ),
              bottom: showMessage ? 370 : 300,
              right: 130,
              duration: Duration(milliseconds: 500),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _animatePosition,
        child: Icon(Icons.play_arrow),
      ),
    );
  }

  void _animatePosition() {
    setState(() {
      showMessage = !showMessage;
    });
  }
}
