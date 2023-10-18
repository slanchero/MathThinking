import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  final Color bgColor;
  final Color color;
  final String text;
  final Function onPressed;
  final Icon? icon;

  const CircularButton(
      {Key? key,
      bgColor,
      color,
      required this.text,
      required this.onPressed,
      this.icon})
      : this.bgColor = bgColor ?? const Color(0xff333333),
        this.color = color ?? Colors.white,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final buttonStyle = TextButton.styleFrom(
      backgroundColor: this.bgColor,
      primary: color,
      shape: StadiumBorder(),
    );
    return Container(
      margin: EdgeInsets.only(bottom: 10, right: 5, left: 5),
      child: TextButton(
        style: buttonStyle,
        child: Container(
          width: 65,
          height: 65,
          child: Center(
            child: icon ??
                Text(
                  text,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
                ),
          ),
        ),
        onPressed: () => this.onPressed(),
      ),
    );
  }
}
