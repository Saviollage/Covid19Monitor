import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skeleton_text/skeleton_text.dart';

class ImageMainWidget extends StatefulWidget {
  final String asset;
  final double width;
  final int seconds;

  const ImageMainWidget(
      {Key key, @required this.asset, @required this.width, this.seconds})
      : super(key: key);
  @override
  _ImageMainWidgetState createState() => _ImageMainWidgetState();
}

class _ImageMainWidgetState extends State<ImageMainWidget>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;

  Animation animation;

  @override
  void initState() {
    super.initState();

    animationController = new AnimationController(
      vsync: this,
      duration:
          new Duration(seconds: widget.seconds == null ? 3 : widget.seconds),
    );

    animationController.repeat(reverse: true);

    animation = Tween(begin: 0.9, end: 1).animate(animationController);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      alignment: Alignment.center,
      child: new AnimatedBuilder(
        animation: animation,
        child: SvgPicture.asset(
          widget.asset,
          width: widget.width,
          placeholderBuilder: (_) => SkeletonAnimation(
            child: Container(
              width: widget.width,
              height: widget.width,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(20)),
            ),
          ),
        ),
        builder: (BuildContext context, Widget _widget) {
          return new Transform.scale(
            scale: animation.value,
            child: _widget,
          );
        },
      ),
    );
  }
}
