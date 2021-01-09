import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_animations_app/utils/sample_container.dart';

class AnimatedBuilderExample extends StatefulWidget {
  @override
  _AnimatedBuilderExampleState createState() => _AnimatedBuilderExampleState();
}

class _AnimatedBuilderExampleState extends State<AnimatedBuilderExample>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  final double _width = 75;
  final double _height = 75;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();
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
        title: Text('AnimatedBuilder Sample'),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          child: SampleContainer(
            mHeight: _height,
            mWidth: _width,
            child: const Center(
              child: Text('Whee!'),
            ),
          ),
          builder: (BuildContext context, Widget child) {
            return Transform.rotate(
              angle: _controller.value * 2.0 * math.pi,
              child: child,
            );
          },
        ),
      ),
    );
  }
}
