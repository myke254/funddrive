import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:funddrive/widgets/base_scaffold.dart';
import 'package:dotted_border/dotted_border.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return BaseScaffold(
      title: '',
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height / 1.7,
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: DottedBorder(
                options: RoundedRectDottedBorderOptions(
                  radius: Radius.circular(10),
                  dashPattern: [10, 5],
                  strokeWidth: 2,
                  color: theme.dividerColor,
                  padding: EdgeInsets.all(0),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: theme.canvasColor,
                  ),
                  width: size.width / 1.8,

                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                      child: SizedBox(
                        width: size.width / 3,
                        height: size.height / 1.5,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/party-popper.svg',
                              height: 80,
                              width: 80,
                              colorFilter: ColorFilter.mode(
                                theme.primaryColor,
                                BlendMode.srcIn,
                              ),
                            ),
                            const SizedBox(height: 16),

                            Text(
                              'Welcome to your Dashboard!',
                              style: theme.textTheme.headlineMedium,
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              'You\'re all set to start making a difference. Let\'s launch your first fundraising initiative.',
                              textAlign: TextAlign.center,
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
                              onPressed:
                                  () => Navigator.of(
                                    context,
                                  ).pushNamed('/create'),
                              child: Text(
                                'Create Your First Initiative',
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: theme.canvasColor,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
