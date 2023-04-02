import 'package:flutter/material.dart';
import 'package:my_wedding/gen/assets.gen.dart';
import 'package:my_wedding/gen/fonts.gen.dart';
import 'package:my_wedding/widgets/intro.dart';
import 'package:my_wedding/widgets/landing.dart';
import 'package:preload_page_view/preload_page_view.dart';
import 'package:url_strategy/url_strategy.dart';

import 'colors.dart';

void main() {
  setPathUrlStrategy();
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
        primaryColor: AppColors.primary,
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (context) => const MyHomePage());
      },
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
  final PreloadPageController _controller = PreloadPageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                  child: PreloadPageView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: _controller,
                    preloadPagesCount: 2,
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
                            curve: Curves.linear,
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
