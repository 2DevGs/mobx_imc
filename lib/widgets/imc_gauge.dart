
import 'package:flutter/material.dart';
import 'package:mobx_imx/widgets/imc_gauge_range.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ImcGauge extends StatelessWidget {

  final double imc;

  const ImcGauge({ super.key, required this.imc});

   @override
   Widget build(BuildContext context) {
       return SfRadialGauge(
              enableLoadingAnimation: true,
                          axes: [
                            RadialAxis(
                              showLabels: false,
                              showAxisLine: false,
                              showTicks: false,
                              minimum: 12.5,
                              maximum: 47.9,
                              ranges: [
                                ImcGaugeRange(
                                  color: Colors.blue,
                                  start: 12.5,
                                  end: 18.5,
                                  label: 'MAGREZA',
                                ),
                                ImcGaugeRange(
                                  color: Colors.green,
                                  start: 18.5,
                                  end: 24.5,
                                  label: 'NORMAL',
                                ),
                                ImcGaugeRange(
                                  color: Colors.yellow[600]!, 
                                  start: 24.5, 
                                  end: 29.9, 
                                  label: 'SOBREPESO',
                                ),
                                ImcGaugeRange(
                                  color: Colors.red[500]!, 
                                  start: 29.9, 
                                  end: 39.9, 
                                  label: 'OBESIDADE',
                                ),
                                ImcGaugeRange(
                                  color: Colors.red[900]!, 
                                  start: 39.9, 
                                  end: 47.9,
                                  label: 'OBESIDADEGRAVE',
                                ),
                              ],
                              pointers: [
                                NeedlePointer(
                                  value: imc,
                                  enableAnimation: true,
                                ),
                              ],
                              annotations: <GaugeAnnotation>[
                                GaugeAnnotation(widget: Container(
                                  child: Text(
                                    'Imc Calculator',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                angle: 90, 
                                positionFactor: 0.5,
                                ),
                              ],
                            ),
                          ],
      );
  }
}