import 'package:flutter/material.dart';

class AnimatedPhysicalModelExample extends StatefulWidget {
  @override
  _AnimatedPhysicalModelExampleState createState() =>
      _AnimatedPhysicalModelExampleState();
}

class _AnimatedPhysicalModelExampleState
    extends State<AnimatedPhysicalModelExample> {
  var _elevation = 10.0;
  var _containerColor = Colors.blue;
  var _borderRadius = 6.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Opacity'),
      ),
      body: Center(
        child: AnimatedPhysicalModel(
          child: Container(
            width: 200,
            height: 200,
          ),
          shape: BoxShape.rectangle,
          elevation: _elevation,
          color: _containerColor,
          shadowColor: Colors.black,
          curve: Curves.fastOutSlowIn,
          borderRadius: BorderRadius.all(Radius.circular(_borderRadius)),
          duration: Duration(seconds: 2),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _animateModel,
        child: Icon(Icons.play_arrow),
      ),
    );
  }

  void _animateModel() {
    setState(() {
      _containerColor =
          _containerColor == Colors.blue ? Colors.red : Colors.blue;
      _elevation = _elevation == 6 ? 30 : 6;
      _borderRadius = _borderRadius == 6.0 ? 18.0 : 6.0;
    });
  }
}
