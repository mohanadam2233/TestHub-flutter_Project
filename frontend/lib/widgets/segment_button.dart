import 'package:flutter/material.dart';
import '../core/app_colors.dart';

class SegmentButton extends StatelessWidget {
  final String text;
  final bool selected;
  final VoidCallback onTap;

  const SegmentButton({
    super.key,
    required this.text,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(22),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selected ? AppColors.brown : AppColors.field,
          borderRadius: BorderRadius.circular(22),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: selected ? Colors.white : AppColors.brown,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
