import 'package:flutter/material.dart';
import '../data/data.dart';
import '../theme/app_constants.dart';
import '../theme/app_theme.dart';
import '../widgets/widgets.dart';


class AboutMeSection extends StatelessWidget {
  const AboutMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final mobile = isMobile(context);

    return holderContainer(
      color: AppTheme.cardBackground,
      horizontalMobilePadding: 48,
      horizontalDesktopPadding: 120,
      verticalMobilePadding: 60,
      verticalDesktopPadding: 80,
      sizedBox01Height: 40,
      mobile: mobile,
      title: 'About',
      highlight: 'Me',
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: AppConstants.spacingL, vertical: AppConstants.spacingL),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppConstants.circularL),
          color: AppTheme.darkBackground,
        ),
        child: Text(
          aboutMeData['description'],
          style: TextStyle(
            fontSize: mobile ? 14 : 16,
            color: AppTheme.textSecondary,
            height: 1.8,
          ),
          textAlign: TextAlign.start,
        ),
      ),
    );
  }
}
