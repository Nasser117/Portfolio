import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_v_1_0/theme/app_constants.dart';
import '../theme/app_theme.dart';
import '../widgets/widgets.dart';

// =======================
// DATA SOURCES
// =======================
final List<Map<String, dynamic>> skillsData = [
  {
    'icon': Icons.code,
    'title': 'Languages',
    'skills': ['Dart', 'Java', 'Python'],
  },
  {
    'icon': FontAwesomeIcons.mobileScreen,
    'title': 'Frameworks',
    'skills': ['Flutter'],
  },
  {
    'icon': FontAwesomeIcons.wrench,
    'title': 'Tools',
    'skills': ['Figma', 'GitHub', 'Draw IO'],
  },
  {
    'icon': FontAwesomeIcons.lightbulb,
    'title': 'Strengths',
    'skills': [
      'Mobile Architecture',
      'Clean UI Implementation',
      'UX-Oriented Development',
    ],
  },
];

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final mobile = isMobile(context);

    return holderContainer(
      horizontalMobilePadding: 24,
      horizontalDesktopPadding: 32,
      verticalMobilePadding: 80,
      verticalDesktopPadding: 60,
      sizedBox01Height: 60,
      mobile: mobile,
      title: 'Skills',
      highlight: '& Tools',
      body: _skillsLayout(context),
    );
  }

  Widget _skillsLayout(BuildContext context) {
    final mobile = isMobile(context);
    final screenWidth = MediaQuery.of(context).size.width;

    final skillCards =
        skillsData
            .map(
              (data) => _buildSkillCard(
                icon: data['icon'],
                title: data['title'],
                skills: List<String>.from(data['skills']),
                isMobile: mobile,
              ),
            )
            .toList();
    int crossAxisCount;
    double? mainAxisExtent;

    if (screenWidth < 400) {
      crossAxisCount = 1;
      mainAxisExtent = 165; // 👈 let content define height
    } else if (screenWidth < 550) {
      crossAxisCount = 2;
      mainAxisExtent = 165;
    } else if (screenWidth < 700) {
      crossAxisCount = 2;
      mainAxisExtent = 220;
    } else if (screenWidth < 1000) {
      crossAxisCount = 3;
      mainAxisExtent = 260;
    } else {
      crossAxisCount = 4;
      mainAxisExtent = 220;
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: skillCards.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: 32,
        crossAxisSpacing: 32,
        mainAxisExtent: mainAxisExtent,
      ),
      itemBuilder: (context, index) => skillCards[index],
    );
  }

  Widget _buildSkillCard({
    required IconData icon,
    required String title,
    required List<String> skills,
    required bool isMobile,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.cardBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.cardBackground, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isMobile
              ? Row(
                children: [
                  Icon(icon, color: AppTheme.primaryCyan, size: 24),
                  const SizedBox(width: 16),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.textPrimary,
                    ),
                  ),
                ],
              )
              : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 3, 46, 80),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(icon, color: AppTheme.primaryCyan, size: 24),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.textPrimary,
                    ),
                  ),
                ],
              ),

          const SizedBox(height: 8),

          if (isMobile)
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children:
                  skills
                      .map(
                        (skill) => Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: AppTheme.primaryCyan.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            skill,
                            style: const TextStyle(
                              fontSize: 12,
                              color: AppTheme.textSecondary,
                            ),
                          ),
                        ),
                      )
                      .toList(),
            )
          else
            ...skills.map(
              (skill) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '• ',
                      style: TextStyle(
                        fontSize: 13,
                        color: AppTheme.primaryCyan,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        skill,
                        style: const TextStyle(
                          fontSize: 13,
                          color: AppTheme.textSecondary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
