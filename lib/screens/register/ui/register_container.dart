import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ghibli_scjr1/screens/register/ui/register_screen.dart';

import '../bloc/register_cubit.dart';
import '../bloc/register_cubit_state.dart';

class RegisterContainer extends BlocBuilder<RegisterCubit, RegisterCubitState> {
  RegisterContainer({super.key})
      : super(builder: (context, state) {
          return RegisterScreen(
            createUser: (String email, String password) {
              RegisterCubitProvider.of(context).createUser(email, password);
            },
            signOut: () {
              RegisterCubitProvider.of(context).signOut();
            },
            createdRegister: state.createdRegister,
            errorMessage: state.errorMessage,
          );
        });
}
