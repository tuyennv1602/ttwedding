import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:my_wedding/colors.dart';
import 'package:my_wedding/extension.dart';
import 'package:my_wedding/gen/fonts.gen.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Album extends StatelessWidget {
  const Album({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = context.isSmallScreen;
    const List<String> images = [
      'https://i.ibb.co/rpLqTdz/017-018.jpg',
      'https://i.ibb.co/ft7hPtX/007-008.jpg',
      'https://i.ibb.co/71f8kNS/013-014.jpg',
      'https://i.ibb.co/g6PMGXt/009-010.jpg',
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Album hình cưới',
              style: TextStyle(
                fontSize: isSmallScreen ? 24 : 32,
                height: 1.3,
                color: AppColors.primaryText,
                fontWeight: FontWeight.w500,
                fontFamily: FontFamily.openSans,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Cùng xem lại những bức hình đẹp nhất của Tuyển & Thương nhé.',
            style: TextStyle(
              fontSize: isSmallScreen ? 16 : 20,
              height: 1.3,
              fontFamily: FontFamily.openSans,
            ),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: isSmallScreen ? 250 : 400,
          child: CarouselSlider.builder(
            unlimitedMode: true,
            enableAutoSlider: true,
            autoSliderDelay: const Duration(seconds: 3),
            slideBuilder: (index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                child: CachedNetworkImage(
                  imageUrl: images[index],
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              );
            },
            slideTransform: const ParallaxTransform(),
            itemCount: images.length,
          ),
        ),
        Center(
          child: InkWell(
            onTap: () {
              launchUrlString(
                'https://drive.google.com/drive/folders/10v8_ZQqzIxxksMgI8FnCPtr4AYykzwlE?usp=share_link',
                mode: LaunchMode.externalApplication,
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.backgroundShadow,
                borderRadius: BorderRadius.circular(6),
              ),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: const Text(
                'Xem đầy đủ album',
                style: TextStyle(fontFamily: FontFamily.openSans, color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
