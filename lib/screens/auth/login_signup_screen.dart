import 'dart:math';
import 'package:flutter/material.dart';
import 'package:funddrive/widgets/base_scaffold.dart';
import 'package:funddrive/widgets/text_input_field.dart';

class LoginSignupScreen extends StatefulWidget {
  const LoginSignupScreen({super.key});

  @override
  State<LoginSignupScreen> createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen>
    with SingleTickerProviderStateMixin {
  bool showLogin = true;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleCard() {
    if (showLogin) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
    setState(() => showLogin = !showLogin);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return BaseScaffold(
      title: showLogin ? 'Login' : 'Sign Up',
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: size.height - size.height / 5),
          child: Center(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                final angle = _controller.value * pi;
                final isBack = angle > pi / 2;

                return Transform(
                  transform:
                      Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..rotateY(angle),
                  alignment: Alignment.center,
                  child:
                      isBack
                          ? Transform(
                            transform: Matrix4.identity()..rotateY(pi),
                            alignment: Alignment.center,
                            child: _buildSignupCard(theme),
                          )
                          : _buildLoginCard(theme),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  // Login card
  Widget _buildLoginCard(ThemeData theme) {
    return _authCard(
      theme,
      title: "Welcome Back!",
      subtitle: "Sign in to your account to continue",
      buttonText: "Login",
      onButtonPressed: () => Navigator.of(context).pushNamed('/home'),
      footerText: "Don't have an account? ",
      footerActionText: "Sign up",
      onFooterPressed: _toggleCard,
    );
  }

  // Signup card
  Widget _buildSignupCard(ThemeData theme) {
    return _authCard(
      theme,
      title: "Create Account",
      subtitle: "Join FundDrive today and start making an impact.",
      buttonText: "Sign Up",
      onButtonPressed: () => Navigator.of(context).pushNamed('/home'),
      footerText: "Already have an account? ",
      footerActionText: "Login",
      onFooterPressed: _toggleCard,
    );
  }

  // Shared card UI builder
  Widget _authCard(
    ThemeData theme, {
    required String title,
    required String subtitle,
    required String buttonText,
    required VoidCallback onButtonPressed,
    required String footerText,
    required String footerActionText,
    required VoidCallback onFooterPressed,
  }) {
    return Container(
      //height: 400,
      width: 450,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.canvasColor,
        border: Border.all(color: theme.dividerColor, width: .6),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Column(
              children: [
                Text(title, style: theme.textTheme.headlineMedium),
                const SizedBox(height: 8),
                Text(subtitle, style: theme.textTheme.bodyMedium),
              ],
            ),
          ),
          const SizedBox(height: 26),
          Text('Email', style: theme.textTheme.bodyMedium),
          const SizedBox(height: 8),
          TextInputField(),
          const SizedBox(height: 16),
          Text('Password', style: theme.textTheme.bodyMedium),
          const SizedBox(height: 8),
          TextInputField(obscureText: true),
          if (!showLogin)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                Text('Confirm Password', style: theme.textTheme.bodyMedium),
                const SizedBox(height: 8),
                TextInputField(obscureText: true),
              ],
            ),
          const SizedBox(height: 16),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: theme.primaryColor,
              foregroundColor: theme.canvasColor,
              minimumSize: const Size(double.infinity, 48),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: onButtonPressed,
            child: Text(
              buttonText,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.canvasColor,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(footerText),
              GestureDetector(
                onTap: onFooterPressed,
                child: Text(
                  footerActionText,
                  style: TextStyle(
                    color: theme.primaryColor,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
