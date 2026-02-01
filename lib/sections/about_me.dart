
import 'package:flutter/material.dart';

import '../theme/app_constants.dart';
import '../theme/app_theme.dart';
import '../widgets/widgets.dart';

class AboutMeSection extends StatelessWidget {
  const AboutMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final mobile = isMobile(context);

    return Container(
      color: AppTheme.cardBackground,
      padding: EdgeInsets.symmetric(
        horizontal: mobile ? 24 : 80,
        vertical: mobile ? 60 : 80,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Column(
            children: [
              const SectionTitle(title: 'About', highlight: 'Me'),
              const SizedBox(height: 40),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppTheme.darkBackground,
                ),
                child: Column(
                  children: [
                    Text(
                      '''I'm a passionate mobile developer specializing in Flutter, with a keen eye for design and user experience. With 3+ years of experience, I transform ideas into polished, production-ready applications.

My approach combines technical excellence with creative problem-solving, ensuring every app I build is not just functional, but delightful to use.''',
                      // 'This portfolio website showcases what I care about and what I\'ve been doing in my life. Whether you\'re a potential client or a fellow developer, I hope you\'ll find something here that interests you.',
                      style: TextStyle(
                        fontSize: mobile ? 14 : 16,
                        color: AppTheme.textSecondary,
                        height: 1.8,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    // const SizedBox(height: 24),
                    // Text(
                    //   'My greatest satisfaction is being able to give life to ideas and seeing people be happy while using my created products and to reach as many people as I can with my created products.',
                    //   style: TextStyle(
                    //     fontSize: mobile ? 14 : 16,
                    //     color: AppTheme.textSecondary,
                    //     height: 1.8,
                    //   ),
                    //   textAlign: TextAlign.center,
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
