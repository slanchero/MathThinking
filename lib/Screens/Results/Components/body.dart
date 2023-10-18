import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:maththinkingv2/Components/roundedButton.dart';

import '../../Login/Components/background.dart';

class Body extends StatelessWidget {
  final int respuestasBuenas;
  final int respuestasMalas;
  final double tiempoTardado;
  final int nivelAnterior;
  final int nivelActual;

  const Body(
      {super.key,
      required this.respuestasBuenas,
      required this.respuestasMalas,
      required this.tiempoTardado,
      required this.nivelAnterior,
      required this.nivelActual});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "REsultados".toUpperCase(),
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
          ),
          SvgPicture.asset(
            "assets/icons/1.svg",
            height: size.height * 0.45,
          ),
          Text(
            "Ejercicios Realizados:  6",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Respuestas Buenas:  $respuestasBuenas  ",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              Icon(
                Icons.check,
                color: Colors.lightGreen,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Respuestas Malas:  $respuestasMalas  ",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              Icon(
                Icons.clear,
                color: Colors.redAccent,
              )
            ],
          ),
          Text(
            "Tiempo Tardado: $tiempoTardado segundos",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          Text(
            "Nivel Anterior: Nivel $nivelAnterior",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          Text(
            "Nivel Actual: Nivel $nivelActual",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          RoundedButton(
              text: "Volver",
              press: () {
                Get.offNamed("/calculator");
              })
        ],
      ),
    );
  }
}
