import 'package:action_slider/action_slider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_wedding/colors.dart';
import 'package:my_wedding/extension.dart';
import 'package:my_wedding/gen/assets.gen.dart';

class IntroPage extends StatefulWidget {
  final double width;
  final VoidCallback onDone;
  const IntroPage({
    Key? key,
    required this.width,
    required this.onDone,
  }) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> with TickerProviderStateMixin {
  final ValueNotifier<double> _slidePercent = ValueNotifier(0);
  late final AnimationController _controller;
  final ValueNotifier<bool> _slideDone = ValueNotifier(false);
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this)
      ..addListener(() {
        if (_controller.isCompleted) {
          widget.onDone();
        }
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final slideWidth = context.isSmallScreen ? widget.width - 60 : widget.width * 0.7;
    return Scaffold(
      backgroundColor: AppColors.mainBackground.withOpacity(0.1),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: widget.width,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    SizedBox(
                      width: slideWidth,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: ValueListenableBuilder<double>(
                                valueListenable: _slidePercent,
                                builder: (context, percent, _) {
                                  final double imgWidth = context.isSmallScreen ? 100 : 120;
                                  final double extra = context.isSmallScreen ? 5 : 6;
                                  return Transform.translate(
                                    offset: Offset(
                                        ((slideWidth / 2) - (imgWidth - extra)) * percent, 0),
                                    child: Assets.images.boy.image(width: imgWidth),
                                  );
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: ValueListenableBuilder<double>(
                                valueListenable: _slidePercent,
                                builder: (context, percent, _) {
                                  final double imgWidth = context.isSmallScreen ? 125 : 145;
                                  final double extra = context.isSmallScreen ? 5 : 6;

                                  return Transform.translate(
                                    offset: Offset(
                                        -(((slideWidth / 2) - (imgWidth - extra)) * percent), 0),
                                    child: Assets.images.girl.image(width: imgWidth),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              ActionSlider.standard(
                sliderBehavior: SliderBehavior.move,
                width: slideWidth,
                toggleColor: AppColors.backgroundShadow,
                iconAlignment: Alignment.centerRight,
                successIcon: SizedBox(width: 55, child: Center(child: Assets.images.heart.image())),
                icon: SizedBox(width: 55, child: Center(child: Assets.images.heart.image())),
                backgroundColor: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: AppColors.backgroundShadow,
                    blurRadius: 10,
                  )
                ],
                action: (controller) async {
                  controller.success();
                  _slideDone.value = true;
                  _controller
                    ..duration = const Duration(seconds: 5)
                    ..forward();
                },
                stateChangeCallback: (_, state, __) {
                  _slidePercent.value = state.position;
                },
                child: Text(
                  'Vuốt để mở thiệp nhé ^^',
                  style: TextStyle(
                    color: AppColors.backgroundShadow,
                    fontSize: context.isSmallScreen ? 28 : 32,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          Positioned.fill(
            child: ValueListenableBuilder<bool>(
              valueListenable: _slideDone,
              child: Lottie.asset(
                Assets.images.heartFeedback,
                controller: _controller,
                fit: BoxFit.cover,
              ),
              builder: (context, isDone, child) {
                return Visibility(
                  visible: isDone,
                  child: child!,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
