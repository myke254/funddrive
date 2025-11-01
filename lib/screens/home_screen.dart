import 'package:flutter/material.dart';
import 'package:funddrive/screens/dashboard/widgets/fundraiser_card.dart';
import 'package:funddrive/screens/dashboard/widgets/summary_widgets_section.dart';
import 'package:funddrive/screens/dashboard/widgets/welcome_dashboard.dart';
import 'package:funddrive/widgets/base_scaffold.dart';

import '../repository/fund_repository.dart';
import 'dashboard/widgets/create_initiative_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    final funds = FundRepository.instance.getFunds();
    return BaseScaffold(
      title: '',
      body: SingleChildScrollView(
        child:
            funds.isNotEmpty
                ? SizedBox(
                  width: size.width,
                  //height: size.height,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                      size.width > 1500 ? ((size.width - 1500) / 2) : 20.0,
                      40.0,
                      size.width > 1500 ? ((size.width - 1500) / 2) : 20.0,
                      40.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Your Dashboard',
                                  style: theme.textTheme.headlineLarge
                                      ?.copyWith(fontWeight: FontWeight.w200),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  'Welcome back, Michael!',
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w200,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 170,
                              height: 40,
                              child: CreateInitiativeButton(
                                buttonText: '⊕   New Initiative',
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 40),
                        SummaryWidgetsSection(),
                        SizedBox(height: 30),
                        Text(
                          'Your Active FundRaisers',
                          style: theme.textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                        SizedBox(height: 20),
                        Wrap(
                          spacing: 24,
                          runSpacing: 24,
                          children:
                              funds
                                  .map((fund) => FundraiserCard(fund: fund))
                                  .toList(),
                        ),
                      ],
                    ),
                  ),
                )
                : const WelcomeDashboard(),
      ),
    );
  }
}
