import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_imx/contador/contador_controler.dart';

class ContadorPage extends StatelessWidget {

  final controller = ContadorControler();

  ContadorPage({ super.key });

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