import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_imx/contador_codegen/contador_codegen_controller.dart';

class ContadorCodeGenPage extends StatefulWidget {


  const ContadorCodeGenPage({ super.key });

  @override
  State<ContadorCodeGenPage> createState() => _ContadorCodeGenPageState();
}

class _ContadorCodeGenPageState extends State<ContadorCodeGenPage> {
  final controller = ContadorCodeGenController();
  final reationDisposer = <ReactionDisposer>[];

  @override
  void initState() {
    super.initState();
    // autorun fica escutando as variáveis que estão sendo usada dentro dele
    // e também roda logo quando criado!!!
    final autorunDisposer = autorun((_) {
      print('------------------- auto run ---------------');
      print(controller.fullName.first);
    });

    // reaction nós falamos para o mobx qual o atributo observavel que queremos observar!!!!
    final reactionDisposer = reaction((_) => controller.counter, (counter) {
      print('--------------------reation-------------------');
      print(counter);
    });

    final whenDisposer = when((_) => controller.fullName.first == 'Gustavo', () {
      print('--------------------when-------------------');
      print(controller.fullName.first);
    }); 

    reationDisposer.add(autorunDisposer);
    reationDisposer.add(reactionDisposer);
  }

  @override
  void dispose() {
    super.dispose();
    reationDisposer.forEach((reaction) => reaction());
  }

   @override
   Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Contador MobX'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Observer(
              builder: (_) {
                return Text(
                  '${controller.counter}',
                  style: Theme.of(context).textTheme.headlineLarge,
                );
              }
            ),
            Observer(
              builder: (_) {
                return Text(controller.fullName.first);
              }
            ),
            Observer(
              builder: (_) {
                return Text(controller.fullName.last);
              }
            ),
            Observer(
              builder: (_) {
                return Text(controller.saudacao);
              }
            ),
            TextButton(onPressed: () => controller.changeName(), 
              child: const Text('Change Name'),
            ),
            TextButton(onPressed: () => controller.rollbackName(), 
              child: const Text('RollBack Name'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.increment(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), 
    );
  }
}