import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_cubit_state.dart';

class AuthCubit extends Cubit<AuthCubitState> {
  AuthCubit(AuthCubitState authCubitState, this._firebaseAuth)
      : super(AuthCubitState(
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

  void checkAuthStatus() {
    final user = _firebaseAuth.currentUser;
    if (user != null) {
      emit(state.copyWith(authAuthenticated: true));
    }
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
              AuthCubitState(
                authAuthenticated: false,
                authLoading: false,
                errorMessage: '',
              ),
              FirebaseAuth.instance),
          child: child,
        );

  static AuthCubit of(BuildContext context) => BlocProvider.of(context);
}
