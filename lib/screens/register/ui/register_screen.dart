import 'package:flutter/material.dart';

import '../../../configs/images.dart';
import '../../../widget/flushbar_alert.dart';
import '../../../widget/rounded_button.dart';
import '../../../widget/rounded_text_field.dart';
import '../../../widget/totoro_background.dart';
import '../../login/ui/login_screen.dart';
import '../../movies/ui/movies_screen.dart';
import '../bloc/register_cubit.dart';

class RegisterScreen extends StatelessWidget {
  static const String id = '/register_screen';
  const RegisterScreen(
      {Key? key,
      required this.createUser,
      required this.signOut,
      required this.createdRegister,
      required this.errorMessage})
      : super(key: key);

  final Function(String, String) createUser;

  final Function() signOut;
  final bool createdRegister;
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    late TextEditingController emailController = TextEditingController();
    late TextEditingController passwordController = TextEditingController();

    Future.delayed(const Duration(seconds: 2)).then((_) {
      if (errorMessage.isNotEmpty) {
        return FlushbarAlert(
                message: RegisterCubitProvider.of(context).state.errorMessage,
                isSuccess: false)
            .build(context);
      }
      if (createdRegister) {
        Navigator.pushReplacementNamed(context, MoviesScreen.id);
      }
    });

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: TotoroBackground(
          child: Padding(
            padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 50),
                    child: Image(
                        height: 56,
                        fit: BoxFit.cover,
                        image: Images.logoTitle,
                        filterQuality: FilterQuality.high),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25, bottom: 25),
                    child: Material(
                      elevation: 8,
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(50),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 27, vertical: 25),
                        child: Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('CRIE SUA CONTA',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                              const Text(
                                  'para continuar acessando o aplicativo',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white)),
                              const SizedBox(height: 18),
                              RoundedTextField(
                                label: 'insira seu email',
                                textInputType: TextInputType.emailAddress,
                                controller: emailController,
                              ),
                              const SizedBox(height: 14),
                              RoundedTextField(
                                textInputAction: TextInputAction.done,
                                label: 'insira sua senha',
                                obscureText: true,
                                controller: passwordController,
                              ),
                              const SizedBox(height: 15),
                              RoundedButton(
                                  text: 'CADASTRAR',
                                  onPressed: () {
                                    if (emailController.text.isNotEmpty &&
                                        passwordController.text.isNotEmpty) {
                                      createUser(
                                        emailController.text,
                                        passwordController.text,
                                      );
                                    } else {
                                      const FlushbarAlert(
                                              message:
                                                  'Usuário ou senha inválido',
                                              isSuccess: false)
                                          .build(context);
                                    }
                                  }),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text('Deseja voltar a tela de login? '),
                      GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(
                                context, LoginScreen.id);
                          },
                          child: const Text(
                            'Clique aqui pra voltar',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green),
                          )),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
