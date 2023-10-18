import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:maththinkingv2/Components/roundedButton.dart';
import 'package:maththinkingv2/Controller/authenticationController.dart';

import '../../../Components/RoundedPasswordField.dart';
import '../../../Components/alreadyHaveAnAccountCheck.dart';
import '../../../Components/roundedInputField.dart';
import 'background.dart';

class Body extends StatefulWidget {
  const Body({
    super.key,
  });

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  AuthenticationController authenticationController = Get.find();
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();

  _login(String email, String password) async {
    logInfo('_login $email $password');
    try {
      await authenticationController.login(email, password);
      Get.snackbar("Login", "OK");
      Get.offAllNamed("/calculator");
    } catch (err) {
      Get.snackbar(
        "Login",
        err.toString(),
        icon: const Icon(Icons.person, color: Colors.red),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Login",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/1.svg",
              height: size.height * 0.45,
            ),
            RoundedInputField(
              hintText: "Your email",
              onChanged: (value) {},
              controller: controllerEmail,
            ),
            RoundedPasswordField(
              onChange: (value) {},
              controller: controllerPassword,
            ),
            RoundedButton(
                text: "LOGIN",
                press: () async {
                  await _login(controllerEmail.text, controllerPassword.text);
                }),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Get.toNamed("/signUp");
              },
            )
          ],
        ),
      ),
    );
  }
}
