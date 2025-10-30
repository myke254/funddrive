class Fund {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final String whatsappGroupId;
  final String bankDetails;
  final String currencyCode; // ISO code like USD, KES, EUR
  final double goalAmount;
  final double amountRaised;

  const Fund({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.whatsappGroupId,
    required this.bankDetails,
    required this.currencyCode,
    required this.goalAmount,
    required this.amountRaised,
  });

  Fund copyWith({
    String? id,
    String? title,
    String? description,
    String? imageUrl,
    String? whatsappGroupId,
    String? bankDetails,
    String? currencyCode,
    double? goalAmount,
    double? amountRaised,
  }) {
    return Fund(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      whatsappGroupId: whatsappGroupId ?? this.whatsappGroupId,
      bankDetails: bankDetails ?? this.bankDetails,
      currencyCode: currencyCode ?? this.currencyCode,
      goalAmount: goalAmount ?? this.goalAmount,
      amountRaised: amountRaised ?? this.amountRaised,
    );
  }
}
