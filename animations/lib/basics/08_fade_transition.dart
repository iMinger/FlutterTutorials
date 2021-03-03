import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FadeTransitionDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FadeTransitionDemoState();
  }
}

class _FadeTransitionDemoState extends State<FadeTransitionDemo> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;
  CurvedAnimation _curve;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 500));

    _curve = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    _animation = Tween(
      begin: 1.0,
      end: 0.0,
    ).animate(_curve);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Fade Transition"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FadeTransition(
              opacity: _animation,
              child: Icon(
                Icons.star,
                color: Colors.amber,
                size: 300,
              ),
            ),
            RaisedButton(
                child: Text("animate"),
                onPressed: () {
                  setState(() {
                    _controller.animateTo(1.0).then<TickerFuture>((value) {
                      return _controller.animateBack(0.0);
                    });
                  });
                }),
          ],
        ),
      ),
    );
  }
}
