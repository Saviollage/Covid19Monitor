import 'dart:async';

import 'package:covid_app/app/models/itemModel.dart';
import 'package:covid_app/app/util/api.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
part 'city_controller.g.dart';

class CityController = _CityControllerBase with _$CityController;

abstract class _CityControllerBase with Store {
  _CityControllerBase({@required this.city, @required this.state}) {
    getCityData();
  }

  final String city;
  final String state;

  @observable
  ObservableList<Item> cases;

  @action
  Future<void> getCityData() async {
    try {
      var response = await http
          .get(Api.url + '?state=' + state + '&city=' + city, headers: {
        "Content-Type": "application/json",
      }).timeout((Api.timeout), onTimeout: () {
        return http.Response(
            json.encode({'error': "Servidor demorou para responder"}), 400);
      }).catchError((e) {
        return http.Response(json.encode({'error': e.toString()}), 400);
      });

      if (response == null) throw http.ClientException("Erro de rede");

      if (response.statusCode == 200) {
        List data = json.decode(utf8.decode(response.bodyBytes))["results"];
        cases =
            List<Item>.from(data.map((e) => Item.fromJson(e))).asObservable();
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
