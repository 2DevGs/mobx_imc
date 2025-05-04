import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_imx/observables/list/observable_list_controller.dart';

class ObservableListPage extends StatefulWidget {

  const ObservableListPage({ super.key });

  @override
  State<ObservableListPage> createState() => _ObservableListPageState();
}

class _ObservableListPageState extends State<ObservableListPage> {

  final controller = ObservableListController();

  @override
  Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: const Text(
              'Observable List',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
           body: Column(
            children: [
              Expanded(
                child: Observer(
                  builder: (_) {
                    return ListView.builder(
                      itemCount: controller.products.length,
                      itemBuilder: (context, index) {
                        final productName = controller.products[index].name;
                        return CheckboxListTile(
                          value: false, 
                          onChanged: (_){},
                          title: Text(productName),
                        );
                      },
                    );
                  },
                )
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(onPressed: (){
                    controller.addProduct();
                  }, child: Text('Adicionar')),
                  TextButton(onPressed: (){
                    controller.removeProduct();
                  }, child: Text('Remover')),
                  TextButton(onPressed: (){
                    controller.loadProducts();
                  }, child: Text('Carregar')),
                ],
              ),
            ],
           ),
       );
  }
}