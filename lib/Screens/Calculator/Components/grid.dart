import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maththinkingv2/Components/circularButton.dart';
import 'package:maththinkingv2/Controller/exerciseController.dart';
import 'package:maththinkingv2/constants.dart';

class Grid extends StatelessWidget {
  final ExerciseController exerciseController;

  const Grid({super.key, required this.exerciseController});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularButton(
                text: "7", onPressed: () => exerciseController.addAnsw("7")),
            CircularButton(
                text: "8", onPressed: () => exerciseController.addAnsw("8")),
            CircularButton(
                text: "9", onPressed: () => exerciseController.addAnsw("9")),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularButton(
                text: "4", onPressed: () => exerciseController.addAnsw("4")),
            CircularButton(
                text: "5", onPressed: () => exerciseController.addAnsw("5")),
            CircularButton(
                text: "6", onPressed: () => exerciseController.addAnsw("6")),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularButton(
                text: "1", onPressed: () => exerciseController.addAnsw("1")),
            CircularButton(
                text: "2", onPressed: () => exerciseController.addAnsw("2")),
            CircularButton(
                text: "3", onPressed: () => exerciseController.addAnsw("3")),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularButton(
              text: "C",
              onPressed: () => exerciseController.reset(),
              bgColor: kPrimaryColor,
              color: Colors.black,
            ),
            CircularButton(
              text: "0",
              onPressed: () => exerciseController.addAnsw("0"),
            ),
            CircularButton(
              text: "",
              onPressed: () => exerciseController.finishOne(),
              bgColor: kPrimaryColor,
              color: Colors.black,
              icon: Icon(Icons.check, size: 50),
            ),
          ],
        )
      ],
    );
  }
}
