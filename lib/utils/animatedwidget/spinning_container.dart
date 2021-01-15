import 'dart:math' as math;

import 'package:flutter/material.dart';

class SpinningContainer extends AnimatedWidget {
  const SpinningContainer({Key key, AnimationController controller, this.child})
      : super(key: key, listenable: controller);

  final Widget child;

  Animation<double> get _progress => listenable;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: _progress.value * 2.0 * math.pi,
      child: child,
    );
  }
}
