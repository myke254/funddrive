import 'package:flutter/material.dart';
import 'package:funddrive/models/fund.dart';
import 'package:funddrive/screens/dashboard/widgets/create_initiative_button.dart';

class FundraiserCard extends StatelessWidget {
  const FundraiserCard({super.key, required this.fund});

  final Fund fund;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Container(
      height: 500,
      width:
          size.width > 1500
              ? (1500 / 3) - 17
              : size.width > 1020
              ? (size.width / 3) - 30
              : size.width > 770
              ? (size.width / 2) - 35
              : size.width,
      decoration: BoxDecoration(
        color: theme.canvasColor,
        border: Border.all(color: theme.dividerColor, width: .6),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: SizedBox(
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Image.network(fund.imageUrl, fit: BoxFit.cover),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      fund.title,
                      style: theme.textTheme.headlineMedium,
                    ),
                  ),

                  SizedBox(height: 20),
                  Expanded(
                    flex: 12,
                    child: Text(fund.description, softWrap: true),
                  ),
                  Expanded(
                    flex: 2,
                    child: LinearProgressIndicator(
                      borderRadius: BorderRadius.circular(15),
                      color: theme.primaryColor,
                      // ignore: deprecated_member_use
                      year2023: true,
                      value: fund.amountRaised / fund.goalAmount,
                    ),
                  ),
                  SizedBox(height: 4),
                  Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${fund.amountRaised}',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Text('Raised of \$${fund.goalAmount}'),
                      ],
                    ),
                  ),
                  SizedBox(height: 12),
                  Expanded(
                    flex: 4,
                    child: DonateNowButton(buttonText: '♡   Donate Now'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
