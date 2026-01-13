import 'package:flutter/material.dart';
import '../core/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const PrimaryButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(26),
      onTap: onTap,
      child: Container(
        height: 48,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.orange,
          borderRadius: BorderRadius.circular(26),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}

class OutlineButtonX extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const OutlineButtonX({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(26),
      onTap: onTap,
      child: Container(
        height: 48,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: AppColors.orange, width: 2),
          borderRadius: BorderRadius.circular(26),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: AppColors.orange,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
