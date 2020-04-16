import 'package:covid_app/app/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skeleton_text/skeleton_text.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactButton extends StatelessWidget {
  final String asset;
  final String title;
  final String link;
  final double wid;

  const ContactButton(
      {Key key,
      @required this.asset,
      @required this.title,
      this.link,
      this.wid})
      : super(key: key);

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => _launchURL(link),
        child: Container(
          height: 200,
          width: wid,
          padding: EdgeInsets.symmetric(horizontal: wid / 10, vertical: 10),
          margin: EdgeInsets.symmetric(horizontal: wid / 10, vertical: 10),
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
                              borderRadius: BorderRadius.circular(100)),
                        ),
                      )),
              SizedBox(
                height: 10,
              ),
              Expanded(
                  child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
              )),
            ],
          ),
        ));
  }
}
