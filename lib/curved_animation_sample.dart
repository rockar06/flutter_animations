import 'package:flutter/material.dart';

class CurvedAnimationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Curved Animation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'This is a sample of Curved Animation',
            ),
          ],
        ),
      ),
    );
  }
}
