import 'dart:async';

import 'package:covid_app/app/models/itemModel.dart';
import 'package:covid_app/app/util/api.dart';
import 'package:covid_app/app/util/data.dart';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
part 'br_controller.g.dart';

class BrController = _BrControllerBase with _$BrController;

abstract class _BrControllerBase with Store {
  _BrControllerBase() {
    getBrasilCases();
  }

  @observable
  int confirmedCases = 0;

  @observable
  int deathCases = 0;

  @observable
  ObservableList<Item> items;

  @observable
  String date;

  @action
  Future<void> getBrasilCases() async {
    try {
      confirmedCases = 0;
      deathCases = 0;
      var response =
          await http.get(Api.url + '?is_last=True&place_type=state', headers: {
        "Content-Type": "application/json",
      }).timeout((Api.timeout), onTimeout: () {
        return http.Response(
            json.encode({'error': "Servidor demorou para responder"}), 400);
      }).catchError((e) {
        return http.Response(json.encode({'error': e.toString()}), 400);
      });

      if (response == null) throw http.ClientException("Erro de rede");

      if (response.statusCode == 200) {
        List data = json.decode(response.body)["results"];
        items =
            List<Item>.from(data.map((e) => Item.fromJson(e))).asObservable();
        items.sort(
            (a, b) => Data.states[a.state].compareTo(Data.states[b.state]));

        int c = 0;
        int d = 0;
        date = data[0]['date'];
        for (int i = 0; i < items.length; i++) {
          c += items[i].confirmed;
          d += items[i].deaths;
        }
        confirmedCases = c;
        deathCases = d;

        
      }
    } on SocketException {
      print('Error');
    } on PlatformException {
      print('Error');
    } on Exception catch (e) {
      print('Error ' + e.toString());
    }
  }
}
