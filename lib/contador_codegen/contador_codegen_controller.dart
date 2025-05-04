import 'package:mobx/mobx.dart';
import 'package:mobx_imx/model/full_name.dart';

part 'contador_codegen_controller.g.dart';

class ContadorCodeGenController = _ContadorCodeGenControllerBase with _$ContadorCodeGenController;

abstract class _ContadorCodeGenControllerBase with Store {

  @observable
  var counter = 0;

  @observable
  var fullName = FullName(first: 'first', last: 'last');

  @computed
  String get saudacao => 'Olá ${fullName.first} $counter';

  @action
  void increment() {
    counter++;
  }

  @action
  void changeName() {
    fullName = fullName.copyWith(first: 'Gustavo', last: 'Dias');
  }
  @action
  void rollbackName() {
    fullName = fullName.copyWith(first: 'first', last: 'last');
  }

}