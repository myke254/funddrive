import 'package:flutter/material.dart';
import 'package:funddrive/screens/dashboard/widgets/donate_dialog.dart';

import '../../../models/fund.dart';

class DonateNowButton extends StatelessWidget {
  const DonateNowButton({
    super.key,
    required String buttonText,
    required Fund fund,
  }) : _buttonText = buttonText,
       _fund = fund;

  final String _buttonText;
  final Fund _fund;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    //final size = MediaQuery.of(context).size;
    return FilledButton(
      style: FilledButton.styleFrom(
        backgroundColor: theme.primaryColor,
        foregroundColor: theme.canvasColor,
        minimumSize: const Size(double.infinity, 48),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed:
          () => showDialog(
            context: context,
            builder: (context) {
              return DonateDialog(fund: _fund);
            },
          ),
      child: Text(
        _buttonText,
        style: theme.textTheme.bodyMedium?.copyWith(color: theme.canvasColor),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class CompleteDonateButton extends StatelessWidget {
  const CompleteDonateButton({
    super.key,
    required String buttonText,
    required Fund fund,
    required double amount,
  }) : _buttonText = buttonText,
       _fund = fund,
       _amount = amount;

  final String _buttonText;
  final Fund _fund;
  final double _amount;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    //final size = MediaQuery.of(context).size;
    return FilledButton(
      style: FilledButton.styleFrom(
        backgroundColor: theme.primaryColor,
        foregroundColor: theme.canvasColor,
        minimumSize: const Size(double.infinity, 48),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: () {},
      child: Text(
        _buttonText,
        style: theme.textTheme.bodyMedium?.copyWith(color: theme.canvasColor),
        textAlign: TextAlign.center,
      ),
    );
  }
}
