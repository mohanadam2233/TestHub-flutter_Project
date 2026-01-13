import 'package:flutter/material.dart';
import '../core/app_colors.dart';

class SimpleTopBar extends StatelessWidget {
  final String title;
  final VoidCallback? onBack;
  const SimpleTopBar({super.key, required this.title, this.onBack});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.brown,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(22)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          if (onBack != null)
            IconButton(
              onPressed: onBack,
              icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
            )
          else
            const SizedBox(width: 8),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              fontSize: 18,
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search_rounded, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
