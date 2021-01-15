import 'package:flutter/material.dart';

class SampleContainer extends StatelessWidget {
  final double mHeight;
  final double mWidth;
  final Color mColor;
  final Widget child;

  const SampleContainer(
      {Key key,
      this.mHeight = 100,
      this.mWidth = 100,
      this.mColor = Colors.blue,
      this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: mHeight,
      width: mWidth,
      decoration: BoxDecoration(
        color: mColor,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
              offset: Offset(0.0, 4.0), blurRadius: 4, color: Colors.black26)
        ],
      ),
      child: child,
    );
  }
}
