# Usage Examples

## Basic Usage

### 1. Using DummyFunds Dart Class

```dart
import 'package:funddrive/data/dummy_funds.dart';
import 'package:funddrive/models/fund.dart';

void main() {
  // Get list of all funds
  List<Fund> funds = DummyFunds.getFunds();
  
  // Display funds
  for (Fund fund in funds) {
    print('${fund.title} - ${fund.currencyCode} ${fund.amountRaised}');
    print('Progress: ${fund.progressPercentage.toStringAsFixed(1)}%');
    print('Active: ${fund.isActive}');
    print('---');
  }
}
```

### 2. Using JSON File Directly

```dart
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:funddrive/models/fund.dart';

Future<void> loadFunds() async {
  // Load JSON from assets
  final String jsonString = 
    await rootBundle.loadString('data/dummy_funds.json');
  
  // Parse JSON
  final List<dynamic> jsonList = jsonDecode(jsonString);
  
  // Convert to Fund objects
  List<Fund> funds = jsonList
    .map((json) => Fund.fromJson(json))
    .toList();
  
  // Use the funds
  print('Loaded ${funds.length} funds');
}
```

### 3. Filtering and Querying

```dart
import 'package:funddrive/data/dummy_funds.dart';

void demonstrateFiltering() {
  List<Fund> allFunds = DummyFunds.getFunds();
  
  // Get only active funds
  List<Fund> activeFunds = allFunds.where((f) => f.isActive).toList();
  
  // Get fully funded initiatives
  List<Fund> completed = allFunds.where((f) => f.isFullyFunded).toList();
  
  // Get funds by currency
  List<Fund> kesFunds = allFunds.where((f) => f.currencyCode == 'KES').toList();
  
  // Sort by amount raised (descending)
  List<Fund> sortedByRaised = List.from(allFunds)
    ..sort((a, b) => b.amountRaised.compareTo(a.amountRaised));
  
  // Find specific fund by ID
  Fund? fund = allFunds.firstWhere(
    (f) => f.id == '550e8400-e29b-41d4-a716-446655440000',
    orElse: () => throw Exception('Fund not found'),
  );
}
```

### 4. Creating New Fund from JSON

```dart
import 'package:funddrive/models/fund.dart';

void createFundFromJson() {
  Map<String, dynamic> json = {
    'id': '550e8400-e29b-41d4-a716-446655440010',
    'title': 'New Fundraising Initiative',
    'description': 'Description here...',
    'imageUrl': 'https://example.com/image.jpg',
    'whatsappGroupLink': 'https://chat.whatsapp.com/ABCD1234',
    'bankDetails': 'Bank: Example Bank\nAccount: 123456',
    'currencyCode': 'KES',
    'goalAmount': 100000.0,
    'amountRaised': 0.0,
    'isActive': true,
    'createdAt': DateTime.now().toIso8601String(),
    'updatedAt': null,
  };
  
  Fund fund = Fund.fromJson(json);
  print(fund.title);
  print(fund.progressPercentage); // 0.0%
}
```

### 5. Converting Fund to JSON

```dart
import 'package:funddrive/data/dummy_funds.dart';
import 'dart:convert';

void convertToJson() {
  List<Fund> funds = DummyFunds.getFunds();
  
  // Convert all funds to JSON
  String jsonString = jsonEncode(
    funds.map((f) => f.toJson()).toList()
  );
  
  print(jsonString);
  
  // Convert single fund to JSON
  Fund firstFund = funds.first;
  Map<String, dynamic> json = firstFund.toJson();
  print(json);
}
```

### 6. Using Helper Properties

```dart
import 'package:funddrive/data/dummy_funds.dart';

void demonstrateHelpers() {
  Fund fund = DummyFunds.getFunds().first;
  
  // Get progress as percentage
  double progress = fund.progressPercentage;
  print('Progress: ${progress.toStringAsFixed(1)}%');
  
  // Get remaining amount
  double remaining = fund.remainingAmount;
  print('Remaining: ${fund.currencyCode} ${remaining}');
  
  // Check if fully funded
  if (fund.isFullyFunded) {
    print('Goal reached!');
  }
  
  // Get all active and incomplete funds
  List<Fund> inProgress = DummyFunds.getFunds()
    .where((f) => f.isActive && !f.isFullyFunded)
    .toList();
}
```

### 7. Updating Fund Data

```dart
import 'package:funddrive/data/dummy_funds.dart';

void updateFund() {
  Fund originalFund = DummyFunds.getFunds().first;
  
  // Create updated version
  Fund updatedFund = originalFund.copyWith(
    amountRaised: 300000.0,
    isActive: false,
    updatedAt: DateTime.now(),
  );
  
  // Convert to JSON
  Map<String, dynamic> json = updatedFund.toJson();
  
  // Send to API or save to database
}
```

## Integration with UI

### Using in a Flutter Widget

```dart
import 'package:flutter/material.dart';
import 'package:funddrive/data/dummy_funds.dart';
import 'package:funddrive/models/fund.dart';
import 'package:funddrive/widgets/fund_card.dart';

class FundsListScreen extends StatelessWidget {
  const FundsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Fund> funds = DummyFunds.getFunds()
      .where((f) => f.isActive)
      .toList();
    
    return ListView.builder(
      itemCount: funds.length,
      itemBuilder: (context, index) {
        Fund fund = funds[index];
        return FundCard(fund: fund);
      },
    );
  }
}
```

## Notes

- All amounts in the dummy data are in Kenya Shillings (KES) unless noted otherwise
- The dummy data includes both active and completed initiatives
- Images are sourced from Unsplash for demo purposes
- Bank details are fictional
- WhatsApp links are example links

