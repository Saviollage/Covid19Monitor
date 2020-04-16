import 'package:covid_app/app/util/colors.dart';
import 'package:flutter/material.dart';

class InfoButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: 30,
      margin: EdgeInsets.only(right: 20, top: 15, bottom: 10),
      decoration: BoxDecoration(
          color: CustomColors.darkRed, borderRadius: BorderRadius.circular(5)),
      child: Icon(Icons.more_vert),
    );
  }
}
