// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StateController on _StateControllerBase, Store {
  Computed<int> _$listFilteredSizeComputed;

  @override
  int get listFilteredSize => (_$listFilteredSizeComputed ??=
          Computed<int>(() => super.listFilteredSize))
      .value;
  Computed<Boletim> _$boletimComputed;

  @override
  Boletim get boletim =>
      (_$boletimComputed ??= Computed<Boletim>(() => super.boletim)).value;
  Computed<List<Item>> _$listFilteredComputed;

  @override
  List<Item> get listFiltered => (_$listFilteredComputed ??=
          Computed<List<Item>>(() => super.listFiltered))
      .value;

  final _$citiesAtom = Atom(name: '_StateControllerBase.cities');

  @override
  ObservableList<Item> get cities {
    _$citiesAtom.context.enforceReadPolicy(_$citiesAtom);
    _$citiesAtom.reportObserved();
    return super.cities;
  }

  @override
  set cities(ObservableList<Item> value) {
    _$citiesAtom.context.conditionallyRunInAction(() {
      super.cities = value;
      _$citiesAtom.reportChanged();
    }, _$citiesAtom, name: '${_$citiesAtom.name}_set');
  }

  final _$boletinsAtom = Atom(name: '_StateControllerBase.boletins');

  @override
  ObservableList<Boletim> get boletins {
    _$boletinsAtom.context.enforceReadPolicy(_$boletinsAtom);
    _$boletinsAtom.reportObserved();
    return super.boletins;
  }

  @override
  set boletins(ObservableList<Boletim> value) {
    _$boletinsAtom.context.conditionallyRunInAction(() {
      super.boletins = value;
      _$boletinsAtom.reportChanged();
    }, _$boletinsAtom, name: '${_$boletinsAtom.name}_set');
  }

  final _$searchTextAtom = Atom(name: '_StateControllerBase.searchText');

  @override
  String get searchText {
    _$searchTextAtom.context.enforceReadPolicy(_$searchTextAtom);
    _$searchTextAtom.reportObserved();
    return super.searchText;
  }

  @override
  set searchText(String value) {
    _$searchTextAtom.context.conditionallyRunInAction(() {
      super.searchText = value;
      _$searchTextAtom.reportChanged();
    }, _$searchTextAtom, name: '${_$searchTextAtom.name}_set');
  }

  final _$getCitiesAsyncAction = AsyncAction('getCities');

  @override
  Future<void> getCities() {
    return _$getCitiesAsyncAction.run(() => super.getCities());
  }

  final _$getBoletimAsyncAction = AsyncAction('getBoletim');

  @override
  Future<void> getBoletim() {
    return _$getBoletimAsyncAction.run(() => super.getBoletim());
  }

  final _$_StateControllerBaseActionController =
      ActionController(name: '_StateControllerBase');

  @override
  void setText(String value) {
    final _$actionInfo = _$_StateControllerBaseActionController.startAction();
    try {
      return super.setText(value);
    } finally {
      _$_StateControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'cities: ${cities.toString()},boletins: ${boletins.toString()},searchText: ${searchText.toString()},listFilteredSize: ${listFilteredSize.toString()},boletim: ${boletim.toString()},listFiltered: ${listFiltered.toString()}';
    return '{$string}';
  }
}
