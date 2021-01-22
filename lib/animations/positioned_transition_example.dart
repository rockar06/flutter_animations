import 'package:flutter/material.dart';

class PositionedTransitionExample extends StatefulWidget {
  @override
  _PositionedTransitionExampleState createState() =>
      _PositionedTransitionExampleState();
}

class _PositionedTransitionExampleState
    extends State<PositionedTransitionExample> with TickerProviderStateMixin {
  final double smallLogo = 100;
  final double bigLogo = 200;

  bool _forwardAnimation = false;
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
        title: const Text('Positioned Transition'),
      ),
      body: _buildLayout(),
      floatingActionButton: FloatingActionButton(
        onPressed: _animateWidget,
        child: Icon(Icons.play_arrow),
      ),
    );
  }

  Widget _buildLayout() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final Size biggest = constraints.biggest;
        return Stack(
          children: [
            PositionedTransition(
              rect: RelativeRectTween(
                begin: RelativeRect.fromSize(
                    Rect.fromLTWH(0, 0, smallLogo, smallLogo), biggest),
                end: RelativeRect.fromSize(
                    Rect.fromLTWH(biggest.width - bigLogo,
                        biggest.height - bigLogo, bigLogo, bigLogo),
                    biggest),
              ).animate(
                CurvedAnimation(
                  parent: _controller,
                  curve: Curves.elasticInOut,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: FlutterLogo(),
              ),
            ),
          ],
        );
      },
    );
  }

  void _animateWidget() {
    setState(() {
      _forwardAnimation = !_forwardAnimation;
      if (_forwardAnimation) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }
}
