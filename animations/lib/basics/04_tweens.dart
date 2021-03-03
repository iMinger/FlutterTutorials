import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TweensDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TweensDemoState();
  }
}

class _TweensDemoState extends State<TweensDemo> with SingleTickerProviderStateMixin {
  static const Duration _duration = Duration(seconds: 1);
  static const double accountBalance = 1000000;

  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(vsync: this, duration: _duration)
      ..addListener(() {
        setState(() {});
      });

    animation = Tween(begin: 0.0, end: accountBalance).animate(controller);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Tweens"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 200),
              child: Text(
                "${animation.value.toStringAsFixed(2)}",
                style: TextStyle(fontSize: 24),
              ),
            ),
            RaisedButton(
                child: Text(
                  controller.status == AnimationStatus.completed ? 'Buy a Mansion' : "Win Lottery",
                ),
                onPressed: () {
                  if (controller.status == AnimationStatus.completed) {
                    controller.reverse();
                  } else {
                    controller.forward();
                  }
                })
          ],
        ),
      ),
    );
  }
}
