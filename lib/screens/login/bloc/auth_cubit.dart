import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_cubit_state.dart';

class AuthCubit extends Cubit<AuthCubitState> {
  AuthCubit(AuthCubitState authCubitState, this._firebaseAuth)
      : super(const AuthCubitState(
          authAuthenticated: false,
          authLoading: false,
          errorMessage: '',
        )) {
    _firebaseAuth = FirebaseAuth.instance;
  }

  late FirebaseAuth _firebaseAuth;

  void authenticateUser(String email, String password) {
    emit(state.copyWith(authLoading: true));

    _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .then(
      (userCredentials) {
        emit(state.copyWith(
          authLoading: false,
          authAuthenticated: true,
          errorMessage: '',
        ));
      },
    ).catchError((error, stackTrace) {
      if (error is FirebaseAuthException) {
        emit(state.copyWith(
          errorMessage: (error.message ?? 'Ops, algo errado aconteceu'),
        ));
      }
    });
  }

  void checkAuthStatus() async {
    final user = _firebaseAuth.currentUser;
    Future.delayed(const Duration(seconds: 2))
        .then((_) => emit(state.copyWith(authAuthenticated: user != null)));
  }

  void signOut() {
    _firebaseAuth.signOut();
    emit(state.copyWith(authAuthenticated: false));
  }
}

class AuthCubitProvider extends BlocProvider<AuthCubit> {
  AuthCubitProvider({super.key, Widget? child})
      : super(
          create: (context) => AuthCubit(
              const AuthCubitState(
                authAuthenticated: false,
                authLoading: false,
                errorMessage: '',
              ),
              FirebaseAuth.instance)
            ..checkAuthStatus(),
          child: child,
        );

  static AuthCubit of(BuildContext context) => BlocProvider.of(context);
}
