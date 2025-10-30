import 'package:flutter/material.dart';

class AppTopBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;

  const AppTopBar({super.key, required this.title, this.actions});

  @override
  Size get preferredSize => const Size.fromHeight(64);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return AppBar(
      title: Text(title, style: theme.textTheme.headlineLarge),
      actions: actions,
      centerTitle: false,
      backgroundColor: Theme.of(context).canvasColor,
    );
  }
}
