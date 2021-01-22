import 'package:flutter/material.dart';

class ScaleTransitionExample extends StatefulWidget {
  @override
  _ScaleTransitionExampleState createState() => _ScaleTransitionExampleState();
}

class _ScaleTransitionExampleState extends State<ScaleTransitionExample>
    with TickerProviderStateMixin {
  bool isForward = false;
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    _controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    _animation =
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scale Transition'),
      ),
      body: Center(
        child: ScaleTransition(
          scale: _animation,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: FlutterLogo(
              size: 150.0,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _animateTransition,
        child: Icon(Icons.play_arrow),
      ),
    );
  }

  void _animateTransition() {
    setState(() {
      isForward = !isForward;
      if (isForward) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }
}
