import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maththinkingv2/Controller/exerciseController.dart';

class Screen extends StatelessWidget {
  const Screen({
    super.key,
    this.blur = true,
    required this.exerciseController,
  });

  final bool blur;
  final ExerciseController exerciseController;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Obx(
      () => Center(
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(15.0),
          width: size.width * 0.9,
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(29),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(29),
            child: blur
                ? BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(100, 242, 198,
                            194), // Asegúrate de que el color sea transparente
                      ),
                      child: Text(
                        exerciseController.exercise,
                        style: TextStyle(fontSize: 40),
                      ),
                    ),
                  )
                : Container(
                    alignment: Alignment.center,
                    child: Text(
                      exerciseController.answ,
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
