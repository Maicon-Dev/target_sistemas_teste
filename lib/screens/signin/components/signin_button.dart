import 'package:flutter/material.dart';

class SigninButton extends StatelessWidget {
  final Function() onPressed;
  const SigninButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF44BD6E),
        shape: const StadiumBorder(),
      ),
      child: const Text(
        'Entrar',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
