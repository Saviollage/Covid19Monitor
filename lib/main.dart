import 'package:covid_app/app/components/imageMainWidget.dart';
import 'package:covid_app/app/controllers/controller.dart';
import 'package:covid_app/app/pages/stayHomePage.dart';
import 'package:covid_app/app/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';

void main() {
  GetIt getIt = GetIt.I;
  getIt.registerSingleton(Controller());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ErrorWidget.builder = (FlutterErrorDetails details) {
      bool inDebug = false;
      assert(() {
        inDebug = true;
        return true;
      }());
      // In debug mode, use the normal error widget which shows
      // the error message:
      if (inDebug) return ErrorWidget(details.exception);
      // In release builds, show a yellow-on-blue message instead:
      return Container(
        alignment: Alignment.center,
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageMainWidget(
                  asset: 'assets/Images/error.svg',
                  width: MediaQuery.of(context).size.width * 0.9),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'OPA...',
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
                  'OCORREU UM ERRO',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: CustomColors.darkRed,
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18),
                child: Text(
                  'Verifique a conexão e tente novamente',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: CustomColors.darkRed,
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      );
    };
    return MaterialApp(
      title: 'COVID 19',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [const Locale('pt', 'BR')],
      theme: ThemeData(
          primaryColor: Colors.white,
          accentColor: CustomColors.pink,
          bannerTheme: MaterialBannerThemeData(backgroundColor: Colors.white)),
      home: StayHomePage(),
    );
  }
}
