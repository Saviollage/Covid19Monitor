import 'package:covid_app/app/controllers/br_controller.dart';
import 'package:mobx/mobx.dart';
part 'controller.g.dart';

class Controller = _ControllerBase with _$Controller;

abstract class _ControllerBase with Store {
  BrController brController = BrController();
}
