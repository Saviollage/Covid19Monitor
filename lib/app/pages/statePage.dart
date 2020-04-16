import 'package:covid_app/app/components/animatedCounter.dart';
import 'package:covid_app/app/components/boletimCard.dart';
import 'package:covid_app/app/components/cityCard.dart';
import 'package:covid_app/app/components/imageMainWidget.dart';
import 'package:covid_app/app/controllers/state_controller.dart';
import 'package:covid_app/app/models/itemModel.dart';
import 'package:covid_app/app/util/colors.dart';
import 'package:covid_app/app/util/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:skeleton_text/skeleton_text.dart';

class StatePage extends StatefulWidget {
  final Item state;
  const StatePage({Key key, this.state}) : super(key: key);

  @override
  StatePageState createState() => StatePageState();
}

class StatePageState extends State<StatePage> {
  StateController controller;

  @override
  void initState() {
    controller = StateController(state: widget.state.state);

    super.initState();
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
          onRefresh: controller.getCities,
          color: CustomColors.darkRed,
          child: ListView(children: <Widget>[
            Container(
              height: 190,
              child: Stack(
                children: <Widget>[
                  Positioned(
                      left: 0,
                      top: 0,
                      child: Hero(
                        tag: 'hero_' + widget.state.state,
                        child: ImageMainWidget(
                          asset: 'assets/Images/pin.svg',
                          width: 200,
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
                          'ESTADO',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: CustomColors.pink,
                              fontSize: 22),
                        ),
                      )),
                  Positioned(
                      right: 0,
                      top: 155,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          Data.states[widget.state.state],
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
                    widget.state.date.split('-')[2] +
                    '/' +
                    widget.state.date.split('-')[1] +
                    '/' +
                    widget.state.date.split('-')[0],
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
                      count: widget.state.confirmed,
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
                      count: widget.state.deaths,
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
            Observer(
                builder: (_) => controller.boletins == null
                    ? Center(
                        child: SkeletonAnimation(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 100,
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          margin:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ))
                    : BoletimCard(
                        boletim: controller.boletim,
                      )),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Divider(),
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: new TextFormField(
                  cursorColor: CustomColors.red,
                  onChanged: controller.setText,
                  decoration: InputDecoration(
                    hintText: 'Cidade',
                    border: OutlineInputBorder(),
                    hintStyle: TextStyle(fontFamily: 'Comfortaa'),
                    prefixIcon: Icon(Icons.search),
                  ),
                )),
            Observer(
              builder: (_) => controller.cities == null
                  ? ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 5,
                      itemBuilder: (context, index) => Center(
                              child: SkeletonAnimation(
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              height: 100,
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              margin: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                          )))
                  : controller.listFiltered.length == 0
                      ? Container(
                          height: 400,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ImageMainWidget(
                                  asset: 'assets/Images/search.svg',
                                  width: 200),
                              Text(
                                'Não encontramos esta cidade',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: CustomColors.pink,
                                    fontSize: 22),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 30),
                                child: Text(
                                  'Mas não se preocupe, isso significa que até a presente data não há registros de COVID-19 nesta cidade!',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      color: CustomColors.grey,
                                      fontSize: 14),
                                ),
                              )
                            ],
                          ),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: controller.listFilteredSize,
                          itemBuilder: (context, index) {
                            var city = controller.listFiltered[index];
                            return CityCard(
                              city: city,
                            );
                          }),
            )
          ]),
        ),
      ),
    );
  }
}
