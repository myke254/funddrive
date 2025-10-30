import 'package:flutter/material.dart';

import '../models/fund.dart';
import '../models/payment_method.dart';
import '../repository/fund_repository.dart';
import '../widgets/responsive_form.dart';
import '../widgets/app_footer.dart';

class DonateScreen extends StatefulWidget {
  const DonateScreen({super.key});

  @override
  State<DonateScreen> createState() => _DonateScreenState();
}

class _DonateScreenState extends State<DonateScreen> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  bool _showMore = false;
  final Set<PaymentMethod> _selected = <PaymentMethod>{PaymentMethod.mpesa};

  @override
  void dispose() {
    _amountController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String fundId = ModalRoute.of(context)!.settings.arguments as String;
    final Fund? fund = FundRepository.instance.getById(fundId);
    if (fund == null) {
      return const Scaffold(body: Center(child: Text('Fund not found')));
    }
    final String baseCurrency = fund.currencyCode;
    return Scaffold(
      bottomNavigationBar: const AppFooter(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 240,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Donate to ${fund.title}'),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(fund.imageUrl, fit: BoxFit.cover),
                  Container(color: Colors.black.withOpacity(0.4)),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Form(
                key: _formKey,
                child: ResponsiveForm(
                  maxWidth: 560,
                  children: [
                    Text(
                      fund.description,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Choose payment method',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    _PaymentChips(
                      selected: _selected,
                      onChanged:
                          (set) => setState(
                            () =>
                                _selected
                                  ..clear()
                                  ..addAll(set),
                          ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _amountController,
                      decoration: const InputDecoration(
                        labelText: 'Amount',
                        prefixIcon: Icon(Icons.attach_money),
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      validator:
                          (v) =>
                              (double.tryParse(v ?? '') ?? 0) <= 0
                                  ? 'Enter a valid amount'
                                  : null,
                    ),
                    const SizedBox(height: 8),
                    _ConvertedAmountPreview(
                      amountTextController: _amountController,
                      fundCurrency: baseCurrency,
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _nameController,
                            decoration: const InputDecoration(
                              labelText: 'Your Name (optional)',
                              prefixIcon: Icon(Icons.person_outline),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: TextFormField(
                            controller: _emailController,
                            decoration: const InputDecoration(
                              labelText: 'Email (optional)',
                              prefixIcon: Icon(Icons.email_outlined),
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton.icon(
                        onPressed: () => setState(() => _showMore = !_showMore),
                        icon: Icon(
                          _showMore ? Icons.expand_less : Icons.expand_more,
                        ),
                        label: Text(
                          _showMore ? 'Hide options' : 'More options',
                        ),
                      ),
                    ),
                    AnimatedCrossFade(
                      firstChild: const SizedBox.shrink(),
                      secondChild: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Donation options',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                '• Donate anonymously (leave name blank)',
                              ),
                            ],
                          ),
                        ),
                      ),
                      crossFadeState:
                          _showMore
                              ? CrossFadeState.showSecond
                              : CrossFadeState.showFirst,
                      duration: const Duration(milliseconds: 250),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 48,
                      child: FilledButton.icon(
                        onPressed: () {
                          if (!_formKey.currentState!.validate()) return;
                          if (_selected.isEmpty) return;
                          FundRepository.instance.addDonation(
                            fundId: fund.id,
                            amount: double.parse(_amountController.text.trim()),
                          );
                          Navigator.of(
                            context,
                          ).pushReplacementNamed('/fund', arguments: fund.id);
                        },
                        icon: const Icon(Icons.favorite_border),
                        label: const Text('Donate Now'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PaymentChips extends StatelessWidget {
  final Set<PaymentMethod> selected;
  final ValueChanged<Set<PaymentMethod>> onChanged;
  const _PaymentChips({required this.selected, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final methods = PaymentMethod.values;
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children:
          methods.map((m) {
            final isSelected = selected.contains(m);
            return FilterChip(
              selected: isSelected,
              onSelected: (_) {
                onChanged(<PaymentMethod>{m});
              },
              label: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(_iconFor(m), size: 18),
                  const SizedBox(width: 6),
                  Text(m.label),
                ],
              ),
            );
          }).toList(),
    );
  }

  IconData _iconFor(PaymentMethod method) {
    switch (method) {
      case PaymentMethod.paypal:
        return Icons.account_balance_wallet_outlined;
      case PaymentMethod.mpesa:
        return Icons.phone_android_outlined;
      case PaymentMethod.visa:
        return Icons.credit_card;
      case PaymentMethod.mastercard:
        return Icons.credit_card_rounded;
    }
  }
}

class _ConvertedAmountPreview extends StatefulWidget {
  final TextEditingController amountTextController;
  final String fundCurrency;
  const _ConvertedAmountPreview({
    required this.amountTextController,
    required this.fundCurrency,
  });

  @override
  State<_ConvertedAmountPreview> createState() =>
      _ConvertedAmountPreviewState();
}

class _ConvertedAmountPreviewState extends State<_ConvertedAmountPreview> {
  late String _localeCurrency;
  double? _convertedAmount;

  static const Map<String, double> _usdRates = <String, double>{
    'USD': 1.0,
    'KES': 130.0,
    'EUR': 0.92,
    'GBP': 0.78,
  };

  @override
  void initState() {
    super.initState();
    _localeCurrency = _inferLocaleCurrency();
    widget.amountTextController.addListener(_recompute);
    _recompute();
  }

  @override
  void dispose() {
    widget.amountTextController.removeListener(_recompute);
    super.dispose();
  }

  String _inferLocaleCurrency() {
    final locale = WidgetsBinding.instance.platformDispatcher.locale;
    final countryCode = locale.countryCode ?? 'US';
    switch (countryCode.toUpperCase()) {
      case 'KE':
        return 'KES';
      case 'GB':
        return 'GBP';
      case 'DE':
      case 'FR':
      case 'IT':
      case 'ES':
      case 'NL':
        return 'EUR';
      default:
        return 'USD';
    }
  }

  void _recompute() {
    final base = widget.fundCurrency.toUpperCase();
    final target = _localeCurrency.toUpperCase();
    final input = double.tryParse(widget.amountTextController.text.trim());
    if (input == null) {
      setState(() => _convertedAmount = null);
      return;
    }
    final toUsd = input / (_usdRates[base] ?? 1.0);
    final toTarget = toUsd * (_usdRates[target] ?? 1.0);
    setState(() => _convertedAmount = toTarget);
  }

  @override
  Widget build(BuildContext context) {
    if (_convertedAmount == null) return const SizedBox.shrink();
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        '~ ${_localeCurrency} ${_convertedAmount!.toStringAsFixed(2)} (approximate)',
        style: Theme.of(
          context,
        ).textTheme.bodySmall?.copyWith(color: Colors.black54),
      ),
    );
  }
}
