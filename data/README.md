# Fundraising Initiative Dummy Data

This directory contains dummy data for fundraising initiatives in both JSON and Dart formats.

## Files

- **`dummy_funds.json`**: Raw JSON file containing 10 sample fundraising initiatives
- **`dummy_funds.dart`**: Dart class with helper methods to access the dummy data

## Data Structure

Each fundraising initiative includes the following fields:

| Field | Type | Description |
|-------|------|-------------|
| `id` | String | Unique identifier (UUID) |
| `title` | String | Name of the fundraising initiative |
| `description` | String | Detailed description of the cause |
| `imageUrl` | String | URL to the cover image |
| `whatsappGroupLink` | String | Link to WhatsApp group for the initiative |
| `bankDetails` | BankDetails? | Optional structured bank account details |
| `currencyCode` | String | Currency ISO code (e.g., KES, USD, EUR) |
| `goalAmount` | Double | Target fundraising amount |
| `amountRaised` | Double | Total amount raised so far |
| `isActive` | Boolean | Whether the initiative is currently active |
| `createdAt` | DateTime | When the initiative was created (ISO 8601) |
| `updatedAt` | DateTime? | Optional last update timestamp (ISO 8601) |

### BankDetails Structure

The `bankDetails` field is an optional structured object containing:

| Field | Type | Description |
|-------|------|-------------|
| `bankName` | String | Name of the bank |
| `accountName` | String | Name on the account |
| `accountNumber` | String | Bank account number |
| `branch` | String | Branch location |
| `swiftCode` | String? | Optional SWIFT code |
| `branchCode` | String? | Optional branch code |

## Usage

### Using the Dart class:

```dart
import 'package:funddrive/data/dummy_funds.dart';

// Get list of Fund objects
List<Fund> funds = DummyFunds.getFunds();

// Get JSON string
String jsonString = DummyFunds.getJsonString();

// Get raw JSON maps
List<Map<String, dynamic>> jsonData = DummyFunds.getFundsJson();

// Access bank details
BankDetails? bankDetails = funds.first.bankDetails;
if (bankDetails != null) {
  print('Bank: ${bankDetails.bankName}');
  print('Account: ${bankDetails.accountNumber}');
  print(bankDetails.toString()); // Formatted string output
}
```

### Reading from JSON file:

```dart
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:funddrive/models/fund.dart';

Future<List<Fund>> loadFundsFromJson() async {
  final String jsonString = 
    await rootBundle.loadString('data/dummy_funds.json');
  final List<dynamic> jsonList = jsonDecode(jsonString);
  return jsonList.map((json) => Fund.fromJson(json)).toList();
}
```

## Sample JSON

Example of a fund with structured bank details:

```json
{
  "id": "550e8400-e29b-41d4-a716-446655440000",
  "title": "Education for Every Child",
  "description": "Help us provide essential school supplies...",
  "imageUrl": "https://images.unsplash.com/...",
  "whatsappGroupLink": "https://chat.whatsapp.com/ABC123Education",
  "bankDetails": {
    "bankName": "Equity Bank",
    "accountName": "Education Initiative Fund",
    "accountNumber": "1234567890",
    "branch": "Nairobi Main",
    "swiftCode": "EQBLKENA",
    "branchCode": "001"
  },
  "currencyCode": "KES",
  "goalAmount": 500000.0,
  "amountRaised": 285000.0,
  "isActive": true,
  "createdAt": "2024-01-15T08:00:00Z",
  "updatedAt": "2024-02-10T14:30:00Z"
}
```

## Additional Properties

The `Fund` model also includes helpful computed properties:

- `progressPercentage`: Percentage of goal achieved
- `remainingAmount`: Amount still needed to reach goal
- `isFullyFunded`: Whether the goal has been met

## Sample Initiatives

The dummy data includes 10 diverse fundraising initiatives:

1. Education for Every Child - 57% funded
2. Clean Water Project - 77.5% funded
3. Save Our Furry Friends - 50% funded
4. Community Library Initiative - 38% funded
5. Medical Clinic Equipment - 35.2% funded
6. Emergency Relief Fund - 80% funded
7. Women's Entrepreneurship Program - 42.7% funded
8. Youth Sports Development - 31.7% funded
9. Solar Power for Schools - 43.3% funded
10. Completed: New Maternity Wing - 105% funded (inactive)

All amounts are in Kenyan Shillings (KES).

