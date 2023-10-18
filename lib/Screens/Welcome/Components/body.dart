import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:maththinkingv2/Controller/authenticationController.dart';

import '../../../Components/roundedButton.dart';
import 'background.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    AuthenticationController authenticationController = Get.find();
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/icons/board.svg",
            height: size.height * 0.45,
          ),
          RoundedButton(
            text: "BIENVENIDO",
            press: () {
              authenticationController.isLogged
                  ? Get.toNamed("/calculator")
                  : Get.toNamed("/login");
            },
          ),
        ],
      ),
    );
  }
}
