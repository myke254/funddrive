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
      forceMaterialTransparency: false,
      automaticallyImplyLeading: false,
      surfaceTintColor: Colors.transparent,
      primary: true,
      title: InkWell(
        onTap: () => Navigator.pushReplacementNamed(context, '/home'),
        child: Text(title, style: theme.textTheme.headlineMedium),
      ),
      actions: actions,
      centerTitle: false,
      backgroundColor: Theme.of(context).canvasColor,
    );
  }
}
