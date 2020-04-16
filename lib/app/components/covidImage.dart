import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skeleton_text/skeleton_text.dart';

class CovidWidget extends StatefulWidget {
  @override
  _CovidWidgetState createState() => _CovidWidgetState();
}

class _CovidWidgetState extends State<CovidWidget>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
      vsync: this,
      duration: new Duration(seconds: 15),
    );

    animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      alignment: Alignment.center,
      child: new AnimatedBuilder(
        animation: animationController,
        child: SvgPicture.asset(
          'assets/Images/corona.svg',
          height: 150,
          placeholderBuilder: (_) => SkeletonAnimation(
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(100)),
            ),
          ),
        ),
        builder: (BuildContext context, Widget _widget) {
          return new Transform.rotate(
            angle: animationController.value * 2 * pi,
            child: _widget,
          );
        },
      ),
    );
  }
}
