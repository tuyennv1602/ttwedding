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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.isSmallScreen ? 20 : 80),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Lottie.asset(
            Assets.images.circleFlower,
            fit: BoxFit.contain,
            controller: controller,
          ),
          Positioned(
            child: Text(
              'T❦T',
              style: TextStyle(
                fontSize: context.isSmallScreen ? 50 : 60,
                color: AppColors.primaryText,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        ],
      ),
    );
  }
}
