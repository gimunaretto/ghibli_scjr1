import 'package:flutter/material.dart';

import '../configs/images.dart';

class TotoroBackground extends StatelessWidget {
  static const double _totoroWidthFraction = 0.550;

  final Widget child;
  final Widget? floatingActionButton;

  const TotoroBackground({
    Key? key,
    required this.child,
    this.floatingActionButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final safeAreaTop = MediaQuery.of(context).padding.top;
    final totoroSize = MediaQuery.of(context).size.width * _totoroWidthFraction;
    final appBarHeight = AppBar().preferredSize.height;
    const iconButtonPadding = 28;
    final iconSize = IconTheme.of(context).size ?? 0;

    final totoroTopMargin = -(totoroSize / 2 - safeAreaTop - appBarHeight / 2);
    final totoroRightMargin =
        -(totoroSize / 2 - iconButtonPadding - iconSize / 2);

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: totoroTopMargin,
            right: totoroRightMargin,
            child: Image(
              image: Images.totoroLeaf,
              width: totoroSize,
              height: totoroSize,
              color: Colors.green.withOpacity(0.10),
            ),
          ),
          child,
        ],
      ),
      floatingActionButton: floatingActionButton,
    );
  }
}
