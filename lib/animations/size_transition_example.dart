import 'package:flutter/material.dart';

class SizeTransitionExample extends StatefulWidget {
  @override
  _SizeTransitionExampleState createState() => _SizeTransitionExampleState();
}

class _SizeTransitionExampleState extends State<SizeTransitionExample>
    with TickerProviderStateMixin {
  bool _isForward = false;
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
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
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Size Transition'),
        ),
        body: Center(
          child: SizeTransition(
            sizeFactor: _animation,
            child: Center(
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
