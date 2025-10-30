import 'package:flutter/material.dart';

class PageBackground extends StatelessWidget {
  final Widget child;
  const PageBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFF0FDF4), // light mint
            Color(0xFFE6FFFB), // aqua tint
            Color(0xFFF5F3FF), // lavender tint
          ],
        ),
      ),
      child: child,
    );
  }
}

