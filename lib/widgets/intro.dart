import 'dart:async';

import 'package:action_slider/action_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_wedding/colors.dart';
import 'package:my_wedding/extension.dart';
import 'package:my_wedding/gen/assets.gen.dart';
import 'package:my_wedding/gen/fonts.gen.dart';
import 'package:my_wedding/widgets/tt.dart';

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
  bool _isLoading = true;
  bool _isDisplayGuide = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this)
      ..addListener(() {
        if (_controller.isCompleted) {
          _slideDone.value = false;
          widget.onDone();
        }
      });
    _timer = Timer.periodic(const Duration(seconds: 5), (_) {
      setState(() {
        _isDisplayGuide = !_isDisplayGuide;
      });
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Future.wait([
      precacheImage(AssetImage(Assets.images.girl.path), context),
      precacheImage(AssetImage(Assets.images.boy.path), context)
    ]).then((value) {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();

    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = context.isSmallScreen;
    final slideWidth = isSmallScreen ? widget.width - 60 : widget.width * 0.7;
    final bigText = isSmallScreen ? 64.0 : 80.0;
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Assets.images.background1.image(
              fit: BoxFit.cover,
              alignment: Alignment.centerRight,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Transform.translate(
                offset: const Offset(0, -20),
                child: Transform.scale(
                  scale: 1.1,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: bigText),
                          child: Text(
                            'Save',
                            style: TextStyle(color: AppColors.primaryText, fontSize: bigText),
                          ),
                        ),
                      ),
                      Positioned(
                        child: Padding(
                          padding: EdgeInsets.only(left: isSmallScreen ? 50 : 60, top: 20),
                          child: Text(
                            'the',
                            style: TextStyle(
                                color: AppColors.primaryText, fontSize: isSmallScreen ? 35 : 40),
                          ),
                        ),
                      ),
                      Positioned(
                        child: Padding(
                          padding: EdgeInsets.only(top: bigText),
                          child: Text(
                            'Date',
                            style: TextStyle(color: AppColors.primaryText, fontSize: bigText),
                          ),
                        ),
                      ),
                      Positioned(
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: bigText * 2,
                            left: isSmallScreen ? 50 : 60,
                          ),
                          child: Text(
                            '27-05-2023',
                            style: TextStyle(
                              color: AppColors.primaryText,
                              fontSize: isSmallScreen ? 14 : 18,
                              fontFamily: FontFamily.openSans,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 50),
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
                                  final double imgWidth = isSmallScreen ? 100 : 120;
                                  final double extra = isSmallScreen ? 5 : 6;
                                  return Transform.translate(
                                    offset: Offset(
                                        ((slideWidth / 2) - (imgWidth - extra)) * percent, 0),
                                    child: Image.asset(
                                      Assets.images.boy.path,
                                      width: imgWidth,
                                    ),
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
                                  final double imgWidth = isSmallScreen ? 125 : 145;
                                  final double extra = isSmallScreen ? 5 : 6;
                                  return Transform.translate(
                                    offset: Offset(
                                        -(((slideWidth / 2) - (imgWidth - extra)) * percent), 0),
                                    child: Image.asset(
                                      Assets.images.girl.path,
                                      width: imgWidth,
                                    ),
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
                icon: const Icon(
                  Icons.arrow_circle_right,
                  size: 55,
                  color: Colors.white,
                ),
                backgroundColor: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: AppColors.backgroundShadow,
                    blurRadius: 10,
                  )
                ],
                action: (controller) async {
                  setState(() {
                    _isDisplayGuide = false;
                  });
                  controller.success();
                  _timer?.cancel();
                  _slideDone.value = true;
                  _controller
                    ..duration = const Duration(seconds: 5)
                    ..forward();
                },
                stateChangeCallback: (_, state, __) {
                  _slidePercent.value = state.position;
                },
                child: Text(
                  'Happy Wedding',
                  style: TextStyle(
                    color: AppColors.backgroundShadow,
                    fontSize: isSmallScreen ? 28 : 32,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                    height: 1,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              AnimatedOpacity(
                opacity: _isDisplayGuide ? 1 : 0,
                duration: const Duration(seconds: 1),
                child: const Text(
                  '→ Vuốt mũi tên sang phải để mở thiệp nhé ^.^',
                  style: TextStyle(
                    fontFamily: FontFamily.openSans,
                    fontStyle: FontStyle.italic,
                    color: AppColors.primary,
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
          ),
          if (_isLoading)
            Positioned.fill(
              child: Container(
                color: Colors.white,
                child: Center(
                  child: CupertinoActivityIndicator(
                    color: AppColors.primary,
                    radius: context.isSmallScreen ? 10 : 20,
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
