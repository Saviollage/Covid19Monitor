import 'package:covid_app/app/components/stateCard.dart';
import 'package:covid_app/app/models/itemModel.dart';
import 'package:flutter/material.dart';

class StateList extends StatelessWidget {
  final List<Item> states;

  const StateList({Key key, this.states}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      padding: EdgeInsets.only(bottom: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: states.length,
        itemBuilder: (context, index) => StateCard(state: states[index]),
      ),
    );
  }
}
