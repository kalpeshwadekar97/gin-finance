import 'package:flutter/material.dart';
import 'package:gin_finance/constants/color_palette.dart';

class CalendarIcon extends StatefulWidget {
  _CalendarIconState createState() => _CalendarIconState();
}

class _CalendarIconState extends State<CalendarIcon> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) => Calendar(animation: animation);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class Calendar extends AnimatedWidget {
  static final _opacityTween = Tween<double>(begin: 1, end: 1);
  static final _sizeTween = Tween<double>(begin: 40, end: 60);

  Calendar({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Center(
      child: Opacity(
        opacity: _opacityTween.evaluate(animation),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          height: _sizeTween.evaluate(animation),
          width: _sizeTween.evaluate(animation),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(_sizeTween.evaluate(animation)),
          ),
          child: Center(child: Icon(Icons.calendar_today, color: Color(ColorPalette.PRIMARY_COLOR),)),
        ),
      ),
    );
  }
}