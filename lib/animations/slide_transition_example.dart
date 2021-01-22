import 'package:flutter/material.dart';

class SlideTransitionExample extends StatefulWidget {
  @override
  _SlideTransitionExampleState createState() => _SlideTransitionExampleState();
}

class _SlideTransitionExampleState extends State<SlideTransitionExample>
    with TickerProviderStateMixin {
  bool _isForward = false;
  AnimationController _controller;
  Animation<Offset> _animation;

  @override
  void initState() {
    _controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    _animation =
        Tween<Offset>(begin: Offset.zero, end: const Offset(1.5, 0.0)).animate(
      CurvedAnimation(parent: _controller, curve: Curves.elasticIn),
    );
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
        title: const Text('Slide Transition'),
      ),
      body: Center(
        child: SlideTransition(
          position: _animation,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
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
      _isForward = !_isForward;
      if (_isForward) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }
}
