import 'package:covid_app/app/models/itemModel.dart';
import 'package:covid_app/app/pages/cityPage.dart';
import 'package:covid_app/app/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skeleton_text/skeleton_text.dart';

class CityCard extends StatelessWidget {
  final Item city;

  const CityCard({Key key, this.city}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
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
          onTap: () => Navigator.push(
              context,
              new MaterialPageRoute(
                  builder: (_) => CityPage(
                        city: city,
                      ))),
          leading: Hero(
              tag: 'hero_' + city.cityIbgeCode.toString(),
              child: SvgPicture.asset('assets/Images/search_city.svg',
                  height: 50,
                  placeholderBuilder: (_) => SkeletonAnimation(
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(100)),
                        ),
                      ))),
          title: Text(
            city.city.toString(),
            overflow: TextOverflow.ellipsis,
            style: TextStyle( fontFamily:'Montserrat',
                fontWeight: FontWeight.bold, fontSize: 16),
          ),
          subtitle: Text(
            "Último registro " +
                city.date.split('-')[2] +
                '/' +
                city.date.split('-')[1] +
                '/' +
                city.date.split('-')[0],
            style: TextStyle( fontFamily:'Montserrat',
                fontWeight: FontWeight.w400, color: Colors.grey, fontSize: 12),
          ),
          trailing: RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: [
                TextSpan(
                  text:
                      city.confirmed == null ? '0' : city.confirmed.toString(),
                  style: TextStyle( fontFamily:'Montserrat',color: CustomColors.grey),
                ),
                TextSpan(text: ' / ', style: TextStyle(color: Colors.grey)),
                TextSpan(
                    text: city.deaths == null ? '0' : city.deaths.toString(),
                    style: TextStyle( fontFamily:'Montserrat',color: CustomColors.pink))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
