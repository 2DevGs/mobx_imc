import 'package:mobx/mobx.dart';
import 'package:mobx_imx/model/full_name.dart';

class ContadorControler {
  final _counter = Observable<int>(0, name: 'Counter Observable');
  final _fullName =
      Observable<FullName>(FullName(first: 'first', last: 'last'));

  late Action increment;
  late Computed _saudacaoComputed;


  ContadorControler() {
    increment = Action(_incrementCounter);
    _saudacaoComputed = Computed(() => 'Olá ${_fullName.value.first} ${_counter.value}');
  }

  int get counter => _counter.value;
  FullName get fullName => _fullName.value;

  String get saudacao => _saudacaoComputed.value;

  void _incrementCounter() {
    _counter.value++;


    print('Antes');
    print(_fullName.value.hashCode);
    //Não pode fazer isso!!!!!!
    // _fullName.value.first = 'Gustavo';
    // _fullName.value.last = 'Dias';
    // ESTA É A FORMA CERTA!!!!!!!!!!!!!!!!
    //Mas podemos trocar isso

    //Opção 1 alterar por meio de prototype (Copywith)
    // _fullName.value = FullName(first: 'Gustavo', last: 'Dias');
    //Por isso:
    _fullName.value = _fullName.value.copyWith(first: 'Gustavo', last: 'Dias');

    // Com alteração do hashCode e o ==(equals)
    var fullName = _fullName.value;
    // _fullName.value = fullName;
    fullName.first = 'Gustavo';
    fullName.last = 'Dias';
    print('Depois');
    print(_fullName.value.hashCode);
  }
}