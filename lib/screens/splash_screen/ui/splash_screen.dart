import 'package:flutter/material.dart';

import '../../../configs/images.dart';
import '../../login/ui/login_screen.dart';
import '../../movies/ui/movies_screen.dart';

class SplashScreen extends StatelessWidget {
  static const String id = '/splash_screen';

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
          width: size.width * 0.5,
          height: size.height * 0.5,
          child: const Image(image: Images.totoroSplashScreen),
        ),
      ),
    );
  }
}
