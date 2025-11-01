import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:funddrive/screens/dashboard/widgets/create_initiative_button.dart';

class WelcomeDashboard extends StatelessWidget {
  const WelcomeDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return ConstrainedBox(
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
                        CreateInitiativeButton(
                          buttonText: 'Create Your First Initiative',
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
    );
  }
}
