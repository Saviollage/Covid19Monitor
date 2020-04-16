import 'package:covid_app/app/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skeleton_text/skeleton_text.dart';

class SymptomCard extends StatelessWidget {
  final String asset;
  final String title;
  final String text;

  const SymptomCard(
      {Key key, @required this.asset, @required this.title, this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: 170,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                blurRadius: 5,
                color: CustomColors.lightGrey,
                offset: Offset(4, 6),
                spreadRadius: 2)
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SvgPicture.asset(asset,
              width: 100,
              placeholderBuilder: (_) => SkeletonAnimation(
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(100)
                      ),
                    ),
                  )),
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: Text(
            title,
            style: TextStyle( fontFamily:'Montserrat',fontWeight: FontWeight.bold),
          )),
          Expanded(
              child: Text(
            text,
            style: TextStyle( fontFamily:'Montserrat',fontSize: 10),
          )),
        ],
      ),
    );
  }
}
