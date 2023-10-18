import 'package:flutter/material.dart';
import 'package:maththinkingv2/Components/textFieldContainer.dart';

import '../constants.dart';

class RoundedPasswordField extends StatelessWidget {
  const RoundedPasswordField({
    super.key,
    required this.onChange,
    required this.controller,
  });
  final ValueChanged<String> onChange;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        child: TextField(
      controller: controller,
      obscureText: true,
      decoration: InputDecoration(
        hintText: "Password",
        icon: Icon(
          Icons.lock,
          color: kPrimaryColor,
        ),
        suffixIcon: Icon(
          Icons.visibility,
          color: kPrimaryColor,
        ),
        border: InputBorder.none,
      ),
    ));
  }
}
