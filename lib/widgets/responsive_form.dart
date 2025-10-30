import 'package:flutter/material.dart';

class ResponsiveForm extends StatelessWidget {
  final List<Widget> children;
  final double maxWidth;
  final EdgeInsetsGeometry padding;
  final CrossAxisAlignment crossAxisAlignment;

  const ResponsiveForm({
    super.key,
    required this.children,
    this.maxWidth = 600,
    this.padding = const EdgeInsets.all(24),
    this.crossAxisAlignment = CrossAxisAlignment.stretch,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final constrained =
            constraints.maxWidth > maxWidth ? maxWidth : constraints.maxWidth;
        return Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: constrained),
            child: Padding(
              padding: padding,
              child: Column(
                crossAxisAlignment: crossAxisAlignment,
                children: children,
              ),
            ),
          ),
        );
      },
    );
  }
}

