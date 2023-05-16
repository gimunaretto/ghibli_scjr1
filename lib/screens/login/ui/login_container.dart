import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth_cubit.dart';
import '../bloc/auth_cubit_state.dart';
import 'login_screen.dart';

class LoginContainer extends BlocBuilder<AuthCubit, AuthCubitState> {
  LoginContainer({super.key})
      : super(builder: (context, state) {
          return LoginScreen(
            authenticateUser: (String email, String password) {
              AuthCubitProvider.of(context).authenticateUser(email, password);
            },
            signOut: () {
              AuthCubitProvider.of(context).signOut();
            },
            authAuthenticated: state.authAuthenticated,
            errorMessage: state.errorMessage,
            authLoading: state.authLoading,
          );
        });
}
