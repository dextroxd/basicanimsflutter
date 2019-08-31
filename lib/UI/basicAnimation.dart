import 'package:flutter/material.dart';

class BasicAnimation extends StatefulWidget {
  @override
  BasicAnimationState createState() => BasicAnimationState();
}

class BasicAnimationState extends State<BasicAnimation>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 1500));
    animation = Tween<double>(begin:0.0,end:1.0).animate(animationController);
    animation.addStatusListener((status)=>print("$status"));
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: AnimatedLogo(
          animation: animation,
        ),
      ),
    );
  }
}

class AnimatedLogo extends AnimatedWidget{
  final Tween _sizeAnimation = Tween<double>(begin: 50,end: 100);
  AnimatedLogo({Key key,Animation animation}):super(key:key,listenable:animation);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final Animation<double>animation = listenable;
    return Opacity(
      opacity: animation.value,
      child:Container(
        height: _sizeAnimation.evaluate(animation),
        width: 100.0,
        child: FlutterLogo(),
      ),
    );
  }
}
