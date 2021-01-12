import 'package:flutter/material.dart';

class AnimatedOpacityExample extends StatefulWidget {
  @override
  _AnimatedOpacityExampleState createState() => _AnimatedOpacityExampleState();
}

class _AnimatedOpacityExampleState extends State<AnimatedOpacityExample> {
  double opacityLevel = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Opacity'),
      ),
      body: Center(
        child: AnimatedOpacity(
          opacity: opacityLevel,
          duration: Duration(seconds: 1),
          child: FlutterLogo(
            size: 200,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _changeOpacity,
        child: Icon(Icons.play_arrow),
      ),
    );
  }

  void _changeOpacity() {
    setState(() => opacityLevel = opacityLevel == 0 ? 1.0 : 0);
  }
}
