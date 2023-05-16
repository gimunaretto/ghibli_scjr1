import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ghibli_scjr1/screens/register/bloc/register_cubit.dart';
import 'package:ghibli_scjr1/screens/register/ui/register_container.dart';
import 'package:ghibli_scjr1/screens/register/ui/register_screen.dart';

import 'firebase_options.dart';
import 'screens/login/bloc/auth_cubit.dart';
import 'screens/login/ui/login_container.dart';
import 'screens/login/ui/login_screen.dart';
import 'screens/movies/bloc/movies_cubit.dart';
import 'screens/movies/ui/movies_container.dart';
import 'screens/movies/ui/movies_screen.dart';
import 'screens/splash_screen/ui/splash_container.dart';
import 'screens/splash_screen/ui/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'QuickSand',
        colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: const Color.fromRGBO(158, 242, 155, 1),
            background: const Color.fromARGB(235, 242, 242, 242),
            secondary: Colors.green,
            tertiary: const Color.fromRGBO(48, 138, 217, 1)),
      ),
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id: (context) => AuthCubitProvider(
              child: SplashContainer(),
            ),
        MoviesScreen.id: (context) => MoviesCubitProvider(
              child: const MoviesContainer(),
            ),
        LoginScreen.id: (context) => AuthCubitProvider(
              child: LoginContainer(),
            ),
        RegisterScreen.id: (context) => RegisterCubitProvider(
              child: RegisterContainer(),
            ),
      },
    );
  }
}
