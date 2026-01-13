import 'package:flutter/material.dart';
import '../core/app_colors.dart';

class InputField extends StatelessWidget {
  final String hint;
  final bool obscure;
  final TextEditingController? controller;
  final TextInputType keyboardType;

  const InputField({
    super.key,
    required this.hint,
    this.obscure = false,
    this.controller,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: AppColors.field,
        borderRadius: BorderRadius.circular(24),
      ),
      child: TextField(
        controller: controller,
        obscureText: obscure,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hint,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
