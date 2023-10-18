import 'package:flutter/material.dart';
import 'package:maththinkingv2/Components/textFieldContainer.dart';

import '../constants.dart';

class RoundedInputField extends StatelessWidget {
  const RoundedInputField({
    super.key,
    required this.hintText,
    required this.onChanged,
    this.icon = Icons.person,
    required this.controller,
  });
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
            icon: Icon(
              icon,
              color: kPrimaryColor,
            ),
            hintText: hintText,
            border: InputBorder.none),
      ),
    );
  }
}
