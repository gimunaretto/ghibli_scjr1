import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class FlushbarAlert extends StatelessWidget {
  const FlushbarAlert({
    super.key,
    required this.message,
    this.isSuccess = true,
  });

  final String message;

  final bool isSuccess;

  @override
  Widget build(BuildContext context) {
    return Flushbar(
      title: isSuccess ? 'Sucesso!' : 'Aviso',
      message: message,
      icon: Icon(
        isSuccess ? Icons.check : Icons.error,
        size: 28.0,
        color: Colors.white,
      ),
      duration: const Duration(seconds: 3),
      backgroundGradient: LinearGradient(
        colors: isSuccess
            ? [Colors.green.shade600, Colors.green.shade400]
            : [Colors.red.shade600, Colors.red.shade400],
      ),
      onTap: (flushbar) => flushbar.dismiss(),
    )..show(context);
  }
}
