import 'package:covid_app/app/components/animatedCounter.dart';
import 'package:covid_app/app/components/barChart.dart';
import 'package:covid_app/app/components/imageMainWidget.dart';
import 'package:covid_app/app/controllers/city_controller.dart';
import 'package:covid_app/app/models/itemModel.dart';
import 'package:covid_app/app/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:skeleton_text/skeleton_text.dart';

class CityPage extends StatefulWidget {
  final Item city;
  const CityPage({Key key, this.city}) : super(key: key);

  @override
  CityPageState createState() => CityPageState();
}

class CityPageState extends State<CityPage> {
  CityController controller;

  @override
  void initState() {
    controller =
        CityController(city: widget.city.city, state: widget.city.state);

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        //color: CustomColors.lightGrey,
        child: RefreshIndicator(
          onRefresh: controller.getCityData,
          color: CustomColors.darkRed,
          child: ListView(children: <Widget>[
            Container(
              height: 190,
              child: Stack(
                children: <Widget>[
                  Positioned(
                      left: 20,
                      top: -20,
                      child: Hero(
                        tag: 'hero_' + widget.city.cityIbgeCode.toString(),
                        child: ImageMainWidget(
                          asset: 'assets/Images/search_city.svg',
                          width: 210,
                        ),
                      )),
                  Positioned(
                    right: 0,
                    top: 20,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_downward,
                        ),
                        color: CustomColors.grey,
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ),
                  Positioned(
                      right: 0,
                      top: 135,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'CIDADE',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: CustomColors.pink,
                              fontSize: 20),
                        ),
                      )),
                  Positioned(
                      right: 0,
                      top: 155,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          widget.city.city,
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: CustomColors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                      )),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: Text(
                "Dados contabilizados até o dia " +
                    widget.city.date.split('-')[2] +
                    '/' +
                    widget.city.date.split('-')[1] +
                    '/' +
                    widget.city.date.split('-')[0],
                textAlign: TextAlign.end,
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: CustomColors.darkGrey,
                    fontSize: 10),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    AnimatedCount(
                      count: widget.city.confirmed,
                      duration: Duration(seconds: 1),
                      curve: Curves.bounceIn,
                    ),
                    Text(
                      'CASOS \nCONFIRMADOS',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: CustomColors.darkRed),
                    )
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    AnimatedCount(
                      count: widget.city.deaths,
                      duration: Duration(seconds: 1),
                      curve: Curves.bounceIn,
                    ),
                    Text(
                      'ÓBITOS \nCONFIRMADOS',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: CustomColors.darkRed),
                    )
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Divider(),
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Text(
                  'COVID-19',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: CustomColors.grey,
                  ),
                  textAlign: TextAlign.start,
                )),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Histórico de casos confirmados',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: CustomColors.pink),
                  textAlign: TextAlign.start,
                )),
            Observer(
                builder: (_) => controller.cases == null
                    ? Center(
                        child: SkeletonAnimation(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 200,
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          margin:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ))
                    : Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: SimpleBarChart(
                          controller.cases.toList(),
                          isCase: true,
                        ),
                      )),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  '* FONTE: Secretarias de Saúde das Unidades Federativas, dados tratados por Álvaro Justen/Brasil.io',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 8,
                      color: Colors.grey),
                )),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Text(
                  'COVID-19',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: CustomColors.grey,
                  ),
                  textAlign: TextAlign.start,
                )),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Histórico de óbitos confirmados',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: CustomColors.pink),
                  textAlign: TextAlign.start,
                )),
            Observer(
                builder: (_) => controller.cases == null
                    ? Center(
                        child: SkeletonAnimation(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 200,
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          margin:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ))
                    : Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: SimpleBarChart(
                          controller.cases.toList(),
                          isCase: false,
                        ),
                      )),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  '* FONTE: Secretarias de Saúde das Unidades Federativas, dados tratados por Álvaro Justen/Brasil.io',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 8,
                      color: Colors.grey),
                )),
          ]),
        ),
      ),
    );
  }
}
