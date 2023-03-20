/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// ignore_for_file: directives_ordering,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/background.jpg
  AssetGenImage get background => const AssetGenImage('assets/images/background.jpg');

  /// File path: assets/images/bg2.png
  AssetGenImage get bg2 => const AssetGenImage('assets/images/bg2.png');

  /// File path: assets/images/boy.png
  AssetGenImage get boy => const AssetGenImage('assets/images/boy.png');

  /// File path: assets/images/circle_flower.json
  String get circleFlower => 'assets/images/circle_flower.json';

  /// File path: assets/images/cupid.png
  AssetGenImage get cupid => const AssetGenImage('assets/images/cupid.png');

  /// File path: assets/images/divider.json
  String get divider => 'assets/images/divider.json';

  /// File path: assets/images/divider2.png
  AssetGenImage get divider2 => const AssetGenImage('assets/images/divider2.png');

  /// File path: assets/images/divider3.png
  AssetGenImage get divider3 => const AssetGenImage('assets/images/divider3.png');

  /// File path: assets/images/f1.png
  AssetGenImage get f1 => const AssetGenImage('assets/images/f1.png');

  /// File path: assets/images/f2.png
  AssetGenImage get f2 => const AssetGenImage('assets/images/f2.png');

  /// File path: assets/images/girl.png
  AssetGenImage get girl => const AssetGenImage('assets/images/girl.png');

  /// File path: assets/images/heart.png
  AssetGenImage get heart => const AssetGenImage('assets/images/heart.png');

  /// File path: assets/images/heart_feedback.json
  String get heartFeedback => 'assets/images/heart_feedback.json';

  /// File path: assets/images/heart_fly.json
  String get heartFly => 'assets/images/heart_fly.json';

  /// File path: assets/images/img1.jpg
  AssetGenImage get img1 => const AssetGenImage('assets/images/img1.jpg');

  /// File path: assets/images/rose_gold.json
  String get roseGold => 'assets/images/rose_gold.json';
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage extends AssetImage {
  const AssetGenImage(String assetName) : super(assetName);

  Image image({
    Key? key,
    ImageFrameBuilder? frameBuilder,
    ImageLoadingBuilder? loadingBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? width,
    double? height,
    Color? color,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    FilterQuality filterQuality = FilterQuality.low,
  }) {
    return Image(
      key: key,
      image: this,
      frameBuilder: frameBuilder,
      loadingBuilder: loadingBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      width: width,
      height: height,
      color: color,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      filterQuality: filterQuality,
    );
  }

  String get path => assetName;
}
