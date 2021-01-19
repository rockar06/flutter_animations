import 'package:flutter/material.dart';
import 'package:flutter_animations_app/animations/hero_widget_example.dart';

class HeroTransitionWidget extends StatelessWidget {
  final ButtonType buttonType;

  const HeroTransitionWidget({Key key, this.buttonType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hero Transition'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Hero(
              tag: buttonType.tag,
              child: Container(
                color: buttonType.buttonColor,
                width: 250,
                height: 250,
                child: Center(
                  child: FlutterLogo(
                    size: 140,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
