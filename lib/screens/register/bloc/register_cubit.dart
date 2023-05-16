import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'register_cubit_state.dart';

class RegisterCubit extends Cubit<RegisterCubitState> {
  RegisterCubit(RegisterCubitState registerCubitState, this._firebaseAuth)
      : super(RegisterCubitState(
            createdRegister: false, registerLoading: false, errorMessage: '')) {
    _firebaseAuth = FirebaseAuth.instance;
  }


  late FirebaseAuth _firebaseAuth;

  void createUser(String email, String password) {
    emit(state.copyWith(registerLoading: true));

    _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then(
      (userCredentials) {
        emit(state.copyWith(
          registerLoading: false,
          createdRegister: true,
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
      emit(state.copyWith(createdRegister: true));
    }
  }

  void signOut() {
    _firebaseAuth.signOut();
    emit(state.copyWith(createdRegister: false));
  }
}

class RegisterCubitProvider extends BlocProvider<RegisterCubit> {
  RegisterCubitProvider({super.key, Widget? child})
      : super(
          create: (context) => RegisterCubit(
              RegisterCubitState(
                  createdRegister: false,
                  errorMessage: '',
                  registerLoading: false),
              FirebaseAuth.instance),
          child: child,
        );

  static RegisterCubit of(BuildContext context) => BlocProvider.of(context);
}
