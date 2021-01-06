import 'package:flutter/material.dart';

class AnimatedCrossFadeSample extends StatefulWidget {
  @override
  _AnimatedCrossFadeState createState() => _AnimatedCrossFadeState();
}

class _AnimatedCrossFadeState extends State<AnimatedCrossFadeSample> {
  bool _showFirst = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Curved Animation'),
      ),
      body: Center(
        child: AnimatedCrossFade(
          duration: const Duration(milliseconds: 300),
          firstChild: const FlutterLogo(
              style: FlutterLogoStyle.horizontal, size: 100.0),
          secondChild:
              const FlutterLogo(style: FlutterLogoStyle.stacked, size: 100.0),
          crossFadeState:
              _showFirst ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: () {
          _changeStateCrossFade();
        },
      ),
    );
  }

  void _changeStateCrossFade() {
    setState(() {
      _showFirst = !_showFirst;
    });
  }
}
