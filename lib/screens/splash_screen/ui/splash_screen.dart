import 'package:flutter/material.dart';

import '../../../configs/images.dart';
import '../../login/ui/login_screen.dart';
import '../../movies/ui/movies_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String id = '/splash_screen';
  const SplashScreen(
      {super.key,
      required this.authAuthenticated,
      required this.checkAuthStatus});

  final bool authAuthenticated;
  final Function() checkAuthStatus;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
    @override
  void initState() {
    super.initState();
    widget.checkAuthStatus();
    Future.delayed(const Duration(seconds: 2)).then((_) {
      if (widget.authAuthenticated) {
        Navigator.pushReplacementNamed(context, MoviesScreen.id);
      } else {
        Navigator.pushReplacementNamed(context, LoginScreen.id);
      }
    });
  }

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
        )));
  }
}
