import 'package:flutter/material.dart';

class AnimatedSizeExample extends StatefulWidget {
  @override
  _AnimatedSizeExampleState createState() => _AnimatedSizeExampleState();
}

class _AnimatedSizeExampleState extends State<AnimatedSizeExample>
    with SingleTickerProviderStateMixin {
  double _size = 50.0;
  bool _large = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Size'),
      ),
      body: Center(
        child: Container(
          color: Colors.blue,
          child: AnimatedSize(
            curve: Curves.easeIn,
            vsync: this,
            duration: Duration(seconds: 1),
            child: FlutterLogo(
              size: _size,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _animateSize,
        child: Icon(Icons.play_arrow),
      ),
    );
  }

  void _animateSize() {
    setState(() {
      _size = _large ? 250.0 : 100.0;
      _large = !_large;
    });
  }
}
