import 'package:covid_app/app/models/itemModel.dart';
import 'package:covid_app/app/pages/statePage.dart';
import 'package:covid_app/app/util/colors.dart';
import 'package:covid_app/app/util/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skeleton_text/skeleton_text.dart';

class StateCard extends StatelessWidget {
  final Item state;

  const StateCard({Key key, @required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (_) => StatePage(
                      state: state,
                    ))),
        child: Container(
          height: 150,
          width: 150,
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
              Hero(
                tag: 'hero_' + state.state,
                child: SvgPicture.asset('assets/Images/pin.svg',
                    width: 50,
                    placeholderBuilder: (_) => SkeletonAnimation(
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(100)),
                          ),
                        )),
              ),
              Expanded(
                  child: Text(
                Data.states[state.state],
                textAlign: TextAlign.center,
                style: TextStyle( fontFamily:'Montserrat',fontWeight: FontWeight.bold),
              )),
            ],
          ),
        ));
  }
}
