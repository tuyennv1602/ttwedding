/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// ignore_for_file: directives_ordering,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/acb.jpg
  AssetGenImage get acb => const AssetGenImage('assets/images/acb.jpg');

  /// File path: assets/images/background.jpg
  AssetGenImage get background => const AssetGenImage('assets/images/background.jpg');

  /// File path: assets/images/background1.jpg
  AssetGenImage get background1 => const AssetGenImage('assets/images/background1.jpg');

  /// File path: assets/images/bg2.png
  AssetGenImage get bg2 => const AssetGenImage('assets/images/bg2.png');

  /// File path: assets/images/boy.png
  AssetGenImage get boy => const AssetGenImage('assets/images/boy.png');

  /// File path: assets/images/circle_flower.json
  String get circleFlower => 'assets/images/circle_flower.json';

  /// File path: assets/images/circle_frame.png
  AssetGenImage get circleFrame => const AssetGenImage('assets/images/circle_frame.png');

  /// File path: assets/images/date_frame.png
  AssetGenImage get dateFrame => const AssetGenImage('assets/images/date_frame.png');

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

  /// File path: assets/images/heart2.png
  AssetGenImage get heart2 => const AssetGenImage('assets/images/heart2.png');

  /// File path: assets/images/heart3.png
  AssetGenImage get heart3 => const AssetGenImage('assets/images/heart3.png');

  /// File path: assets/images/heart_feedback.json
  String get heartFeedback => 'assets/images/heart_feedback.json';

  /// File path: assets/images/heart_fly.json
  String get heartFly => 'assets/images/heart_fly.json';

  /// File path: assets/images/icon.png
  AssetGenImage get icon => const AssetGenImage('assets/images/icon.png');

  /// File path: assets/images/img1.jpg
  AssetGenImage get img1 => const AssetGenImage('assets/images/img1.jpg');

  /// File path: assets/images/img2.jpg
  AssetGenImage get img2 => const AssetGenImage('assets/images/img2.jpg');

  /// File path: assets/images/img3.jpg
  AssetGenImage get img3 => const AssetGenImage('assets/images/img3.jpg');

  /// File path: assets/images/leaf.png
  AssetGenImage get leaf => const AssetGenImage('assets/images/leaf.png');

  /// File path: assets/images/ring.png
  AssetGenImage get ring => const AssetGenImage('assets/images/ring.png');

  /// File path: assets/images/rose_gold.json
  String get roseGold => 'assets/images/rose_gold.json';

  /// File path: assets/images/rvsp.png
  AssetGenImage get rvsp => const AssetGenImage('assets/images/rvsp.png');

  /// File path: assets/images/vcb.jpg
  AssetGenImage get vcb => const AssetGenImage('assets/images/vcb.jpg');
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
