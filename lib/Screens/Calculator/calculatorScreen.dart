import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:maththinkingv2/Controller/authenticationController.dart';
import 'package:maththinkingv2/Controller/exerciseController.dart';
import 'package:maththinkingv2/constants.dart';

import 'Components/body.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  ExerciseController exerciseController = Get.find();

  AuthenticationController authenticationController = Get.find();
  _logout() async {
    try {
      await authenticationController.logOut();
      Get.offAllNamed("/welcome");
    } catch (e) {
      logInfo(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Column(
          children: [
            Text(
              "Nivel de Dificultad".toUpperCase(),
              style: Theme.of(context)
                  .textTheme
                  .caption!
                  .copyWith(color: Colors.black),
            ),
            Text(
              "${exerciseController.nivelActual}",
              style: TextStyle(color: kPrimaryColor),
            )
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {
                _logout();
              },
              icon: Icon(
                Icons.logout,
                color: kPrimaryLightColor,
              ))
        ],
      ),
      body: Body(
        exerciseController: exerciseController,
      ),
    );
  }
}
