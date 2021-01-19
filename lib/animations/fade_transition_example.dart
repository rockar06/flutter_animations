import 'package:flutter/material.dart';

class FadeTransitionExample extends StatefulWidget {
  @override
  _FadeTransitionExampleState createState() => _FadeTransitionExampleState();
}

class _FadeTransitionExampleState extends State<FadeTransitionExample>
    with TickerProviderStateMixin {
  bool isVisible = false;
  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fade Transition'),
      ),
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: FlutterLogo(
            size: 200,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _changeFadeTransition,
        child: Icon(Icons.play_arrow),
      ),
    );
  }

  void _changeFadeTransition() {
    setState(() {
      isVisible = !isVisible;
      if (isVisible) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }
}
