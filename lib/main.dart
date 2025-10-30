import 'package:flutter/material.dart';
import 'screens/auth/login_signup_screen.dart';
import 'screens/auth/otp_screen.dart';
import 'screens/create_fund_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/donate_screen.dart';
import 'screens/fund_details_screen.dart';
import 'screens/home_screen.dart';
import 'services/theme/app_theme.dart';

void main() {
  runApp(const FundDriveApp());
}

class FundDriveApp extends StatelessWidget {
  const FundDriveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme().lightTheme,
      title: 'FundDrive',
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginSignupScreen(),
        '/otp': (context) => const OtpScreen(),
        '/create': (context) => const CreateFundScreen(),
        '/dashboard': (context) => const DashboardScreen(),
        '/home': (context) => const HomeScreen(),
        '/fund': (context) => const FundDetailsScreen(),
        '/donate': (context) => const DonateScreen(),
      },
    );
  }
}
