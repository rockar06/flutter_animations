import 'package:flutter/material.dart';

class AnimatedCount extends ImplicitlyAnimatedWidget {
  final int count;

  AnimatedCount({
    Key key,
    @required this.count,
    @required Duration duration,
    Curve curve = Curves.decelerate,
  }) : super(duration: duration, curve: curve, key: key);

  @override
  _AnimatedCountState createState() => _AnimatedCountState();
}

class _AnimatedCountState extends AnimatedWidgetBaseState<AnimatedCount> {
  IntTween _count;

  @override
  Widget build(BuildContext context) {
    return Text(
      _count.evaluate(animation).toString(),
      style: Theme.of(context).textTheme.headline4,
    );
  }

  @override
  void forEachTween(visitor) {
    _count = visitor(
        _count, widget.count, (dynamic value) => IntTween(begin: value));
  }
}
