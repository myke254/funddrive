import 'dart:convert';
import 'package:funddrive/models/fund.dart';

/// Dummy data for fundraising initiatives
class DummyFunds {
  /// Returns a list of sample Fund objects
  static List<Fund> getFunds() {
    return _fundsJson.map((json) => Fund.fromJson(json)).toList();
  }

  /// Returns the raw JSON data as a String
  static String getJsonString() {
    return jsonEncode(_fundsJson);
  }

  /// Returns the raw JSON data as a List of Maps
  static List<Map<String, dynamic>> getFundsJson() {
    return List<Map<String, dynamic>>.from(_fundsJson);
  }

  // Private static data
  static const List<Map<String, dynamic>> _fundsJson = [
    {
      "id": "550e8400-e29b-41d4-a716-446655440000",
      "title": "Education for Every Child",
      "description":
          "Help us provide essential school supplies, books, and educational resources to underprivileged children in rural communities. Your support can shape a brighter future for the next generation and break the cycle of poverty through education.",
      "imageUrl":
          "https://images.unsplash.com/photo-1503676260728-1c00da094a0b?w=800",
      "whatsappGroupLink": "https://chat.whatsapp.com/ABC123Education",
      "bankDetails": {
        "bankName": "Equity Bank",
        "accountName": "Education Initiative Fund",
        "accountNumber": "1234567890",
        "branch": "Nairobi Main",
        "swiftCode": "EQBLKENA",
        "branchCode": "001",
      },
      "currencyCode": "KES",
      "goalAmount": 500000.0,
      "amountRaised": 285000.0,
      "isActive": true,
      "createdAt": "2024-01-15T08:00:00Z",
      "updatedAt": "2024-02-10T14:30:00Z",
    },
    {
      "id": "550e8400-e29b-41d4-a716-446655440001",
      "title": "Clean Water Project",
      "description":
          "We are raising funds to build a deep-water well with modern filtration system in a remote village. This project will provide access to clean and safe drinking water for over 500 people, reducing waterborne diseases and improving overall community health.",
      "imageUrl":
          "https://images.unsplash.com/photo-1559827260-dc66d52bef19?w=800",
      "whatsappGroupLink": "https://chat.whatsapp.com/XYZ456Water",
      "bankDetails": {
        "bankName": "KCB Bank",
        "accountName": "Clean Water Initiative",
        "accountNumber": "9876543210",
        "branch": "Kisumu",
        "swiftCode": "KCBLKENA",
        "branchCode": "045",
      },
      "currencyCode": "KES",
      "goalAmount": 800000.0,
      "amountRaised": 620000.0,
      "isActive": true,
      "createdAt": "2023-12-01T10:00:00Z",
      "updatedAt": "2024-02-08T16:45:00Z",
    },
    {
      "id": "550e8400-e29b-41d4-a716-446655440002",
      "title": "Save Our Furry Friends",
      "description":
          "Our local animal shelter is at full capacity with over 200 rescued animals. Your donation will help us provide food, medical care, vaccinations, and a safe haven for homeless dogs and cats. We also need funds for spaying and neutering programs.",
      "imageUrl":
          "https://images.unsplash.com/photo-1552053831-71594a27632d?w=800",
      "whatsappGroupLink": "https://chat.whatsapp.com/DEF789Animals",
      "bankDetails": {
        "bankName": "Cooperative Bank",
        "accountName": "Animal Rescue Fund",
        "accountNumber": "1122334455",
        "branch": "Mombasa",
        "swiftCode": "COBAKENA",
        "branchCode": "110",
      },
      "currencyCode": "KES",
      "goalAmount": 350000.0,
      "amountRaised": 175000.0,
      "isActive": true,
      "createdAt": "2024-02-01T12:00:00Z",
      "updatedAt": "2024-02-12T09:20:00Z",
    },
    {
      "id": "550e8400-e29b-41d4-a716-446655440003",
      "title": "Community Library Initiative",
      "description":
          "Help us build and stock a modern community library that will serve as a learning hub for children and adults. The library will include books in multiple languages, computers with internet access, study spaces, and reading programs for all ages.",
      "imageUrl":
          "https://images.unsplash.com/photo-1519681393784-d120267933ba?w=800",
      "whatsappGroupLink": "https://chat.whatsapp.com/GHI012Library",
      "bankDetails": {
        "bankName": "NCBA Bank",
        "accountName": "Community Library Fund",
        "accountNumber": "5566778899",
        "branch": "Nakuru",
        "swiftCode": "NICBKENA",
        "branchCode": "180",
      },
      "currencyCode": "KES",
      "goalAmount": 1200000.0,
      "amountRaised": 460000.0,
      "isActive": true,
      "createdAt": "2023-11-20T09:00:00Z",
      "updatedAt": "2024-02-11T11:15:00Z",
    },
    {
      "id": "550e8400-e29b-41d4-a716-446655440004",
      "title": "Medical Clinic Equipment",
      "description":
          "Raise funds for essential medical equipment for our community health clinic. We need ultrasound machines, blood pressure monitors, laboratory equipment, and basic surgical instruments to provide better healthcare services to over 3000 community members.",
      "imageUrl":
          "https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?w=800",
      "whatsappGroupLink": "https://chat.whatsapp.com/JKL345Medical",
      "bankDetails": {
        "bankName": "Standard Chartered",
        "accountName": "Healthcare Equipment Fund",
        "accountNumber": "9988776655",
        "branch": "Eldoret",
        "swiftCode": "SCBLKENA",
        "branchCode": "064",
      },
      "currencyCode": "KES",
      "goalAmount": 2500000.0,
      "amountRaised": 880000.0,
      "isActive": true,
      "createdAt": "2024-01-05T07:00:00Z",
      "updatedAt": "2024-02-09T13:40:00Z",
    },
    {
      "id": "550e8400-e29b-41d4-a716-446655440005",
      "title": "Emergency Relief Fund",
      "description":
          "Urgent fund for families affected by recent floods in the region. Your donations will provide temporary shelter, food, clean water, medical supplies, and help rebuild homes for affected families.",
      "imageUrl":
          "https://images.unsplash.com/photo-1528127269322-539801943592?w=800",
      "whatsappGroupLink": "https://chat.whatsapp.com/MNO678Relief",
      "bankDetails": {
        "bankName": "Absa Bank",
        "accountName": "Emergency Relief",
        "accountNumber": "4433221100",
        "branch": "Thika",
        "swiftCode": "ABSAKENA",
        "branchCode": "120",
      },
      "currencyCode": "KES",
      "goalAmount": 1500000.0,
      "amountRaised": 1200000.0,
      "isActive": true,
      "createdAt": "2024-02-05T06:00:00Z",
      "updatedAt": "2024-02-13T10:00:00Z",
    },
    {
      "id": "550e8400-e29b-41d4-a716-446655440006",
      "title": "Women's Entrepreneurship Program",
      "description":
          "Support women entrepreneurs in starting and growing their businesses. Funds will provide startup capital, business training, mentorship, and access to markets for 50 women in rural communities.",
      "imageUrl":
          "https://images.unsplash.com/photo-1556761175-b413da4baf72?w=800",
      "whatsappGroupLink": "https://chat.whatsapp.com/PQR901Women",
      "bankDetails": {
        "bankName": "Equity Bank",
        "accountName": "Women Empowerment Fund",
        "accountNumber": "7788990011",
        "branch": "Meru",
        "swiftCode": "EQBLKENA",
        "branchCode": "145",
      },
      "currencyCode": "KES",
      "goalAmount": 750000.0,
      "amountRaised": 320000.0,
      "isActive": true,
      "createdAt": "2024-01-25T11:00:00Z",
      "updatedAt": "2024-02-07T15:30:00Z",
    },
    {
      "id": "550e8400-e29b-41d4-a716-446655440007",
      "title": "Youth Sports Development",
      "description":
          "Build a modern sports complex with football pitch, basketball court, and athletics track. This initiative will keep youth engaged in positive activities, promote health and fitness, and develop local sports talent.",
      "imageUrl":
          "https://images.unsplash.com/photo-1576810623523-e8f0c8c6c73c?w=800",
      "whatsappGroupLink": "https://chat.whatsapp.com/STU234Sports",
      "bankDetails": {
        "bankName": "Diamond Trust Bank",
        "accountName": "Youth Sports Fund",
        "accountNumber": "3344556677",
        "branch": "Kisii",
        "swiftCode": "DTBLEKENA",
        "branchCode": "060",
      },
      "currencyCode": "KES",
      "goalAmount": 3000000.0,
      "amountRaised": 950000.0,
      "isActive": true,
      "createdAt": "2023-10-15T08:30:00Z",
      "updatedAt": "2024-02-14T08:00:00Z",
    },
    {
      "id": "550e8400-e29b-41d4-a716-446655440008",
      "title": "Solar Power for Schools",
      "description":
          "Install solar panels and battery systems for 10 rural schools, providing reliable electricity for lighting, computers, and charging devices. This will enable evening classes and digital learning opportunities.",
      "imageUrl":
          "https://images.unsplash.com/photo-1509391366360-2e959784a276?w=800",
      "whatsappGroupLink": "https://chat.whatsapp.com/VWX567Solar",
      "bankDetails": {
        "bankName": "Stanbic Bank",
        "accountName": "Solar Education Fund",
        "accountNumber": "2211334455",
        "branch": "Kakamega",
        "swiftCode": "SBICKENX",
        "branchCode": "125",
      },
      "currencyCode": "KES",
      "goalAmount": 1800000.0,
      "amountRaised": 780000.0,
      "isActive": true,
      "createdAt": "2024-01-10T09:00:00Z",
      "updatedAt": "2024-02-12T14:20:00Z",
    },
    {
      "id": "550e8400-e29b-41d4-a716-446655440009",
      "title": "Completed: New Maternity Wing",
      "description":
          "Successfully funded and built a new maternity wing with 20 beds, modern delivery rooms, and neonatal care unit. The facility now serves over 100 mothers monthly.",
      "imageUrl":
          "https://images.unsplash.com/photo-1559757148-5c350d0d3c56?w=800",
      "whatsappGroupLink": "https://chat.whatsapp.com/YZA890Completed",
      "bankDetails": {
        "bankName": "I&M Bank",
        "accountName": "Maternity Wing Fund",
        "accountNumber": "8899001122",
        "branch": "Machakos",
        "swiftCode": "IMBLEKENA",
        "branchCode": "054",
      },
      "currencyCode": "KES",
      "goalAmount": 2000000.0,
      "amountRaised": 2100000.0,
      "isActive": false,
      "createdAt": "2023-06-01T10:00:00Z",
      "updatedAt": "2024-01-31T16:00:00Z",
    },
  ];
}
