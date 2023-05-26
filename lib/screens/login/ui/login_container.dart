import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ghibli_scjr1/widget/flushbar_alert.dart';

import '../../movies/ui/movies_screen.dart';
import '../bloc/auth_cubit.dart';
import '../bloc/auth_cubit_state.dart';
import 'login_screen.dart';

class LoginContainer extends BlocConsumer<AuthCubit, AuthCubitState> {
  LoginContainer({super.key})
      : super(listener: (context, state) {
          if (state.errorMessage.isNotEmpty) {
            FlushbarAlert(message: state.errorMessage, isSuccess: false)
                .build(context);
          }
          if (state.authAuthenticated) {
            Navigator.pushReplacementNamed(context, MoviesScreen.id);
          }
        }, builder: (context, state) {
          return LoginScreen(
            authenticateUser: (String email, String password) {
              AuthCubitProvider.of(context).authenticateUser(email, password);
            },
            signOut: () {
              AuthCubitProvider.of(context).signOut();
            },
            authLoading: state.authLoading,
          );
        });
}
