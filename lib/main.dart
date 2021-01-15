import 'package:flutter/material.dart';
import 'package:flutter_animations_app/animations/animated_align_example.dart';
import 'package:flutter_animations_app/animations/animated_builder_example.dart';
import 'package:flutter_animations_app/animations/animated_container_example.dart';
import 'package:flutter_animations_app/animations/animated_cross_fade_example.dart';
import 'package:flutter_animations_app/animations/animated_default_text_style_example.dart';
import 'package:flutter_animations_app/animations/animated_list_state_example.dart';
import 'package:flutter_animations_app/animations/animated_model_barrier_example.dart';
import 'package:flutter_animations_app/animations/animated_opacity_example.dart';
import 'package:flutter_animations_app/animations/animated_physical_model_example.dart';
import 'package:flutter_animations_app/animations/animated_positioned_example.dart';
import 'package:flutter_animations_app/animations/animated_size_example.dart';

const animationList = [
  'Curved Animation',
  'Animated Align',
  'Animated Builder',
  'Animated Cross Fade',
  'Animated Default Text Style',
  'Animated List State',
  'Animated Model Barrier',
  'Animated Opacity',
  'Animated Physical Model',
  'Animated Positioned',
  'Animated Size'
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
        nextWidget = AnimatedContainerExample();
        break;
      case 1:
        nextWidget = AnimatedAlignExample();
        break;
      case 2:
        nextWidget = AnimatedBuilderExample();
        break;
      case 3:
        nextWidget = AnimatedCrossFadeExample();
        break;
      case 4:
        nextWidget = AnimatedDefaultTextStyleExample();
        break;
      case 5:
        nextWidget = AnimatedListExample();
        break;
      case 6:
        nextWidget = AnimatedModelBarrierExample();
        break;
      case 7:
        nextWidget = AnimatedOpacityExample();
        break;
      case 8:
        nextWidget = AnimatedPhysicalModelExample();
        break;
      case 9:
        nextWidget = AnimatedPositionedExample();
        break;
      case 10:
        nextWidget = AnimatedSizeExample();
        break;
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => nextWidget),
    );
  }
}
