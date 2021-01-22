import 'package:flutter/material.dart';
import 'package:flutter_animations_app/utils/animatedwidget/spinning_container.dart';
import 'package:flutter_animations_app/utils/sample_container.dart';

class AnimatedWidgetExample extends StatefulWidget {
  @override
  _AnimatedWidgetExampleState createState() => _AnimatedWidgetExampleState();
}

class _AnimatedWidgetExampleState extends State<AnimatedWidgetExample>
    with TickerProviderStateMixin {
  bool isAnimating = false;
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
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
        title: const Text('Animated Widget'),
      ),
      body: Center(
        child: SpinningContainer(
          controller: _controller,
          child: SampleContainer(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _changeAnimationState,
        child: Icon(Icons.play_arrow),
      ),
    );
  }

  void _changeAnimationState() {
    setState(() {
      isAnimating = !isAnimating;
      if (isAnimating) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }
}
