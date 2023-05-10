import 'package:flutter/material.dart';
import 'package:my_wedding/colors.dart';
import 'package:my_wedding/gen/assets.gen.dart';
import 'package:my_wedding/extension.dart';
import 'package:my_wedding/gen/fonts.gen.dart';

class Header extends StatelessWidget {
  final double width;

  const Header({
    Key? key,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    Colors.white.withOpacity(0.2),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -((width - 20) * 0.1) / 2,
            left: 0,
            right: 0,
            child: Assets.images.divider3.image(
              height: (width - 20) * 0.1,
              width: width - 20,
              fit: BoxFit.fill,
              color: AppColors.primary.withOpacity(0.5),
            ),
          )
        ],
      ),
    );
  }
}
