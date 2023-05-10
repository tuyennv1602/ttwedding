import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_wedding/colors.dart';
import 'package:my_wedding/extension.dart';
import 'package:my_wedding/gen/assets.gen.dart';
import 'package:my_wedding/widgets/tt.dart';

class TheName extends StatelessWidget {
  final AnimationController controller;
  const TheName({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = context.isSmallScreen;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isSmallScreen ? 20 : 80),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Lottie.asset(
            Assets.images.circleFlower,
            fit: BoxFit.contain,
            controller: controller,
          ),
          Transform.translate(
            offset: const Offset(-10, -10),
            child: Transform.scale(
              scale: 0.7,
              child: const TT(),
            ),
          )
        ],
      ),
    );
  }
}
