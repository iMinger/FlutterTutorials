import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedContainerDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AnimatedContainerDemoState();
  }
}

class _AnimatedContainerDemoState extends State<AnimatedContainerDemo> {
  Color color;
  double borderRadius;
  double margin;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    color = Colors.deepPurple;
    borderRadius = generateMargin();
    margin = generateMargin();
  }

  double generateBorderRadius() {
    return Random().nextDouble() * 64;
  }

  double generateMargin() {
    return Random().nextDouble() * 64;
  }

  Color generateColor() {
    return Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimatedContainer"),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: SizedBox(
                width: 128,
                height: 128,
                child: AnimatedContainer(
                  margin: EdgeInsets.all(margin),
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
                  duration: Duration(milliseconds: 400),
                ),
              ),
            ),
            RaisedButton(
                child: Text("change"),
                onPressed: () {
                  setState(() {
                    color = generateColor();
                    borderRadius = generateBorderRadius();
                    margin = generateMargin();
                  });
                })
          ],
        ),
      ),
    );
  }
}
