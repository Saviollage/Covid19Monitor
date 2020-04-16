import 'package:covid_app/app/models/boletimModel.dart';
import 'package:covid_app/app/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skeleton_text/skeleton_text.dart';
import 'package:url_launcher/url_launcher.dart';

class BoletimCard extends StatelessWidget {
  final Boletim boletim;

  const BoletimCard({Key key, this.boletim}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
      child: Center(
        child: ListTile(
          onTap: () async {
            String url = boletim.url.toString();
            if (await canLaunch(url)) {
              await launch(url);
            }
          },
          leading: SvgPicture.asset('assets/Images/document.svg',
              height: 60,
              placeholderBuilder: (_) => SkeletonAnimation(
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(100)),
                    ),
                  )),
          title: Text(
            "Boletim dia " +
                boletim.date.split('-')[2] +
                '/' +
                boletim.date.split('-')[1] +
                '/' +
                boletim.date.split('-')[0],
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
          subtitle: Text(
            boletim.notes != null ? boletim.notes : 'Sem observações',
            maxLines: boletim.notes != null ? 5 : 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w400,
                color: Colors.grey,
                fontSize: 12),
          ),
        ),
      ),
    );
  }
}
