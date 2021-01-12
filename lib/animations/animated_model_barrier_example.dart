import 'package:flutter/material.dart';

class AnimatedModelBarrierExample extends StatefulWidget {
  @override
  _AnimatedModelBarrierExampleState createState() =>
      _AnimatedModelBarrierExampleState();
}

class _AnimatedModelBarrierExampleState
    extends State<AnimatedModelBarrierExample>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool _isLoading = false;
  AnimatedModalBarrier _animatedModalBarrier;
  AnimationController _animationController;
  Animation<Color> _colorTweenAnimation;

  @override
  void initState() {
    ColorTween _colorTween = ColorTween(
      begin: Colors.black12,
      end: Colors.black54,
    );

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _colorTweenAnimation = _colorTween.animate(_animationController);

    _animatedModalBarrier = AnimatedModalBarrier(
      color: _colorTweenAnimation,
      dismissible: false,
    );

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('AnimatedBuilder Sample'),
      ),
      body: Center(
        child: Container(
          height: 250,
          width: 250,
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: _buildStackWidgets(),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildStackWidgets() {
    List<Widget> stackWidgets = [
      RaisedButton(
        onPressed: _animateBarrier,
        color: Colors.blue,
        child: Text(
          'Try me!',
          style: TextStyle(color: Colors.white),
        ),
      )
    ];
    if (_isLoading) {
      stackWidgets.add(_animatedModalBarrier);
    }
    return stackWidgets;
  }

  void _animateBarrier() {
    _setLoading();
    _playAnimation();
    _showSnackBar();
    _setNotLoading();
  }

  void _setLoading() {
    setState(() {
      _isLoading = true;
    });
  }

  void _playAnimation() {
    _animationController.reset();
    _animationController.forward();
  }

  void _showSnackBar() {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text('Hey!'),
      ),
    );
  }

  void _setNotLoading() {
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        _isLoading = false;
      });
    });
  }
}
