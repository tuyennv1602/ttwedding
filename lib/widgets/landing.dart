import 'package:flutter/material.dart';
import 'package:my_wedding/colors.dart';
import 'package:my_wedding/extension.dart';
import 'package:my_wedding/gen/assets.gen.dart';
import 'package:my_wedding/widgets/banking.dart';
import 'package:my_wedding/widgets/footer.dart';
import 'package:my_wedding/widgets/story.dart';
import 'package:my_wedding/widgets/time.dart';

import 'album.dart';
import 'header.dart';
import 'the_name.dart';

class LandingPage extends StatefulWidget {
  final double width;
  const LandingPage({
    super.key,
    required this.width,
  });

  @override
  State<LandingPage> createState() => LandingPageState();
}

class LandingPageState extends State<LandingPage> with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  void play() {
    _controller
      ..duration = const Duration(seconds: 2)
      ..forward();
  }

  @override
  Widget build(BuildContext context) {
    const borderRadius = BorderRadius.only(
      topRight: Radius.circular(10),
      bottomLeft: Radius.circular(10),
    );
    final isSmallScreen = context.isSmallScreen;

    final fWidth = widget.width / 4;
    return Stack(
      children: [
        Positioned.fill(
          child: Assets.images.bg2.image(
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          left: 10,
          right: 10,
          bottom: 10,
          top: 10,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.backgroundShadow, width: 1),
              borderRadius: borderRadius,
            ),
            child: ClipRRect(
              borderRadius: borderRadius,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    const Header(),
                    TheName(controller: _controller),
                    Assets.images.divider2.image(height: 30),
                    const SizedBox(height: 40),
                    const Story(),
                    const SizedBox(height: 20),
                    const Time(),
                    const SizedBox(height: 30),
                    Assets.images.rvsp.image(
                      height: isSmallScreen ? 60 : 80,
                      color: AppColors.primaryText.withOpacity(0.5),
                    ),
                    const SizedBox(height: 10),
                    const Album(),
                    const SizedBox(height: 20),
                    Assets.images.heart3.image(
                      height: isSmallScreen ? 60 : 80,
                      color: AppColors.primary.withOpacity(0.5),
                    ),
                    const SizedBox(height: 20),
                    const Footer(),
                    const SizedBox(height: 20),
                    Assets.images.leaf.image(
                      height: isSmallScreen ? 60 : 80,
                      color: AppColors.primary.withOpacity(0.5),
                    ),
                    const SizedBox(height: 20),
                    const Banking(),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          child: Assets.images.f1.image(width: fWidth + 40),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Assets.images.f2.image(width: fWidth),
        ),
      ],
    );
  }
}
