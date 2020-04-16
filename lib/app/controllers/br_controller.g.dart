// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'br_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BrController on _BrControllerBase, Store {
  final _$confirmedCasesAtom = Atom(name: '_BrControllerBase.confirmedCases');

  @override
  int get confirmedCases {
    _$confirmedCasesAtom.context.enforceReadPolicy(_$confirmedCasesAtom);
    _$confirmedCasesAtom.reportObserved();
    return super.confirmedCases;
  }

  @override
  set confirmedCases(int value) {
    _$confirmedCasesAtom.context.conditionallyRunInAction(() {
      super.confirmedCases = value;
      _$confirmedCasesAtom.reportChanged();
    }, _$confirmedCasesAtom, name: '${_$confirmedCasesAtom.name}_set');
  }

  final _$deathCasesAtom = Atom(name: '_BrControllerBase.deathCases');

  @override
  int get deathCases {
    _$deathCasesAtom.context.enforceReadPolicy(_$deathCasesAtom);
    _$deathCasesAtom.reportObserved();
    return super.deathCases;
  }

  @override
  set deathCases(int value) {
    _$deathCasesAtom.context.conditionallyRunInAction(() {
      super.deathCases = value;
      _$deathCasesAtom.reportChanged();
    }, _$deathCasesAtom, name: '${_$deathCasesAtom.name}_set');
  }

  final _$itemsAtom = Atom(name: '_BrControllerBase.items');

  @override
  ObservableList<Item> get items {
    _$itemsAtom.context.enforceReadPolicy(_$itemsAtom);
    _$itemsAtom.reportObserved();
    return super.items;
  }

  @override
  set items(ObservableList<Item> value) {
    _$itemsAtom.context.conditionallyRunInAction(() {
      super.items = value;
      _$itemsAtom.reportChanged();
    }, _$itemsAtom, name: '${_$itemsAtom.name}_set');
  }

  final _$dateAtom = Atom(name: '_BrControllerBase.date');

  @override
  String get date {
    _$dateAtom.context.enforceReadPolicy(_$dateAtom);
    _$dateAtom.reportObserved();
    return super.date;
  }

  @override
  set date(String value) {
    _$dateAtom.context.conditionallyRunInAction(() {
      super.date = value;
      _$dateAtom.reportChanged();
    }, _$dateAtom, name: '${_$dateAtom.name}_set');
  }

  final _$getBrasilCasesAsyncAction = AsyncAction('getBrasilCases');

  @override
  Future<void> getBrasilCases() {
    return _$getBrasilCasesAsyncAction.run(() => super.getBrasilCases());
  }

  @override
  String toString() {
    final string =
        'confirmedCases: ${confirmedCases.toString()},deathCases: ${deathCases.toString()},items: ${items.toString()},date: ${date.toString()}';
    return '{$string}';
  }
}
