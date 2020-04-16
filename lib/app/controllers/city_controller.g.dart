// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CityController on _CityControllerBase, Store {
  final _$casesAtom = Atom(name: '_CityControllerBase.cases');

  @override
  ObservableList<Item> get cases {
    _$casesAtom.context.enforceReadPolicy(_$casesAtom);
    _$casesAtom.reportObserved();
    return super.cases;
  }

  @override
  set cases(ObservableList<Item> value) {
    _$casesAtom.context.conditionallyRunInAction(() {
      super.cases = value;
      _$casesAtom.reportChanged();
    }, _$casesAtom, name: '${_$casesAtom.name}_set');
  }

  final _$getCityDataAsyncAction = AsyncAction('getCityData');

  @override
  Future<void> getCityData() {
    return _$getCityDataAsyncAction.run(() => super.getCityData());
  }

  @override
  String toString() {
    final string = 'cases: ${cases.toString()}';
    return '{$string}';
  }
}
