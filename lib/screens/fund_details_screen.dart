import 'package:flutter/material.dart';

import '../models/fund.dart';
import '../repository/fund_repository.dart';
import '../widgets/app_footer.dart';

class FundDetailsScreen extends StatelessWidget {
  const FundDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String fundId = ModalRoute.of(context)!.settings.arguments as String;
    final Fund? fund = FundRepository.instance.getById(fundId);
    if (fund == null) {
      return const Scaffold(body: Center(child: Text('Fund not found')));
    }
    final double progress = (fund.amountRaised /
            (fund.goalAmount == 0 ? 1 : fund.goalAmount))
        .clamp(0, 1);
    return Scaffold(
      bottomNavigationBar: const AppFooter(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 320,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(fund.title),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(fund.imageUrl, fit: BoxFit.cover),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0.2),
                          Colors.black.withOpacity(0.6),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.share_outlined),
                tooltip: 'Share',
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 900),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        fund.description,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: LinearProgressIndicator(
                                value: progress,
                                minHeight: 12,
                                backgroundColor: Colors.black12,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Text('${(progress * 100).toStringAsFixed(0)}%'),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Raised ${fund.currencyCode} ${fund.amountRaised.toStringAsFixed(0)} / ${fund.currencyCode} ${fund.goalAmount.toStringAsFixed(0)}',
                      ),
                      const SizedBox(height: 24),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'WhatsApp Group',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const SizedBox(height: 8),
                              SelectableText(fund.whatsappGroupLink),
                              const SizedBox(height: 16),
                              Text(
                                'Bank Details (hidden for donors)',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'Visible only to fundraiser after authentication.',
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        height: 48,
                        child: FilledButton.icon(
                          onPressed:
                              () => Navigator.of(
                                context,
                              ).pushNamed('/donate', arguments: fund.id),
                          icon: const Icon(Icons.volunteer_activism_outlined),
                          label: const Text('Donate'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
