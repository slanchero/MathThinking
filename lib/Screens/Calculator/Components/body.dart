import 'package:flutter/material.dart';
import 'package:maththinkingv2/Controller/exerciseController.dart';
import 'grid.dart';

import 'background.dart';
import 'screen.dart';

class Body extends StatelessWidget {
  final ExerciseController exerciseController;

  const Body({super.key, required this.exerciseController});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
        child: Container(
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Screen(
            exerciseController: exerciseController,
          ),
          SizedBox(
            height: 10,
          ),
          Screen(
            exerciseController: exerciseController,
            blur: false,
          ),
          Grid(
            exerciseController: exerciseController,
          )
        ],
      ),
    ));
  }
}
