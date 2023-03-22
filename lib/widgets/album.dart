import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:my_wedding/extension.dart';
import 'package:my_wedding/gen/fonts.gen.dart';

class Album extends StatelessWidget {
  const Album({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const List<String> images = [
      'https://znews-photo.zingcdn.me/w660/Uploaded/qfssu/2022_10_16/312010655_10228605456097461_7980653090286460139_n.jpg',
      'https://phunuvietnam.mediacdn.vn/179072216278405120/2023/1/7/3230529447341916211575271568471375277054775n-1673059263629352442406.jpg',
      'https://i1-ngoisao.vnecdn.net/2022/10/17/ALI18447-1665992336.png?w=460&h=0&q=100&dpr=2&fit=crop&s=CdSWrJl8XY7e9i0Nr76gUA',
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            '📷 Cùng xem bộ ảnh cưới nhé',
            style: TextStyle(
              fontSize: context.isSmallScreen ? 16 : 20,
              fontFamily: FontFamily.roboto,
              height: 1.3,
            ),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: context.isSmallScreen ? 250 : 350,
          child: CarouselSlider.builder(
            unlimitedMode: true,
            enableAutoSlider: true,
            autoSliderDelay: const Duration(seconds: 3),
            viewportFraction: 0.9,
            slideBuilder: (index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                child: Image.network(
                  images[index],
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              );
            },
            slideTransform: const ParallaxTransform(),
            itemCount: images.length,
          ),
        ),
      ],
    );
  }
}
