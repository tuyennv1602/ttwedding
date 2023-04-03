import 'package:flutter/material.dart';
import 'package:my_wedding/colors.dart';
import 'package:my_wedding/extension.dart';
import 'package:my_wedding/gen/assets.gen.dart';
import 'package:my_wedding/gen/fonts.gen.dart';

class Footer extends StatelessWidget {
  final String name;
  const Footer({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = context.isSmallScreen;
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.mainBackground.withOpacity(0.2),
            blurRadius: 10,
          )
        ],
      ),
      margin: const EdgeInsets.only(bottom: 50),
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: Text(
                'Sẽ thật tuyệt vời nếu $name có thể xác nhận tới tham dự lễ thành hôn, để Tuyển & Thương cùng gia đình có thể tiếp đón chu đáo nhất.',
                style: TextStyle(
                  fontSize: isSmallScreen ? 15 : 18,
                  fontFamily: FontFamily.openSans,
                  height: 1.3,
                  fontStyle: FontStyle.italic,
                ),
                // textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(height: 30),
          Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Assets.images.img3.image(
                    width: isSmallScreen ? 160 : 200,
                    height: isSmallScreen ? 160 : 200,
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
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
