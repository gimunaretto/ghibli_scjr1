import 'package:flutter/material.dart';

class RoundedTextField extends StatelessWidget {
  const RoundedTextField({
    super.key,
    required this.label,
    this.textInputType = TextInputType.text,
    this.obscureText = false,
    required this.controller,
    this.textInputAction = TextInputAction.next,
  });

  final String label;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final TextEditingController controller;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
      ),
      child: TextFormField(
        style: const TextStyle(color: Color.fromARGB(255, 62, 145, 65)),
        textInputAction: textInputAction,
        keyboardType: textInputType,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: label,
          labelStyle:
              const TextStyle(color: Color.fromARGB(255, 136, 135, 135)),
          border: InputBorder.none,
          fillColor: Colors.white,
          filled: false,
        ),
        controller: controller,
      ),
    );
  }
}
