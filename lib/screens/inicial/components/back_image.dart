import 'package:flutter/material.dart';

class BackImage extends StatelessWidget {
  BackImage({this.child});

  final child;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/inicial.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: child,
      ),
    );
  }
}
