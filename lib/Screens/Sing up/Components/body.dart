import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:maththinkingv2/Controller/authenticationController.dart';

import '../../../Components/RoundedPasswordField.dart';
import '../../../Components/alreadyHaveAnAccountCheck.dart';
import '../../../Components/roundedButton.dart';
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
  final controllerEmail = TextEditingController();
  final controllerFirstName = TextEditingController();
  final controllerLastName = TextEditingController();
  final controllerSchool = TextEditingController();
  final controllerPassword = TextEditingController();
  AuthenticationController authenticationController = Get.find();

  _signup(theEmail, thePassword, scholl, firstName, lastName) async {
    try {
      await authenticationController.signUp(
          theEmail, thePassword, scholl, firstName, lastName);

      Get.snackbar(
        "Sign Up",
        'OK',
        icon: const Icon(Icons.person, color: Colors.red),
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (err) {
      logError('SignUp error $err');
      Get.snackbar(
        "Sign Up",
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
              "SIGN UP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SvgPicture.asset(
              "assets/icons/22.svg",
              height: size.height * 0.47,
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
            RoundedInputField(
              hintText: "Your firstname",
              onChanged: (value) {},
              controller: controllerFirstName,
            ),
            RoundedInputField(
              hintText: "Your lastname",
              onChanged: (value) {},
              controller: controllerLastName,
            ),
            RoundedInputField(
              hintText: "Your school",
              onChanged: (value) {},
              controller: controllerSchool,
            ),
            RoundedButton(
                text: "LOGIN",
                press: () async {
                  _signup(
                      controllerEmail.text,
                      controllerPassword.text,
                      controllerSchool.text,
                      controllerFirstName.text,
                      controllerLastName.text);
                }),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Get.offAllNamed("/login");
              },
            )
          ],
        ),
      ),
    );
  }
}
