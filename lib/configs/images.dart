import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const String _imagePath = 'assets/images';

class _Image extends AssetImage {
  const _Image(String fileName) : super('$_imagePath/$fileName');
}

class Images {
  static const totoroSplashScreen = _Image('totoro-walking.gif');
  static const totoroLoading = _Image('totoro-loading.gif');
  static const totoroLeaf = _Image('leaf-totoro.png');
  static const logoTitle = _Image('logoTitle.png');

  static Future<void> precacheAssets() async {
    final List<Future<void>> futures = [
      rootBundle.load(Images.totoroSplashScreen.assetName),
      rootBundle.load(Images.totoroLeaf.assetName),
      rootBundle.load(Images.logoTitle.assetName),
    ];

    await Future.wait(futures);
  }
}
