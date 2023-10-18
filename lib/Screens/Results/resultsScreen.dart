import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Components/body.dart';

class ResultsScreen extends StatelessWidget {
  final int respuestasBuenas =
      int.tryParse(Get.parameters["buenas"] ?? "") ?? 0;
  final int respuestasMalas = int.tryParse(Get.parameters["malas"] ?? "") ?? 0;
  final double tiempoTardado =
      double.tryParse(Get.parameters["tiempo"] ?? "") ?? 0;
  final int nivelAnterior = int.tryParse(Get.parameters["nan"] ?? "") ?? 0;
  final int nivelActual = int.tryParse(Get.parameters["nac"] ?? "") ?? 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(
          nivelActual: nivelActual,
          nivelAnterior: nivelAnterior,
          respuestasBuenas: respuestasBuenas,
          respuestasMalas: respuestasMalas,
          tiempoTardado: tiempoTardado),
    );
  }
}
