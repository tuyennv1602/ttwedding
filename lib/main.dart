import 'package:flutter/material.dart';
import 'package:my_wedding/gen/assets.gen.dart';
import 'package:my_wedding/gen/fonts.gen.dart';
import 'package:my_wedding/widgets/intro.dart';
import 'package:my_wedding/widgets/landing.dart';

import 'colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'T&T Wedding',
      theme: ThemeData(
        fontFamily: FontFamily.text,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<LandingPageState> _landingKey = GlobalKey();
  final PageController _controller = PageController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Assets.images.background.image(
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: LayoutBuilder(
              builder: (context, constraints) {
                final width =
                    constraints.maxWidth > 600 ? 600.0 : MediaQuery.of(context).size.width;
                return Container(
                  width: width,
                  height: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.backgroundShadow,
                        blurRadius: 12,
                      )
                    ],
                  ),
                  child: PageView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: _controller,
                    onPageChanged: (index) {
                      if (index == 1) {
                        _landingKey.currentState?.play();
                      }
                    },
                    children: [
                      IntroPage(
                        width: width,
                        onDone: () {
                          _controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        },
                      ),
                      LandingPage(key: _landingKey, width: width)
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
