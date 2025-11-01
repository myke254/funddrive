class BankDetails {
  final String bankName;
  final String accountName;
  final String accountNumber;
  final String branch;
  final String? swiftCode;
  final String? branchCode;

  const BankDetails({
    required this.bankName,
    required this.accountName,
    required this.accountNumber,
    required this.branch,
    this.swiftCode,
    this.branchCode,
  });

  Map<String, dynamic> toJson() {
    return {
      'bankName': bankName,
      'accountName': accountName,
      'accountNumber': accountNumber,
      'branch': branch,
      'swiftCode': swiftCode,
      'branchCode': branchCode,
    };
  }

  factory BankDetails.fromJson(Map<String, dynamic> json) {
    return BankDetails(
      bankName: json['bankName'] as String,
      accountName: json['accountName'] as String,
      accountNumber: json['accountNumber'] as String,
      branch: json['branch'] as String,
      swiftCode: json['swiftCode'] as String?,
      branchCode: json['branchCode'] as String?,
    );
  }

  BankDetails copyWith({
    String? bankName,
    String? accountName,
    String? accountNumber,
    String? branch,
    String? swiftCode,
    String? branchCode,
  }) {
    return BankDetails(
      bankName: bankName ?? this.bankName,
      accountName: accountName ?? this.accountName,
      accountNumber: accountNumber ?? this.accountNumber,
      branch: branch ?? this.branch,
      swiftCode: swiftCode ?? this.swiftCode,
      branchCode: branchCode ?? this.branchCode,
    );
  }

  @override
  String toString() {
    return 'Bank: $bankName\n'
        'Account Name: $accountName\n'
        'Account Number: $accountNumber\n'
        'Branch: $branch'
        '${swiftCode != null ? '\nSWIFT Code: $swiftCode' : ''}'
        '${branchCode != null ? '\nBranch Code: $branchCode' : ''}';
  }
}

class Fund {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final String whatsappGroupLink;
  final BankDetails? bankDetails;
  final String currencyCode; // ISO code like USD, KES, EUR
  final double goalAmount;
  final double amountRaised;
  final bool isActive;
  final DateTime createdAt;
  final DateTime? updatedAt;

  const Fund({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.whatsappGroupLink,
    this.bankDetails,
    required this.currencyCode,
    required this.goalAmount,
    required this.amountRaised,
    required this.isActive,
    required this.createdAt,
    this.updatedAt,
  });

  Fund copyWith({
    String? id,
    String? title,
    String? description,
    String? imageUrl,
    String? whatsappGroupLink,
    BankDetails? bankDetails,
    String? currencyCode,
    double? goalAmount,
    double? amountRaised,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Fund(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      whatsappGroupLink: whatsappGroupLink ?? this.whatsappGroupLink,
      bankDetails: bankDetails ?? this.bankDetails,
      currencyCode: currencyCode ?? this.currencyCode,
      goalAmount: goalAmount ?? this.goalAmount,
      amountRaised: amountRaised ?? this.amountRaised,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  // JSON serialization methods
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'whatsappGroupLink': whatsappGroupLink,
      'bankDetails': bankDetails?.toJson(),
      'currencyCode': currencyCode,
      'goalAmount': goalAmount,
      'amountRaised': amountRaised,
      'isActive': isActive,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }

  factory Fund.fromJson(Map<String, dynamic> json) {
    return Fund(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String,
      whatsappGroupLink: json['whatsappGroupLink'] as String,
      bankDetails:
          json['bankDetails'] != null
              ? BankDetails.fromJson(
                json['bankDetails'] as Map<String, dynamic>,
              )
              : null,
      currencyCode: json['currencyCode'] as String,
      goalAmount: (json['goalAmount'] as num).toDouble(),
      amountRaised: (json['amountRaised'] as num).toDouble(),
      isActive: json['isActive'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt:
          json['updatedAt'] != null
              ? DateTime.parse(json['updatedAt'] as String)
              : null,
    );
  }

  // Helper getters
  double get progressPercentage =>
      goalAmount > 0 ? (amountRaised / goalAmount * 100) : 0;
  double get remainingAmount =>
      (goalAmount - amountRaised).clamp(0, double.infinity);
  bool get isFullyFunded => amountRaised >= goalAmount;
}
