import 'package:covid_app/app/components/covidImage.dart';
import 'package:covid_app/app/components/imageMainWidget.dart';
import 'package:covid_app/app/components/menuButton.dart';
import 'package:covid_app/app/controllers/controller.dart';
import 'package:covid_app/app/pages/aboutPage.dart';
import 'package:covid_app/app/pages/covidPage.dart';
import 'package:covid_app/app/pages/homePage.dart';
import 'package:covid_app/app/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class StayHomePage extends StatelessWidget {
  final controller = GetIt.I.get<Controller>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      //color: CustomColors.lightGrey,
      child: SafeArea(
        child: ListView(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.width,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: -10,
                    child: Center(
                        child: ImageMainWidget(
                      asset: 'assets/Images/fique_em_casa.svg',
                      width: MediaQuery.of(context).size.width,
                    )),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      padding: EdgeInsets.only(top: 20, right: 20),
                      icon: Icon(Icons.info_outline),
                      color: CustomColors.grey,
                      onPressed: () => Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    AboutPage(),
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              var begin = Offset(0, -1);
                              var end = Offset.zero;
                              var curve = Curves.easeInOut;

                              var tween = Tween(begin: begin, end: end)
                                  .chain(CurveTween(curve: curve));

                              return SlideTransition(
                                position: animation.drive(tween),
                                child: child,
                              );
                            },
                          )),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'FIQUE EM CASA',
                textAlign: TextAlign.start,
                style: TextStyle( fontFamily:'Montserrat',
                    color: CustomColors.pink, fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18),
              child: Text(
                'FIQUE A SALVO',
                style: TextStyle( fontFamily:'Montserrat',
                    color: CustomColors.darkRed,
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
                height: MediaQuery.of(context).size.width * 0.7,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                        left: 0,
                        top: 10,
                        child: Container(
                          padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.25, left: 20),
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            'Evite ao máximo sair de casa durante o período de quarentena. Cuide de você e sua família! ',
                            style: TextStyle( fontFamily:'Montserrat',fontSize: 14),
                          ),
                        )),
                    Center(
                      child: MenuButton(
                        color: CustomColors.pink,
                        text: 'SAIBA MAIS',
                        onTap: () => Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      Covidpage(),
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                var begin = Offset(-1, 0);
                                var end = Offset.zero;
                                var curve = Curves.easeInOut;

                                var tween = Tween(begin: begin, end: end)
                                    .chain(CurveTween(curve: curve));

                                return SlideTransition(
                                  position: animation.drive(tween),
                                  child: child,
                                );
                              },
                            )),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 120),
                      child: Center(
                          child: MenuButton(
                        color: CustomColors.darkRed,
                        text: 'DADOS NO BRASIL',
                        onTap: () => Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      HomePage(),
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                var begin = Offset(0, 1);
                                var end = Offset.zero;
                                var curve = Curves.easeInOut;

                                var tween = Tween(begin: begin, end: end)
                                    .chain(CurveTween(curve: curve));

                                return SlideTransition(
                                  position: animation.drive(tween),
                                  child: child,
                                );
                              },
                            )),
                      )),
                    ),
                    Positioned(
                        right: -1 * MediaQuery.of(context).size.width * 0.25,
                        child: CovidWidget())
                  ],
                )),
          ],
        ),
      ),
    ));
  }
}
