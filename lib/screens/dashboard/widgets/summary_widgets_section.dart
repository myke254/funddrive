import 'package:flutter/material.dart';
import 'package:funddrive/repository/fund_repository.dart';
import 'package:funddrive/screens/dashboard/widgets/dashboard_summary_widget.dart';

class SummaryWidgetsSection extends StatelessWidget {
  const SummaryWidgetsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final funds = FundRepository.instance.getFunds();
    return Wrap(
      alignment: WrapAlignment.spaceBetween,
      spacing: 12,
      runSpacing: 12,
      children: [
        DashboardSummaryWidget(
          title: 'Total Raised',
          content:
              '\$${funds.fold(0.0, (sum, fund) => sum + fund.amountRaised) > 1000 ? '${(funds.fold(0.0, (sum, fund) => sum + fund.amountRaised) / 1000).round()}K' : funds.fold(0.0, (sum, fund) => sum + fund.amountRaised)}',
          icon: Icons.trending_up,
        ),
        DashboardSummaryWidget(
          title: 'Active Initiatives',
          content: funds.length.toString(),
          icon: Icons.circle,
        ),
        DashboardSummaryWidget(
          title: 'Overall Goal',
          content:
              '\$${funds.fold(0.0, (sum, fund) => sum + fund.goalAmount) > 1000 ? '${(funds.fold(0.0, (sum, fund) => sum + fund.goalAmount) / 1000).round()}K' : funds.fold(0.0, (sum, fund) => sum + fund.goalAmount)}',
          icon: Icons.golf_course_outlined,
        ),
      ],
    );
  }
}
