import 'package:flutter/material.dart';

class ElevatedCenterCard extends StatelessWidget {
  final double maxWidth;
  final EdgeInsetsGeometry padding;
  final List<Widget> children;
  const ElevatedCenterCard({
    super.key,
    required this.children,
    this.maxWidth = 560,
    this.padding = const EdgeInsets.all(24),
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: Card(
          elevation: 6,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: padding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: children,
            ),
          ),
        ),
      ),
    );
  }
}

