import 'package:flutter/material.dart';
import 'package:my_wedding/colors.dart';
import 'package:my_wedding/extension.dart';
import 'package:my_wedding/gen/assets.gen.dart';
import 'package:my_wedding/gen/fonts.gen.dart';

class Banking extends StatelessWidget {
  const Banking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = context.isSmallScreen;
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Text(
            'Mừng cưới cô dâu và chú rể',
            style: TextStyle(
              fontFamily: FontFamily.roboto,
              color: AppColors.secondText,
              fontSize: isSmallScreen ? 16 : 20,
            ),
          ),
          const Divider(
            color: AppColors.backgroundShadow,
            indent: 100,
            endIndent: 100,
          ),
          Assets.images.vcb.image(height: 100),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Text(
              'NGUYEN VAN TUYEN\nVCB: 9374841404',
              style: TextStyle(
                fontFamily: FontFamily.roboto,
                fontSize: isSmallScreen ? 16 : 20,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const Divider(
            color: AppColors.backgroundShadow,
            indent: 100,
            endIndent: 100,
          ),
          Assets.images.vcb.image(height: 100),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Text(
              'PHAM THI THUONG\nACB: 225088888',
              style: TextStyle(
                fontFamily: FontFamily.roboto,
                fontSize: isSmallScreen ? 16 : 20,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
