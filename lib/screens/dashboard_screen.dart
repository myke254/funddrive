import 'package:flutter/material.dart';
import '../models/fund.dart';
import '../repository/fund_repository.dart';
import '../widgets/base_scaffold.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Fund> funds = FundRepository.instance.getFunds();
    final double totalRaised = funds.fold(
      0,
      (sum, fund) => sum + fund.amountRaised,
    );
    final double overallGoal = funds.fold(
      0,
      (sum, fund) => sum + fund.goalAmount,
    );
    final int activeInitiatives = funds.length;

    return BaseScaffold(
      title: 'Dashboard',
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pushNamed('/home'),
          child: const Text('Home'),
        ),
      ],
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.of(context).pushNamed('/create'),
        icon: const Icon(Icons.add),
        label: const Text('New Initiative'),
        backgroundColor: Colors.amber,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your Dashboard',
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Welcome back, Fundraiser!',
                    style: Theme.of(
                      context,
                    ).textTheme.titleMedium?.copyWith(color: Colors.black54),
                  ),
                ],
              ),
            ),
            LayoutBuilder(
              builder: (context, constraints) {
                final double width = constraints.maxWidth;
                int crossAxisCount = 1;
                double childAspect = 2.5;

                if (width >= 1200) {
                  crossAxisCount = 3;
                } else if (width >= 800) {
                  crossAxisCount = 3;
                } else if (width >= 600) {
                  crossAxisCount = 2;
                }

                return GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: childAspect,
                  children: [
                    _buildStatCard(
                      context,
                      'Total Raised',
                      '\$${(totalRaised / 1000).toStringAsFixed(0)}K',
                      Icons.trending_up,
                      Colors.green,
                    ),
                    _buildStatCard(
                      context,
                      'Active Initiatives',
                      '$activeInitiatives',
                      Icons.visibility,
                      Colors.blue,
                    ),
                    _buildStatCard(
                      context,
                      'Overall Goal',
                      '\$${(overallGoal / 1000).toStringAsFixed(0)}K',
                      Icons.flag,
                      Colors.orange,
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 32),
            Text(
              'Your Active Initiatives',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            LayoutBuilder(
              builder: (context, constraints) {
                final double width = constraints.maxWidth;
                int crossAxisCount = 1;
                double childAspect = 0.8;

                if (width >= 1400) {
                  crossAxisCount = 3;
                } else if (width >= 1000) {
                  crossAxisCount = 2;
                } else if (width >= 700) {
                  crossAxisCount = 2;
                }

                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: childAspect,
                  ),
                  itemCount: funds.length,
                  itemBuilder: (context, index) {
                    final fund = funds[index];
                    return _buildInitiativeCard(context, fund);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(
    BuildContext context,
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Icon(icon, color: color, size: 24),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              value,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInitiativeCard(BuildContext context, Fund fund) {
    final double progress = (fund.amountRaised /
            (fund.goalAmount == 0 ? 1 : fund.goalAmount))
        .clamp(0, 1);

    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap:
            () => Navigator.of(context).pushNamed('/fund', arguments: fund.id),
        borderRadius: BorderRadius.circular(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
                child: Image.network(
                  fund.imageUrl,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[300],
                      child: const Icon(
                        Icons.image,
                        size: 50,
                        color: Colors.grey,
                      ),
                    );
                  },
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      fund.title,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Expanded(
                      child: Text(
                        fund.description,
                        style: Theme.of(
                          context,
                        ).textTheme.bodyMedium?.copyWith(color: Colors.black54),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 12),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: LinearProgressIndicator(
                        value: progress,
                        minHeight: 8,
                        backgroundColor: Colors.grey[300],
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          Colors.amber,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${fund.currencyCode} ${fund.amountRaised.toStringAsFixed(0)} raised of ${fund.currencyCode} ${fund.goalAmount.toStringAsFixed(0)}',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.black54,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed:
                            () => Navigator.of(
                              context,
                            ).pushNamed('/donate', arguments: fund.id),
                        icon: const Icon(Icons.favorite, size: 18),
                        label: const Text('Donate Now'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber,
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
