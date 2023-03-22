import 'package:flutter/material.dart';
import 'package:my_wedding/colors.dart';
import 'package:my_wedding/extension.dart';
import 'package:my_wedding/gen/assets.gen.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Assets.images.img3.image(
                width: 200,
                height: 200,
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
            Assets.images.circleFrame.image(
              width: 300,
              height: 300,
            ),
          ],
        ),
        Text(
          'Rất hân hạnh được đón tiếp!',
          style: TextStyle(
            fontSize: context.isSmallScreen ? 32 : 40,
            color: AppColors.primaryText,
          ),
        )
      ],
    );
  }
}
