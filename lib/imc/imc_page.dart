import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_imx/imc/imc_controller.dart';
import 'package:mobx_imx/widgets/imc_gauge.dart';

class ImcPage extends StatefulWidget {

  const ImcPage({ Key? key }) : super(key: key);

  @override
  State<ImcPage> createState() => _ImcPageState();
}

class _ImcPageState extends State<ImcPage> {

  final controller = ImcController();
  final pesoEC = TextEditingController();
  final alturaEC = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final reactionDisposer = <ReactionDisposer>[];

  @override
  void initState() {
    super.initState();
    final reactionErrorDisposer = reaction<bool>((_) => controller.hasError, (hasError) {
      if(hasError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red[400],
            content: Text(
              controller.error ?? 'ERRO GRAVE!!!',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            ),
          )
        );
      }
    });
    reactionDisposer.add(reactionErrorDisposer);
  }

  @override
  void dispose() {
    super.dispose();
    reactionDisposer.forEach((reactionDisposer) => reactionDisposer());
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: const Color.fromARGB(255, 161, 196, 252),
        appBar: AppBar(
          backgroundColor: Colors.blueAccent[200],
          title: const Text(
            'Imc MobX',
            style: TextStyle(
              color: Colors.white
            ),
          ),
        ),
              body: SingleChildScrollView(
                child: Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Observer(
                        builder: (_) {
                          return ImcGauge(imc: controller.imc);
                        },
                      ),
                      SizedBox(height: 20,),
                      TextFormField(
                        controller: pesoEC,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Peso',
                          constraints: BoxConstraints(maxWidth: 300),
                          labelStyle: TextStyle(
                            color: Colors.white
                          ),
                        ),
                        inputFormatters: [
                          CurrencyTextInputFormatter.currency(
                            locale: 'pt_BR',
                            symbol: '',
                            decimalDigits: 2,
                            turnOffGrouping: true,
                          ),
                        ],
                        validator: (String? value){
                          if(value == null || value.isEmpty){
                            return 'Peso Obrigatório';
                          }
                        },
                      ),
                      SizedBox(height: 20,),
                      TextFormField(
                        controller: alturaEC,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Altura',
                          constraints: BoxConstraints(maxWidth: 300),
                          labelStyle: TextStyle(color: Colors.white),
                        ),
                        inputFormatters: [
                          CurrencyTextInputFormatter.currency(
                            locale: 'pt_BR',
                            symbol: '',
                            turnOffGrouping: true,
                            decimalDigits: 2,
                          ),
                        ],
                        validator: (String? value){
                          if(value == null || value.isEmpty){
                            return 'Altura Obrigatória';
                          }
                        },
                      ),
                      SizedBox(height: 20,),
                      ElevatedButton(
                        onPressed: (){
                          var formValid = formKey.currentState?.validate() ?? false;
                          if(formValid) {
                            var formatter = NumberFormat.simpleCurrency(
                              locale: 'pt_BR', 
                              decimalDigits: 2
                            );
                            double peso = formatter.parse(pesoEC.text) as double;
                            double altura = formatter.parse(alturaEC.text) as double;
                            controller.calcularImc(peso: peso, altura: altura);
                          }
                        },
                        child: Text('Calcular IMC'),
                      ),
                    ],
                  ),
                ),
                                ),
              ),
       );
  }
}