import 'package:flutter/material.dart';
import 'package:flutter_animations_app/utils/animatedwidget/animated_count.dart';

class AnimatedWidgetBaseStateExample extends StatefulWidget {
  @override
  _AnimatedWidgetBaseStateExampleState createState() =>
      _AnimatedWidgetBaseStateExampleState();
}

class _AnimatedWidgetBaseStateExampleState
    extends State<AnimatedWidgetBaseStateExample> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Widget Base State'),
      ),
      body: Center(
        child: AnimatedCount(
          count: _count,
          curve: Curves.ease,
          duration: Duration(seconds: 3),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addDigits,
        child: Icon(Icons.add),
      ),
    );
  }

  void _addDigits() {
    setState(() {
      _count += 100;
    });
  }
}
