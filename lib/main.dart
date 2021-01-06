import 'package:flutter/material.dart';
import 'package:flutter_animations_app/animations/animated_align_sample.dart';
import 'package:flutter_animations_app/animations/animated_builder_sample.dart';
import 'package:flutter_animations_app/animations/animated_container_sample.dart';
import 'package:flutter_animations_app/animations/animated_cross_fade.dart';

const animationList = [
  'Curved Animation',
  'Animated Align',
  'Animated Builder',
  'Animated Cross Fade'
];

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: animationList.length,
          itemBuilder: (_, index) {
            return ListTile(
              title: Text(animationList[index]),
              onTap: () {
                _goToAnimationScreen(index);
              },
            );
          },
        ),
      ),
    );
  }

  void _goToAnimationScreen(int index) {
    Widget nextWidget;
    switch (index) {
      case 0:
        nextWidget = AnimatedContainerSample();
        break;
      case 1:
        nextWidget = AnimatedAlignSample();
        break;
      case 2:
        nextWidget = AnimatedBuilderSample();
        break;
      case 3:
        nextWidget = AnimatedCrossFadeSample();
        break;
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => nextWidget),
    );
  }
}
