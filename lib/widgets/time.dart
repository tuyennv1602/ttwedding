import 'package:flutter/material.dart';
import 'package:my_wedding/colors.dart';
import 'package:my_wedding/extension.dart';
import 'package:my_wedding/gen/assets.gen.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../gen/fonts.gen.dart';

class Time extends StatelessWidget {
  final double width;
  final String name;
  const Time({
    Key? key,
    required this.width,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = context.isSmallScreen;
    final dateStyle = TextStyle(
      fontSize: isSmallScreen ? 22 : 30,
      fontFamily: FontFamily.openSans,
      color: AppColors.primaryText,
      fontWeight: FontWeight.w500,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Assets.images.ring.image(height: 150, color: AppColors.mainBackground.withOpacity(0.5)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                '💌 Với mong muốn được chia sẻ khoảnh khắc hạnh phúc này đến người thân, bạn bè, đồng nghiệp, Tuyển & Thương trân trọng kính mời $name tới dự hôn lễ của Tuyển & Thương.\n\n🕑 Hôn lễ được tổ chức vào\n',
                style: TextStyle(
                  fontSize: isSmallScreen ? 16 : 20,
                  fontFamily: FontFamily.openSans,
                  height: 1.3,
                ),
              ),
            ),
          ],
        ),
        Align(
          child: SizedBox(
            width: width * (isSmallScreen ? 0.85 : 0.7),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Assets.images.dateFrame.image(),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Thứ 7',
                            style: dateStyle,
                          ),
                          Container(
                            height: 20,
                            color: AppColors.primaryText,
                            width: 1,
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                          ),
                          Text(
                            '27\n05',
                            style: TextStyle(
                              fontSize: isSmallScreen ? 28 : 46,
                              fontFamily: FontFamily.openSans,
                              color: AppColors.primaryText,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            height: 20,
                            color: AppColors.primaryText,
                            width: 1,
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                          ),
                          Text(
                            '2023',
                            style: dateStyle,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '(Tức ngày 09-04 năm Quý Mão)',
                        style: TextStyle(
                          fontSize: isSmallScreen ? 14 : 16,
                          fontFamily: FontFamily.openSans,
                          height: 1.3,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            '🏠 Tại Tư gia',
            style: TextStyle(
              fontSize: isSmallScreen ? 16 : 20,
              fontFamily: FontFamily.openSans,
              height: 1.3,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Stack(
            children: [
              Center(
                child: Assets.images.heart2.image(
                  height: 180,
                  color: AppColors.mainBackground.withOpacity(0.5),
                  fit: BoxFit.contain,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 180,
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.backgroundShadow),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text.rich(
                            const TextSpan(
                              text: 'Nhà trai\n\n',
                              children: [
                                TextSpan(
                                  text: 'Xã Giao Long, huyện Giao Thuỷ, tỉnh Nam Định',
                                  style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    height: 1.2,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                            style: TextStyle(
                              fontFamily: FontFamily.openSans,
                              fontSize: isSmallScreen ? 16 : 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 15),
                          GestureDetector(
                            onTap: () {
                              launchUrlString(
                                'https://goo.gl/maps/NnXgT5facEqAE2nc9',
                                mode: LaunchMode.externalApplication,
                              );
                            },
                            child: const Text(
                              'Xem bản đồ →',
                              style: TextStyle(
                                fontFamily: FontFamily.openSans,
                                fontStyle: FontStyle.italic,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 180,
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.backgroundShadow),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text.rich(
                            const TextSpan(
                              text: 'Nhà gái\n\n',
                              children: [
                                TextSpan(
                                  text: 'Xã Hoành Sơn, huyện Giao Thuỷ, tỉnh Nam Định',
                                  style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    height: 1.2,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                            style: TextStyle(
                              fontFamily: FontFamily.openSans,
                              fontSize: isSmallScreen ? 16 : 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 15),
                          GestureDetector(
                            onTap: () {
                              launchUrlString(
                                'https://goo.gl/maps/KfbvjPXXcXib7znB6',
                                mode: LaunchMode.externalApplication,
                              );
                            },
                            child: const Text(
                              'Xem bản đồ →',
                              style: TextStyle(
                                fontFamily: FontFamily.openSans,
                                fontStyle: FontStyle.italic,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            '💝 Sự hiện diện của $name sẽ là món quà ý nghĩa nhất dành cho Tuyển & Thương',
            style: TextStyle(
              fontSize: isSmallScreen ? 16 : 20,
              fontFamily: FontFamily.openSans,
              height: 1.3,
            ),
          ),
        ),
      ],
    );
  }
}
