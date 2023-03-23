import 'package:flutter/material.dart';
import 'package:my_wedding/colors.dart';
import 'package:my_wedding/extension.dart';
import 'package:my_wedding/gen/assets.gen.dart';
import 'package:my_wedding/gen/fonts.gen.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = context.isSmallScreen;
    return Container(
      color: AppColors.mainBackground.withOpacity(0.5),
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: Text(
                'Sẽ thật tuyệt vời nếu bạn tới dự lễ thành hôn của Tuyển và Thương',
                style: TextStyle(
                  fontSize: isSmallScreen ? 16 : 20,
                  fontFamily: FontFamily.roboto,
                  height: 1.3,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(height: 30),
          Stack(
            alignment: Alignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Assets.images.img3.image(
                  width: isSmallScreen ? 160 : 200,
                  height: isSmallScreen ? 160 : 200,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
              Assets.images.circleFrame.image(
                width: isSmallScreen ? 190 : 230,
                height: isSmallScreen ? 190 : 230,
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
      ),
    );
  }
}
