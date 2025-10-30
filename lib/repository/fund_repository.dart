import 'package:uuid/uuid.dart';

import '../models/fund.dart';

class FundRepository {
  FundRepository._();
  static final FundRepository instance = FundRepository._();

  final List<Fund> _funds = <Fund>[
    Fund(
      id: const Uuid().v4(),
      title: 'Education for Every Child',
      description:
          'Help us provide essential school supplies and books to underprivileged children. Your support can shape a brighter future for the next generation.',
      imageUrl: 'https://images.unsplash.com/photo-1503676260728-1c00da094a0b',
      whatsappGroupId: 'invite-xyz',
      bankDetails: 'Bank: ABC Bank\nAcc: 1234567890',
      currencyCode: 'USD',
      goalAmount: 5000,
      amountRaised: 2850,
    ),
    Fund(
      id: const Uuid().v4(),
      title: 'Clean Water Project',
      description:
          'We are raising funds to build a well in a remote village, providing access to clean and safe drinking water for over 500 people.',
      imageUrl: 'https://images.unsplash.com/photo-1559827260-dc66d52bef19',
      whatsappGroupId: 'invite-abc',
      bankDetails: 'Bank: XYZ Bank\nAcc: 9876543210',
      currencyCode: 'USD',
      goalAmount: 8000,
      amountRaised: 6200,
    ),
    Fund(
      id: const Uuid().v4(),
      title: 'Save Our Furry Friends',
      description:
          'Our local animal shelter is at full capacity. Your donation will help us provide food, medical care, and a safe haven for homeless animals.',
      imageUrl: 'https://images.unsplash.com/photo-1552053831-71594a27632d',
      whatsappGroupId: 'invite-def',
      bankDetails: 'Bank: DEF Bank\nAcc: 1122334455',
      currencyCode: 'USD',
      goalAmount: 10000,
      amountRaised: 4500,
    ),
    Fund(
      id: const Uuid().v4(),
      title: 'Community Library',
      description: 'Help us build a local library for our kids.',
      imageUrl: 'https://images.unsplash.com/photo-1519681393784-d120267933ba',
      whatsappGroupId: 'invite-ghi',
      bankDetails: 'Bank: GHI Bank\nAcc: 5566778899',
      currencyCode: 'USD',
      goalAmount: 5000,
      amountRaised: 2300,
    ),
    Fund(
      id: const Uuid().v4(),
      title: 'Clinic Equipment',
      description: 'Raise funds for essential clinic equipment.',
      imageUrl: 'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b',
      whatsappGroupId: 'invite-jkl',
      bankDetails: 'Bank: JKL Bank\nAcc: 9988776655',
      currencyCode: 'KES',
      goalAmount: 12000,
      amountRaised: 8800,
    ),
  ];

  List<Fund> getFunds() => List<Fund>.unmodifiable(_funds);

  Fund? getById(String id) {
    try {
      return _funds.firstWhere((f) => f.id == id);
    } catch (_) {
      return null;
    }
  }

  Fund createFund({
    required String title,
    required String description,
    required String imageUrl,
    required String whatsappGroupId,
    required String bankDetails,
    required String currencyCode,
    required double goalAmount,
  }) {
    final fund = Fund(
      id: const Uuid().v4(),
      title: title,
      description: description,
      imageUrl: imageUrl,
      whatsappGroupId: whatsappGroupId,
      bankDetails: bankDetails,
      currencyCode: currencyCode,
      goalAmount: goalAmount,
      amountRaised: 0,
    );
    _funds.add(fund);
    return fund;
  }

  void addDonation({required String fundId, required double amount}) {
    final index = _funds.indexWhere((f) => f.id == fundId);
    if (index == -1) return;
    final f = _funds[index];
    _funds[index] = f.copyWith(
      amountRaised: (f.amountRaised + amount).clamp(0, f.goalAmount),
    );
  }
}
