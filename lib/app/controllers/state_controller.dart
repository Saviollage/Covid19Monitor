import 'dart:async';

import 'package:covid_app/app/models/boletimModel.dart';
import 'package:covid_app/app/models/itemModel.dart';
import 'package:covid_app/app/util/api.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
part 'state_controller.g.dart';

class StateController = _StateControllerBase with _$StateController;

abstract class _StateControllerBase with Store {
  _StateControllerBase({@required this.state}) {
    getCities();
    getBoletim();
  }

  final String state;

  @observable
  ObservableList<Item> cities;

  @observable
  ObservableList<Boletim> boletins;

  @observable
  String searchText = "";

  @action
  Future<void> getCities() async {
    searchText = "";
    try {
      var response =
          await http.get(Api.url + '?is_last=True&state=' + state, headers: {
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
        cities =
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

  @action
  Future<void> getBoletim() async {
    searchText = "";
    try {
      var response =
          await http.get(Api.boletimUrl + '?state=' + state, headers: {
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
        boletins = List<Boletim>.from(data.map((e) => Boletim.fromJson(e)))
            .asObservable();
      }
    } on SocketException {
      print('Error');
    } on PlatformException {
      print('Error');
    } on Exception catch (e) {
      print('Error ' + e.toString());
    }
  }

  @action
  void setText(String value) {
    searchText = value;
  }

  @computed
  int get listFilteredSize => listFiltered.length;

  @computed
  Boletim get boletim => boletins[0];

  @computed
  List<Item> get listFiltered {
    if (searchText.isEmpty)
      return cities.where((element) => element.city != null).toList();
    else
      return cities
          .where((city) =>
              city.city
                  .toString()
                  .toLowerCase()
                  .contains(searchText.toLowerCase()) &&
              city.city != null)
          .toList();
  }
}
