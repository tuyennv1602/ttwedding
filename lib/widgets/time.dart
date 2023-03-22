import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_wedding/colors.dart';
import 'package:my_wedding/extension.dart';
import 'package:my_wedding/gen/assets.gen.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../gen/fonts.gen.dart';

class Time extends StatelessWidget {
  const Time({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            '💌 Với mong muốn được chia sẻ khoảnh khắc hạnh phúc này đến người thân, bạn bè, đồng nghiệp, Tuyển & Thương xin được gửi lời mời trân trọng nhất đến bạn tới dự hôn lễ của Tuyển và Thương.\n\n🕑 Hôn lễ được tổ chức vào',
            style: TextStyle(
              fontSize: context.isSmallScreen ? 16 : 20,
              fontFamily: FontFamily.roboto,
              height: 1.3,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Container(
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(width: 1, color: AppColors.backgroundShadow),
              bottom: BorderSide(width: 1, color: AppColors.backgroundShadow),
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 20),
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Thứ bảy',
                    style: TextStyle(
                      fontFamily: FontFamily.roboto,
                      fontSize: context.isSmallScreen ? 24 : 28,
                      color: AppColors.primaryText,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Container(
                    color: AppColors.primaryText,
                    width: 1,
                    height: 20,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                  ),
                  Text(
                    '27-05-2023',
                    style: TextStyle(
                      fontFamily: FontFamily.roboto,
                      fontSize: context.isSmallScreen ? 24 : 28,
                      color: AppColors.primaryText,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Text(
                '(Tức ngày 09-04 năm Quý Mão)',
                style: TextStyle(
                  fontSize: context.isSmallScreen ? 14 : 18,
                  fontFamily: FontFamily.roboto,
                  height: 1.3,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            '🏠 Tại gia đình',
            style: TextStyle(
              fontSize: context.isSmallScreen ? 16 : 20,
              fontFamily: FontFamily.roboto,
              height: 1.3,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Stack(
            children: [
              Center(
                child: Assets.images.hear2.image(
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
                                  text: 'Xóm 3, xã Giao Long, huyện Giao Thuỷ, tỉnh Nam Định',
                                  style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    height: 1.2,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                            style: TextStyle(
                              fontFamily: FontFamily.roboto,
                              fontSize: context.isSmallScreen ? 16 : 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 15),
                          GestureDetector(
                            onTap: () {
                              launchUrlString('https://goo.gl/maps/NnXgT5facEqAE2nc9');
                            },
                            child: const Text(
                              'Xem bản đồ →',
                              style: TextStyle(
                                fontFamily: FontFamily.roboto,
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
                                  text: 'Xóm 15, xã Hoành Sơn, huyện Giao Thuỷ, tỉnh Nam Định',
                                  style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    height: 1.2,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                            style: TextStyle(
                              fontFamily: FontFamily.roboto,
                              fontSize: context.isSmallScreen ? 16 : 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 15),
                          GestureDetector(
                            onTap: () {
                              launchUrlString('https://goo.gl/maps/KfbvjPXXcXib7znB6');
                            },
                            child: const Text(
                              'Xem bản đồ →',
                              style: TextStyle(
                                fontFamily: FontFamily.roboto,
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
            '❤ Sự hiện diện của bạn sẽ là món quà ý nghĩa nhất dành cho Tuyển & Thương...',
            style: TextStyle(
              fontSize: context.isSmallScreen ? 16 : 20,
              fontFamily: FontFamily.roboto,
              height: 1.3,
            ),
          ),
        ),
      ],
    );
  }
}
