import 'package:covid_app/app/components/contactButton.dart';
import 'package:covid_app/app/components/imageMainWidget.dart';
import 'package:covid_app/app/components/prevetionList.dart';
import 'package:covid_app/app/components/symptomsList.dart';
import 'package:covid_app/app/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skeleton_text/skeleton_text.dart';

class Covidpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      //color: CustomColors.lightGrey,
      child: SafeArea(
        child: ListView(
          children: <Widget>[
            Container(
              height: 250,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    left: 0,
                    top: 25,
                    child: ImageMainWidget(
                      asset: 'assets/Images/medicos_1.svg',
                      width: 205,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 20,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: IconButton(
                        icon: Icon(Icons.arrow_back),
                        color: CustomColors.grey,
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ),
                  Positioned(
                      right: 0,
                      top: 195,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'Fique alerta',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: CustomColors.pink,
                              fontSize: 22),
                        ),
                      )),
                  Positioned(
                      right: 0,
                      top: 220,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          '& proteja sua família',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: CustomColors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
                        ),
                      )),
                ],
              ),
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
                  'Sintomas',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: CustomColors.pink),
                  textAlign: TextAlign.start,
                )),
            SymptomsList(),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  '* Percentual de pacientes com coronavírus que apresentaram o sintoma. \nFONTE: Dados compilados pela OMS ao analisar mais de 55 mil casos confirmados',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 8,
                      color: Colors.grey),
                )),
            SizedBox(
              height: 20,
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
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
                  'Prevenção',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: CustomColors.pink),
                  textAlign: TextAlign.start,
                )),
            PrevetionsList(),
            Container(
                height: 300,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                        right: 0,
                        child: SvgPicture.asset(
                          'assets/Images/virus.svg',
                          width: 90,
                          placeholderBuilder: (_) => SkeletonAnimation(
                            child: Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                          ),
                        )),
                    Positioned(
                        child: ListView(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
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
                              'Mais informações',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: CustomColors.pink),
                              textAlign: TextAlign.start,
                            )),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              '* Bots oficiais para tirar duvidas da população acerca do COVID-19',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 8,
                                  color: Colors.grey),
                            )),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            ContactButton(
                              asset: 'assets/Images/phone.svg',
                              title: 'Organização Mundial da Saúde',
                              link:
                                  'https://api.whatsapp.com/send?phone=41225017735&text=oi&source=&data=',
                              wid: MediaQuery.of(context).size.width * 0.4,
                            ),
                            ContactButton(
                              asset: 'assets/Images/phone.svg',
                              title: 'Ministério da Saúde',
                              link:
                                  'https://api.whatsapp.com/send?phone=556199380031&text=oi&source=&data=',
                              wid: MediaQuery.of(context).size.width * 0.4,
                            ),
                          ],
                        ),
                      ],
                    )),
                  ],
                )),
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    ));
  }
}
