import 'package:flutter/material.dart';

import '../../../configs/images.dart';
import '../../../widget/rounded_button.dart';
import '../../../widget/rounded_text_field.dart';
import '../../../widget/totoro_background.dart';
import '../../register/ui/register_screen.dart';

class LoginScreen extends StatelessWidget {
  static const String id = '/login_screen';
  const LoginScreen(
      {Key? key,
      required this.authenticateUser,
      required this.signOut,
      required this.authLoading})
      : super(key: key);

  final Function(String, String) authenticateUser;

  final Function() signOut;
  final bool authLoading;

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: TotoroBackground(
          child: Builder(builder: (context) {
            return Padding(
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
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 25, bottom: 25),
                          child: Material(
                            elevation: 8,
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(50),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 27, vertical: 25),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('LOGIN',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                                  const Text(
                                      'logue-se para acessar a sua conta',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.white)),
                                  const SizedBox(height: 18),
                                  RoundedTextField(
                                    label: 'insira seu email',
                                    textInputType: TextInputType.emailAddress,
                                    controller: email,
                                  ),
                                  const SizedBox(height: 14),
                                  RoundedTextField(
                                    textInputAction: TextInputAction.next,
                                    label: 'insira sua senha',
                                    obscureText: true,
                                    controller: password,
                                  ),
                                  const SizedBox(height: 15),
                                  RoundedButton(
                                    text: 'ENTRAR',
                                    onPressed: () {
                                      if (password.text.isNotEmpty &&
                                          email.text.isNotEmpty) {
                                        authenticateUser(
                                          email.text,
                                          password.text,
                                        );
                                      }
                                    },
                                  ),
                                  const SizedBox(height: 10),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text('Novo por aqui? '),
                        GestureDetector(
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                  context, RegisterScreen.id);
                            },
                            child: const Text(
                              'Crie uma conta',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green),
                            )),
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
