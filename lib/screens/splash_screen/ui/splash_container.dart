import 'package:flutter_bloc/flutter_bloc.dart';
import 'splash_screen.dart';

import '../../login/bloc/auth_cubit.dart';
import '../../login/bloc/auth_cubit_state.dart';

class SplashContainer extends BlocBuilder<AuthCubit, AuthCubitState> {
  SplashContainer({super.key})
      : super(builder: (context, state) {
          return SplashScreen(
            authAuthenticated: state.authAuthenticated,
            checkAuthStatus: () {
              AuthCubitProvider.of(context).checkAuthStatus();
            },
          );
        });
}
