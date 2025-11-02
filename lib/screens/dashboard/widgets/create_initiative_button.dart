import 'package:flutter/material.dart';

class CreateInitiativeButton extends StatelessWidget {
  const CreateInitiativeButton({super.key, required String buttonText})
    : _buttonText = buttonText;

  final String _buttonText;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return FilledButton(
      style: FilledButton.styleFrom(
        backgroundColor: theme.primaryColor,
        foregroundColor: theme.canvasColor,
        minimumSize: const Size(double.infinity, 48),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: () => Navigator.of(context).pushNamed('/create'),
      child: Text(
        _buttonText,
        style: theme.textTheme.bodyMedium?.copyWith(color: theme.canvasColor),
        textAlign: TextAlign.center,
      ),
    );
  }
}
