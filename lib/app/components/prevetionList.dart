import 'package:covid_app/app/components/prevetionCard.dart';
import 'package:flutter/material.dart';

class PrevetionsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      padding: EdgeInsets.only(bottom: 20),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          PrevetionCard(
            asset: 'assets/Images/lavando.svg',
            title: 'Lavar as mãos',
            text: 'Lavar as mãos frequentemente por 20 segundos com água e sabão ou higienizá-las com álcool em gel.',
          ),
          PrevetionCard(
            asset: 'assets/Images/mascara.svg',
            title: 'Use máscara',
            text: 'Usar máscara e cobrir o nariz e a boca com um lenço ou o cotovelo ao tossir e espirrar.',
          ),
          PrevetionCard(
            asset: 'assets/Images/contato.svg',
            title: 'Evitar contato próximo',
            text: 'Ficar distante das pessoas que não estejam bem. Evitar contatos físicos, como abraços, beijos e apertos de mão.',
          ),
          PrevetionCard(
            asset: 'assets/Images/house.svg',
            title: 'Ficar em casa',
            text: 'Ficar em casa para evitar contato com outras pessoas e se isolar das outras pessoas que moram com você caso apresente os sintomas da doença.',
          ),
        ],
      ),
    );
  }
}
