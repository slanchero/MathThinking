import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              "assets/images/signup_top.png",
              width: size.width * 0.4,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              "assets/images/7.png",
              width: size.width * 0.4,
            ),
          ),
          Positioned(
            top: 95,
            right: 0,
            child: Image.asset(
              "assets/images/8.png",
              width: size.width * 0.4,
            ),
          ),
          Positioned(
            top: 15,
            left: 35,
            child: Transform.rotate(
                angle: 0.2,
                child: SvgPicture.asset(
                  "assets/icons/2.svg",
                  height: size.height * 0.2,
                )),
          ),
          Positioned(
            bottom: 200,
            left: -10,
            child: Transform.rotate(
                angle: 0.5,
                child: SvgPicture.asset(
                  "assets/icons/3.svg",
                  height: size.height * 0.2,
                )),
          ),
          Positioned(
            top: 95,
            right: 0,
            child: Transform.rotate(
                angle: -0.5,
                child: SvgPicture.asset(
                  "assets/icons/4.svg",
                  height: size.height * 0.2,
                )),
          ),
          Positioned(
            bottom: 5,
            right: 0,
            child: Transform.rotate(
                angle: -0.5,
                child: SvgPicture.asset(
                  "assets/icons/5.svg",
                  height: size.height * 0.2,
                )),
          ),
          child,
        ],
      ),
    );
  }
}
