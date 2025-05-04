import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_imx/observables/modelo_observado/modelo_observado_controller.dart';

class ModeloObservadoPage extends StatefulWidget {

  const ModeloObservadoPage({ super.key });

  @override
  State<ModeloObservadoPage> createState() => _ModeloObservadoPageState();
}

class _ModeloObservadoPageState extends State<ModeloObservadoPage> {

  final controller = ModeloObservadoController();

   @override
   Widget build(BuildContext context) {
       return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: const Text(
              'Modelo Observado',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
           body: Column(
            children: [
              Expanded(
                child: Observer(
                  builder: (_) {
                    print('------------------------lista-------------------------');
                    return ListView.builder(
                      itemCount: controller.products.length,
                      itemBuilder: (context, index) {
                        final productStore = controller.products[index];
                        return Observer(
                          builder: (_) {
                            print('------------------------item interno-------------------------${productStore.product.name}');
                            return CheckboxListTile(
                              value: productStore.selected,
                              activeColor: Colors.blue,
                              onChanged: (_){
                              controller.selectedProduct(index);
                              },
                              title: Text(productStore.product.name),
                            );
                          }
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
                  }, child: const Text('Adicionar')),
                  TextButton(onPressed: (){
                    controller.removeProduct();
                  }, child: const Text('Remover')),
                  TextButton(onPressed: (){
                    controller.loadProducts();
                  }, child: const Text('Carregar')),
                ],
              ),
            ],
           ),
       );
  }
}