import 'package:covid_app/app/components/imageMainWidget.dart';
import 'package:covid_app/app/util/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skeleton_text/skeleton_text.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      //color: CustomColors.lightGrey,
      child: SafeArea(
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.width * .7,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: -10,
                    child: Center(
                        child: ImageMainWidget(
                      asset: 'assets/Images/about.svg',
                      width: MediaQuery.of(context).size.width,
                    )),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      padding: EdgeInsets.only(top: 20, right: 20),
                      icon: Icon(Icons.close),
                      color: CustomColors.grey,
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'SOBRE O APP',
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: CustomColors.pink,
                    fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18),
              child: Text(
                'COVID-19 MONITOR',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: CustomColors.darkRed,
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Aplicação desenvolvida com propósitos de divulgar informações sobre as cidades brasileiras que possuem casos confirmados de COVID-19.",
                style: TextStyle(fontFamily: 'Montserrat', fontSize: 13),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Uso de dados',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    color: CustomColors.red),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: new RichText(
                text: new TextSpan(
                  children: [
                    new TextSpan(
                        text:
                            "Fonte dos dados estatísticos sobre a COVID19 no Brasil: Secretarias de Saúde das Unidades Federativas, dados tratados por Álvaro Justen/",
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.black,
                            fontSize: 13)),
                    new TextSpan(
                      text: 'Brasil.io.',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.blue,
                          fontSize: 13),
                      recognizer: new TapGestureRecognizer()
                        ..onTap = () async {
                          String url = 'https://brasil.io/dataset/covid19/caso';
                          if (await canLaunch(url)) {
                            await launch(url);
                          }
                        },
                    ),
                    new TextSpan(
                        text: "\nLicença dos dados convertidos: ",
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.black,
                            fontSize: 13)),
                    new TextSpan(
                      text: 'Creative Commons Attribution ShareAlike.',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.blue,
                          fontSize: 13),
                      recognizer: new TapGestureRecognizer()
                        ..onTap = () async {
                          String url =
                              'https://creativecommons.org/licenses/by-sa/4.0/';
                          if (await canLaunch(url)) {
                            await launch(url);
                          }
                        },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Uso das Imagens',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    color: CustomColors.red),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: new RichText(
                text: new TextSpan(
                  children: [
                    new TextSpan(
                        text: "Imagens gratuitas disponiveis em ",
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.black,
                            fontSize: 13)),
                    new TextSpan(
                      text: 'stories.freepik.com/',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.blue,
                          fontSize: 13),
                      recognizer: new TapGestureRecognizer()
                        ..onTap = () async {
                          String url = 'https://stories.freepik.com/';
                          if (await canLaunch(url)) {
                            await launch(url);
                          }
                        },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Desenvolvedor',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      color: CustomColors.red),
                )),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: ListTile(
                  title: Text(
                    'Sávio Lage',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  subtitle: Text(
                    '@saviollage',
                    style: TextStyle(fontFamily: 'Montserrat', fontSize: 12),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      GestureDetector(
                        child: SvgPicture.asset('assets/Images/gmail.svg',
                            width: 20,
                            placeholderBuilder: (_) => SkeletonAnimation(
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                  ),
                                )),
                        onTap: () async {
                          String url =
                              'mailto:saviohenrique.lage@gmail.com?subject=ContatoAppCovid';
                          if (await canLaunch(url)) {
                            await launch(url);
                          }
                        },
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        child: SvgPicture.asset('assets/Images/linkedin.svg',
                            width: 20,
                            placeholderBuilder: (_) => SkeletonAnimation(
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                  ),
                                )),
                        onTap: () async {
                          String url =
                              'https://www.linkedin.com/in/saviollage/';
                          if (await canLaunch(url)) {
                            await launch(url);
                          }
                        },
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        child: SvgPicture.asset('assets/Images/github.svg',
                            width: 20,
                            placeholderBuilder: (_) => SkeletonAnimation(
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                  ),
                                )),
                        onTap: () async {
                          String url = 'https://github.com/Saviollage';
                          if (await canLaunch(url)) {
                            await launch(url);
                          }
                        },
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    ));
  }
}
