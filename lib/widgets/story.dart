import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_wedding/colors.dart';
import 'package:my_wedding/extension.dart';
import 'package:my_wedding/gen/assets.gen.dart';
import 'package:my_wedding/gen/fonts.gen.dart';

class Story extends StatelessWidget {
  const Story({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = context.isSmallScreen;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    '“Một ngày nào đó, chúng ta sẽ tìm thấy người ấy, người mà giữa hàng trăm triệu người trên thế giới này, sẽ vững vàng tiến đến chỗ chúng ta, nắm lấy tay ta, bình lặng cùng đi qua cuộc đời giông bão này.”',
                    style: TextStyle(
                      fontSize: isSmallScreen ? 16 : 20,
                      fontFamily: FontFamily.openSans,
                      height: 1.3,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
              Transform.rotate(
                origin: Offset.zero,
                angle: 15 / 360,
                filterQuality: FilterQuality.high,
                child: Container(
                  width: isSmallScreen ? 150 : 200,
                  height: isSmallScreen ? 180 : 250,
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 5,
                        color: AppColors.mainBackground.withOpacity(0.5)),
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned.fill(
                        child: Assets.images.img2.image(fit: BoxFit.cover),
                      ),
                      Positioned(
                        right: -20,
                        bottom: -20,
                        child: Assets.images.leaf.image(
                          width: isSmallScreen ? 40 : 50,
                          color: AppColors.mainBackground,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Text.rich(
              const TextSpan(
                text:
                    'Ngày hạnh phúc ấy được đánh dấu bằng buổi tiệc mang tên ',
                children: [
                  TextSpan(
                    text: 'Lễ Thành Hôn',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              style: TextStyle(
                fontSize: isSmallScreen ? 16 : 20,
                fontFamily: FontFamily.openSans,
                height: 1.3,
              ),
            ),
          ),
          Transform.translate(
            offset: const Offset(0, 10),
            child: Center(
              child: Text(
                'Nguyễn Văn Tuyển',
                style: TextStyle(
                  fontFamily: FontFamily.text,
                  fontSize: isSmallScreen ? 36 : 46,
                  color: AppColors.primaryText,
                ),
              ),
            ),
          ),
          Center(
            child: SizedBox(
              height: 80,
              width: 80,
              child: Center(
                child: Lottie.asset(
                  Assets.images.heartFly,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: const Offset(0, -10),
            child: Center(
              child: Text(
                'Phạm Thị Thương',
                style: TextStyle(
                  fontFamily: FontFamily.text,
                  fontSize: isSmallScreen ? 36 : 46,
                  color: AppColors.primaryText,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
