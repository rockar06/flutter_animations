import 'package:flutter/material.dart';
import 'package:flutter_animations_app/animations/hero/hero_transition_widget.dart';

class HeroWidgetExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hero Widget'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _getFlutterLogoContainer(
                  context, ButtonType(Colors.amber, 'FlutterA')),
              _getFlutterLogoContainer(
                  context, ButtonType(Colors.blue, 'FlutterB')),
              _getFlutterLogoContainer(
                  context, ButtonType(Colors.green, 'FlutterC')),
            ],
          )
        ],
      ),
    );
  }

  Widget _getFlutterLogoContainer(BuildContext context, ButtonType buttonType) {
    return Hero(
      tag: buttonType.tag,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HeroTransitionWidget(
                buttonType: buttonType,
              ),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: buttonType.buttonColor,
              borderRadius: BorderRadius.all(
                Radius.circular(40),
              ),
            ),
            width: 80,
            height: 80,
            child: Center(
              child: FlutterLogo(
                size: 60,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ButtonType {
  final Color buttonColor;
  final String tag;

  ButtonType(this.buttonColor, this.tag);
}
