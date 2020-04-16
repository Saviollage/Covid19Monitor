import 'package:covid_app/app/components/symptomsCard.dart';
import 'package:flutter/material.dart';

class SymptomsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      padding: EdgeInsets.only(bottom: 10),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
           SymptomCard(
            asset: 'assets/Images/sintoma_1.svg',
            title: 'Febre',
            text: '88%',
          ),
          SymptomCard(
            asset: 'assets/Images/transmissao_1.svg',
            title: 'Tosse Seca',
            text: '68%',
          ),
          SymptomCard(
            asset: 'assets/Images/cansaco.svg',
            title: 'Cansaço e Fadiga',
            text: '38%',
          ),
          SymptomCard(
            asset: 'assets/Images/falta_ar.svg',
            title: 'Falta de ar',
            text: '19%',
          ),
          SymptomCard(
            asset: 'assets/Images/dor_1.svg',
            title: 'Dor Articular',
            text: '15%',
          )
        ],
      ),
    );
  }
}
