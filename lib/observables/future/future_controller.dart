import 'package:mobx/mobx.dart';
part 'future_controller.g.dart';

class FutureController = _FutureControllerBase with _$FutureController;

abstract class _FutureControllerBase with Store {

  @observable
  var nomeFuture = ObservableFuture.value('');
  // var nomeFuture = Future.value('').asObservable();
  
  Future<void> buscarNome() async {
    final buscaNomeFuture =  Future.delayed(const Duration(seconds: 2), () => 'Gustavo Dias')
        .asObservable();

    nomeFuture = ObservableFuture(buscaNomeFuture);
    // nomeFuture = buscaNomeFuture.asObservable();

  }

}