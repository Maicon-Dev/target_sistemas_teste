import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String label;
  final Icon? icon;
  final bool obscuredText;
  final bool autofocos;
  final String? hintText;
  final String? errorText;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;

  const CustomInputField({
    super.key,
    this.label = '',
    this.icon,
    this.obscuredText = false,
    this.onChanged,
    required this.autofocos,
    this.hintText,
    this.errorText,
    this.onSubmitted,
    this.controller,
  });

  const CustomInputField.user({
    super.key,
    this.label = 'Usuário',
    this.icon = const Icon(
      Icons.person,
      color: Color(0xFF202934),
    ),
    this.obscuredText = false,
    this.onChanged,
    this.autofocos = false,
    this.hintText,
    this.errorText,
    this.onSubmitted,
    this.controller,
  });

  const CustomInputField.password({
    super.key,
    this.label = 'Senha',
    this.icon = const Icon(
      Icons.lock,
      color: Color(0xFF202934),
    ),
    this.obscuredText = true,
    this.onChanged,
    this.autofocos = false,
    this.hintText,
    this.errorText,
    this.onSubmitted,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w300,
            color: Color(0xFFBFDBD7),
          ),
        ),
        const SizedBox(height: 7),
        TextField(
          onChanged: onChanged,
          autofocus: autofocos,
          obscureText: obscuredText,
          onSubmitted: onSubmitted,
          controller: controller,
          textAlign: hintText != null ? TextAlign.center : TextAlign.start,
          decoration: InputDecoration(
            error: Text(
              errorText ?? '',
              style: const TextStyle(color: Color(0xFFFF0A00)),
            ),
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Color(0xFF000000),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            alignLabelWithHint: true,
            filled: true,
            fillColor: const Color(0xFFFFFFFF),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(7),
              ),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
