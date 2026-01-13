import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/app_colors.dart';

class TopBrownHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget? right;

  const TopBrownHeader({super.key, required this.title, this.subtitle, this.right, required TextAlign subtitleAlign});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.brown,
        borderRadius: BorderRadius.vertical(bottom: Radius.elliptical(210, 80)),
      ),
      padding: const EdgeInsets.fromLTRB(22, 52, 22, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 26,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 8),
                  Text(
                    subtitle!,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ],
            ),
          ),
          if (right != null) right!,
        ],
      ),
    );
  }
}
