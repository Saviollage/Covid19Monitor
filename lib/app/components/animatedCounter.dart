import 'package:covid_app/app/util/colors.dart';
import 'package:flutter/material.dart';

class AnimatedCount extends ImplicitlyAnimatedWidget {
  final int count;

  AnimatedCount(
      {Key key,
      @required this.count,
      @required Duration duration,
      Curve curve = Curves.linear})
      : super(duration: duration, curve: curve, key: key);

  @override
  ImplicitlyAnimatedWidgetState<ImplicitlyAnimatedWidget> createState() =>
      _AnimatedCountState();
}

class _AnimatedCountState extends AnimatedWidgetBaseState<AnimatedCount> {
  IntTween _count;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Text(
      _count.evaluate(animation).toString(),
      style: TextStyle( fontFamily:'Montserrat',
          fontSize: 65,
          fontWeight: FontWeight.w200,
          color: CustomColors.darkGrey),
    );
  }

  @override
  void forEachTween(TweenVisitor visitor) {
    _count = visitor(
        _count, widget.count, (dynamic value) => new IntTween(begin: value));
  }
}
