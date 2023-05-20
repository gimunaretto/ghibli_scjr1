import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../login/ui/login_screen.dart';
import '../../movies/ui/movies_screen.dart';
import 'splash_screen.dart';

import '../../login/bloc/auth_cubit.dart';
import '../../login/bloc/auth_cubit_state.dart';

class SplashContainer extends BlocConsumer<AuthCubit, AuthCubitState> {
  SplashContainer({super.key})
      : super(
          listener: (context, state) {
            if (state.authAuthenticated) {
              Navigator.pushReplacementNamed(context, MoviesScreen.id);
            } else {
              Navigator.pushReplacementNamed(context, LoginScreen.id);
            }
          },
          builder: (context, state) {
            return const SplashScreen();
          },
        );
}
