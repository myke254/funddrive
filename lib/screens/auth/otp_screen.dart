import 'package:flutter/material.dart';

import '../../widgets/responsive_form.dart';
import '../../widgets/page_background.dart';
import '../../widgets/elevated_center_card.dart';
import '../../widgets/base_scaffold.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _otpController = TextEditingController();

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: 'Verify OTP',
      body: PageBackground(
        child: Center(
          child: SingleChildScrollView(
            child: ElevatedCenterCard(
              maxWidth: 500,
              children: [
                Form(
                  key: _formKey,
                  child: ResponsiveForm(
                    maxWidth: 420,
                    padding: EdgeInsets.zero,
                    children: [
                      Text(
                        'We sent a code to your email',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Enter the 6-digit code to continue',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 24),
                      TextFormField(
                        controller: _otpController,
                        decoration: const InputDecoration(
                          labelText: 'OTP Code',
                          prefixIcon: Icon(Icons.verified_outlined),
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                        validator:
                            (v) =>
                                v == null || v.length != 6
                                    ? 'Enter 6 digits'
                                    : null,
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        height: 48,
                        child: FilledButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.of(
                                context,
                              ).pushReplacementNamed('/home');
                            }
                          },
                          child: const Text('Verify'),
                        ),
                      ),
                    ],
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
