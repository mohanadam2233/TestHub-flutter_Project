import 'package:flutter/material.dart';
import '../core/app_colors.dart';

class WhitePanel extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;

  const WhitePanel({super.key, required this.child, this.padding = const EdgeInsets.all(0)});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.panel,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: Padding(padding: padding, child: child),
    );
  }
}
