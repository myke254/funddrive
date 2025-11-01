import 'package:flutter/material.dart';

class DashboardSummaryWidget extends StatelessWidget {
  const DashboardSummaryWidget({
    super.key,
    required this.title,
    required this.content,
    required this.icon,
  });

  final String title;
  final String content;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(20),
      width:
          size.width > 1500
              ? (1500 / 3) - 9
              : size.width > 770
              ? (size.width / 3) - 22
              : size.width,
      decoration: BoxDecoration(
        color: theme.canvasColor,
        border: Border.all(color: theme.dividerColor, width: .7),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Icon(icon, color: theme.colorScheme.secondary, size: 20),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            content,
            style: theme.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
