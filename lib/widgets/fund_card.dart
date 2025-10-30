import 'package:flutter/material.dart';

import '../models/fund.dart';

class FundCard extends StatefulWidget {
  final Fund fund;
  final VoidCallback? onTap;
  const FundCard({super.key, required this.fund, this.onTap});

  @override
  State<FundCard> createState() => _FundCardState();
}

class _FundCardState extends State<FundCard>
    with SingleTickerProviderStateMixin {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final fund = widget.fund;
    final double progress = (fund.amountRaised /
            (fund.goalAmount == 0 ? 1 : fund.goalAmount))
        .clamp(0, 1);
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedScale(
        duration: const Duration(milliseconds: 150),
        scale: _hovered ? 1.02 : 1.0,
        child: InkWell(
          onTap: widget.onTap,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.network(fund.imageUrl, fit: BoxFit.cover),
                ),
                Positioned.fill(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0.1),
                          Colors.black.withOpacity(0.55),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          fund.title,
                          style: Theme.of(
                            context,
                          ).textTheme.titleLarge?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          fund.description,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(color: Colors.white.withOpacity(0.92)),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: LinearProgressIndicator(
                                  value: progress,
                                  minHeight: 10,
                                  backgroundColor: Colors.white.withOpacity(
                                    0.25,
                                  ),
                                  color: Colors.tealAccent,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Text(
                              "${(progress * 100).toStringAsFixed(0)}%",
                              style: Theme.of(context).textTheme.labelLarge
                                  ?.copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Text(
                          "Raised ${fund.currencyCode} ${fund.amountRaised.toStringAsFixed(0)} / ${fund.currencyCode} ${fund.goalAmount.toStringAsFixed(0)}",
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
