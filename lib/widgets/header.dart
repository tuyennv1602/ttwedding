import 'package:flutter/material.dart';
import 'package:my_wedding/colors.dart';
import 'package:my_wedding/gen/assets.gen.dart';
import 'package:my_wedding/extension.dart';
import 'package:my_wedding/gen/fonts.gen.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = context.isSmallScreen;
    final bigText = isSmallScreen ? 64.0 : 80.0;
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
                style:
                    TextStyle(color: AppColors.primaryText, fontSize: bigText),
              ),
            ),
          ),
          Positioned(
            child: Padding(
              padding: EdgeInsets.only(left: isSmallScreen ? 50 : 60, top: 20),
              child: Text(
                'the',
                style: TextStyle(
                    color: AppColors.primaryText,
                    fontSize: isSmallScreen ? 35 : 40),
              ),
            ),
          ),
          Positioned(
            child: Padding(
              padding: EdgeInsets.only(top: bigText),
              child: Text(
                'Date',
                style:
                    TextStyle(color: AppColors.primaryText, fontSize: bigText),
              ),
            ),
          ),
          Positioned(
            child: Padding(
              padding: EdgeInsets.only(
                top: bigText * 2,
                left: isSmallScreen ? 50 : 60,
              ),
              child: Text(
                '27-05-2023',
                style: TextStyle(
                  color: AppColors.primaryText,
                  fontSize: isSmallScreen ? 14 : 18,
                  fontFamily: FontFamily.roboto,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -13,
            left: 0,
            right: 0,
            child: Assets.images.divider3.image(
              height: 26,
              width: double.infinity,
              fit: BoxFit.fitWidth,
              color: AppColors.primary.withOpacity(0.5),
            ),
          )
        ],
      ),
    );
  }
}
