import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:maththinkingv2/Controller/authenticationController.dart';
import 'package:maththinkingv2/Controller/exerciseController.dart';
import 'package:maththinkingv2/Controller/userController.dart';
import 'package:maththinkingv2/Domain/use_case/authenticationUseCase.dart';
import 'package:maththinkingv2/Domain/use_case/exerciseUseCase.dart';
import 'package:maththinkingv2/Domain/use_case/userUseCase.dart';
import 'package:maththinkingv2/Screens/Calculator/calculatorScreen.dart';
import 'package:maththinkingv2/Screens/Login/loginscreen.dart';
import 'package:maththinkingv2/Screens/Results/resultsScreen.dart';
import 'package:maththinkingv2/Screens/Sing%20up/signUpScreen.dart';
import 'package:maththinkingv2/Screens/Welcome/welcomeScreen.dart';
import 'package:maththinkingv2/constants.dart';

void main() {
  Loggy.initLoggy(
    logPrinter: const PrettyPrinter(
      showColors: true,
    ),
  );
  Get.put(AuthenticationUseCase());
  Get.put(UserUseCase());
  Get.put(ExerciseUseCase());
  Get.put(UserController());
  Get.put(ExerciseController());
  Get.put(AuthenticationController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Math Thinking',
      theme: ThemeData(
          primaryColor: kPrimaryColor, scaffoldBackgroundColor: Colors.white),
      home: WelcomeScreen(),
      getPages: [
        GetPage(name: "/login", page: () => LoginScreen()),
        GetPage(name: "/welcome", page: () => WelcomeScreen()),
        GetPage(name: "/signUp", page: () => SignUpScreen()),
        GetPage(name: "/calculator", page: () => CalculatorScreen()),
        GetPage(name: "/results", page: () => ResultsScreen())
      ],
    );
  }
}
