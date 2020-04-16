import 'package:covid_app/app/components/animatedCounter.dart';
import 'package:covid_app/app/components/imageMainWidget.dart';
import 'package:covid_app/app/components/stateList.dart';
import 'package:covid_app/app/controllers/controller.dart';
import 'package:covid_app/app/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:skeleton_text/skeleton_text.dart';

class HomePage extends StatelessWidget {
  final controller = GetIt.I.get<Controller>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: RefreshIndicator(
            onRefresh: controller.brController.getBrasilCases,
            color: CustomColors.darkRed,
            child: ListView(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    padding: EdgeInsets.only(top: 20, right: 20),
                    icon: Icon(Icons.arrow_downward),
                    color: CustomColors.grey,
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                Center(
                    child: ImageMainWidget(
                  asset: 'assets/Images/city.svg',
                  width: MediaQuery.of(context).size.width * 0.9,
                )),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    'COVID-19',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: CustomColors.pink,
                        fontSize: 18),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    'PELO BRASIL',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: CustomColors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Observer(
                      builder: (_) => controller.brController.date == null
                          ? SkeletonAnimation(
                              child: Container(
                                width: 250,
                                height: 20,
                                decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                            )
                          : Text(
                              "Dados referentes ao dia " +
                                  controller.brController.date
                                      .split('-')[2] +
                                  '/' +
                                  controller.brController.date
                                      .split('-')[1] +
                                  '/' +
                                  controller.brController.date
                                      .split('-')[0],
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: CustomColors.darkGrey,
                                  fontSize: 10),
                            )),
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
                        Observer(
                            builder: (_) => AnimatedCount(
                                  count: controller
                                              .brController.confirmedCases ==
                                          null
                                      ? 0
                                      : controller.brController.confirmedCases,
                                  duration: Duration(seconds: 1),
                                  curve: Curves.bounceIn,
                                )),
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
                        Observer(
                            builder: (_) => AnimatedCount(
                                  count:
                                      controller.brController.deathCases == null
                                          ? 0
                                          : controller.brController.deathCases,
                                  duration: Duration(seconds: 1),
                                  curve: Curves.bounceIn,
                                )),
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
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    'COVID-19',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: CustomColors.pink,
                        fontSize: 18),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    'POR ESTADO',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: CustomColors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                ),
                Observer(
                    builder: (_) => controller.brController.items == null
                        ? Center(
                            child: SkeletonAnimation(
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                height: 140,
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                            ),
                          )
                        : StateList(
                            states: controller.brController.items,
                          ))
              ],
            )));
  }
}
