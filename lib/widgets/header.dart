import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_wedding/colors.dart';
import 'package:my_wedding/gen/assets.gen.dart';
import 'package:my_wedding/extension.dart';
import 'package:my_wedding/gen/fonts.gen.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bigText = context.isSmallScreen ? 64.0 : 80.0;
    return SizedBox(
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Assets.images.img1.image(),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.white.withOpacity(0.8),
                    Colors.white.withOpacity(0.3),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
          ),
          Positioned(
            child: Padding(
              padding: EdgeInsets.only(bottom: bigText),
              child: Text(
                'Save',
                style: TextStyle(color: AppColors.primaryText, fontSize: bigText),
              ),
            ),
          ),
          Positioned(
            child: Padding(
              padding: EdgeInsets.only(left: context.isSmallScreen ? 50 : 60, top: 20),
              child: Text(
                'the',
                style: TextStyle(
                    color: AppColors.primaryText, fontSize: context.isSmallScreen ? 35 : 40),
              ),
            ),
          ),
          Positioned(
            child: Padding(
              padding: EdgeInsets.only(top: bigText),
              child: Text(
                'Date',
                style: TextStyle(color: AppColors.primaryText, fontSize: bigText),
              ),
            ),
          ),
          Positioned(
            bottom: -30,
            left: 0,
            right: 0,
            child: Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.7),
                gradient: const LinearGradient(
                  colors: [
                    Colors.white,
                    AppColors.mainBackground,
                    Colors.white,
                  ],
                ),
              ),
              padding: const EdgeInsets.only(bottom: 10),
              child: const Center(
                child: Text(
                  '27-05-2023',
                  style: TextStyle(
                    fontFamily: FontFamily.number,
                    fontSize: 40,
                    height: 1,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryText,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -25,
            child: Assets.images.divider3.image(
              height: 25,
              width: 200,
              fit: BoxFit.fill,
              color: AppColors.primaryText,
            ),
          )
        ],
      ),
    );
  }
}
