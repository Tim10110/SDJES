import 'package:flutter/material.dart';


class LoginTextfield extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const LoginTextfield({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });
  
  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: TextField(
            controller: controller,
            obscureText: obscureText,
            decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black)
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black)
              ),
              hintText: hintText,
            ),
          ),
        );

  }
}