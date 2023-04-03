import 'package:flutter/material.dart';
import 'package:my_wedding/colors.dart';
import 'package:my_wedding/extension.dart';
import 'package:my_wedding/gen/assets.gen.dart';
import 'package:my_wedding/gen/fonts.gen.dart';

class Banking extends StatelessWidget {
  final double width;
  const Banking({
    Key? key,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = context.isSmallScreen;
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Text(
            'Mừng cưới cô dâu và chú rể',
            style: TextStyle(
              fontFamily: FontFamily.openSans,
              color: AppColors.secondText,
              fontSize: isSmallScreen ? 16 : 20,
            ),
          ),
          const Divider(
            color: AppColors.backgroundShadow,
            indent: 100,
            endIndent: 100,
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Assets.images.vcb.image(
                      width: context.isSmallScreen ? width / 3 : width / 4,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Text(
                        'NGUYEN VAN TUYEN\nVCB: 9374841404',
                        style: TextStyle(
                          fontFamily: FontFamily.openSans,
                          fontSize: isSmallScreen ? 15 : 20,
                          height: 1.3,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Assets.images.acb.image(
                      width: context.isSmallScreen ? width / 3 : width / 4,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Text(
                        'PHAM THI THUONG\nACB: 225088888',
                        style: TextStyle(
                          fontFamily: FontFamily.openSans,
                          fontSize: isSmallScreen ? 15 : 20,
                          height: 1.3,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
