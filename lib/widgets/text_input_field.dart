import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  const TextInputField({
    super.key,
    this.hintText,
    this.keyboardType,
    this.labelText,
    this.validator,
    this.maxLines,
    this.obscureText = false,
    this.enabled = true,
    this.controller,
    this.suffix,
  });

  final String? hintText;
  final TextInputType? keyboardType;
  final String? labelText;
  final String? Function(String?)? validator;
  final int? maxLines;
  final bool obscureText;
  final bool enabled;
  final TextEditingController? controller;
  final Widget? suffix;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return TextFormField(
      cursorColor: theme.dividerColor,
      cursorWidth: .8,
      maxLines: obscureText ? 1 : (maxLines ?? 1),
      enabled: enabled,
      obscureText: obscureText,
      decoration: InputDecoration(
        filled: true,
        fillColor: theme.scaffoldBackgroundColor,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: .5),
          borderRadius: BorderRadius.circular(8),
        ),

        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: theme.primaryColor, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),

        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey[600]),
        suffix: suffix,
      ),
      style: theme.textTheme.bodyMedium,
    );
  }
}
