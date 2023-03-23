import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_wedding/colors.dart';
import 'package:my_wedding/extension.dart';
import 'package:my_wedding/gen/assets.gen.dart';

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
          Text(
            'T❦T ',
            style: TextStyle(
              fontSize: isSmallScreen ? 50 : 60,
              color: AppColors.primaryText,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
