import 'package:flutter/material.dart';

class RotationTransitionExample extends StatefulWidget {
  @override
  _RotationTransitionExampleState createState() =>
      _RotationTransitionExampleState();
}

class _RotationTransitionExampleState extends State<RotationTransitionExample>
    with TickerProviderStateMixin {
  bool isForward = false;
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.elasticOut);
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
        title: const Text('Rotation Transition'),
      ),
      body: Center(
        child: RotationTransition(
          turns: _animation,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: FlutterLogo(
              size: 150,
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
