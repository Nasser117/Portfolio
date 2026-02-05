// ignore_for_file: unnecessary_null_comparison
import 'package:flutter/material.dart';
import '../theme/app_constants.dart';
import '../theme/app_theme.dart';
import '../widgets/widgets.dart';

// =======================
// DATA SOURCES
// =======================
List<Map<String, dynamic>> _uxData() {
  return [
    {
      'title': 'Fix Me',
      'design_goal':
          'A pixel-perfect recreation of a modern swapping app interface, focusing on user experience and visual hierarchy.',
      'image': 'assets/images/fixme.png',
      'ux_decisions': [
        'Simplified navigation with bottom tab bar for quick access to core features',
        'Visual progress indicators using rings and charts for immediate feedback',
        'Gamification elements with achievements and streaks to maintain motivation',
      ],
      'learnings':
          'Understanding the balance between aesthetic appeal and functional clarity. User testing revealed that subtle animations improved perceived app responsiveness without compromising usability.',
      'figma_url': 'https://www.figma.com/design/8LaPU3d3tJNg1WUh1CbGAF/fix-me?node-id=0-1&t=SSfzsssk0S1r0lIU-1',
      'images': [
        'assets/images/me.png',
        'assets/images/solar.png',
        'assets/images/library.png',
      ],
    },
// 
//     {
//       'title': 'Jobly UX',
//       'design_goal':
//           'Redesigning job discovery flows to reduce cognitive load and improve application completion rate.',
//       'image': 'assets/images/jobly.png',
//       'ux_decisions': [
//         'Clear visual separation between browsing and applying',
//         'Progressive disclosure of job details',
//         'One-tap save and apply actions',
//       ],
//       'learnings':
//           'Users preferred fewer choices per screen. Reducing visible options improved task completion time significantly.',
//       'figma_url': null,
//       'images': ['assets/images/jobly.png', 'assets/images/library.png'],
//     },
// //   //  
//     {
//       'title': 'Fix Me',
//       'design_goal':
//           'A pixel-perfect recreation of a modern swapping app interface, focusing on user experience and visual hierarchy.',
//       'image': 'assets/images/fixme.png',
//       'ux_decisions': [
//         'Simplified navigation with bottom tab bar for quick access to core features',
//         'Visual progress indicators using rings and charts for immediate feedback',
//         'Gamification elements with achievements and streaks to maintain motivation',
//       ],
//       'learnings':
//           'Understanding the balance between aesthetic appeal and functional clarity. User testing revealed that subtle animations improved perceived app responsiveness without compromising usability.',
//       'figma_url': 'https://www.figma.com/file/xxxxx',
//       'images': [
//         'assets/images/me.png',
//         'assets/images/solar.png',
//         'assets/images/library.png',
//       ],
//     },
// //   //  
//     {
//       'title': 'Jobly UX',
//       'design_goal':
//           'Redesigning job discovery flows to reduce cognitive load and improve application completion rate.',
//       'image': 'assets/images/jobly.png',
//       'ux_decisions': [
//         'Clear visual separation between browsing and applying',
//         'Progressive disclosure of job details',
//         'One-tap save and apply actions',
//       ],
//       'learnings':
//           'Users preferred fewer choices per screen. Reducing visible options improved task completion time significantly.',
//       'figma_url': null,
//       'images': ['assets/images/jobly.png', 'assets/images/library.png'],
//     },
// // //  
  ];
}

class UIUXSection extends StatelessWidget {
  const UIUXSection({super.key});

  @override
  Widget build(BuildContext context) {
    final mobile = isMobile(context);

    return holderContainer(
      mobile: mobile,
      horizontalMobilePadding: AppConstants.spacingM,
      horizontalDesktopPadding: AppConstants.spacingS,
      verticalMobilePadding: 80,
      verticalDesktopPadding: AppConstants.spacingXxl,
      title: 'UI/UX',
      highlight: 'Design Work',
      sizedBox01Height: AppConstants.spacingS,
      catchphrase: 'Exploring user-centered design principles',
      sizedBox02Height: AppConstants.spacingXl,
      body: _uxLayout(context),
    );
  }

  Widget _uxLayout(BuildContext context) {
    final projects = _uxData();
    const double maxLayoutWidth = AppConstants.desktopBreakpoint;
    const double spacing = AppConstants.spacingM;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppConstants.spacingXs),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: maxLayoutWidth),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final width = constraints.maxWidth;
                final bool twoColumns = width >= 750;

                final double cardWidth =
                    twoColumns
                        ? (width - spacing) /
                            2 // 👈 THIS is the key
                        : width;

                return Wrap(
                  spacing: spacing,
                  runSpacing: spacing,
                  children:
                      projects.map((project) {
                        return SizedBox(
                          width: cardWidth,
                          child: _uxCard(
                            context,
                            project,
                            isMobile(context),
                            twoColumns,
                          ),
                        );
                      }).toList(),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _uxCard(
    BuildContext context,
    Map<String, dynamic> data,
    bool mobile,
    isTwoColumns,
  ) {
    final figmaUrl = data['figma_url'] as String?;
    final images = List<String>.from(data['images']);

    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppConstants.circularL),
        child: Column(
          children: [
            // IMAGE
            Container(
              height: 300,
              width: double.infinity,
              color: AppTheme.darkBackground,
              child: Image.asset(data['image'], fit: BoxFit.cover),
            ),
            // INFO
            Container(
              decoration: BoxDecoration(
                color: AppTheme.cardBackground,

                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(AppConstants.circularL),
                  bottomLeft: Radius.circular(AppConstants.circularL),
                ),
              ),
              width: double.infinity,
              padding: EdgeInsets.all(mobile ? AppConstants.spacingS : AppConstants.spacingL),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // TITLE
                  Text(
                    data['title'],
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.textPrimary,
                    ),
                  ),

                  if (!mobile) const SizedBox(height: AppConstants.spacingS),

                  // DESIGN GOAL
                  _buildSection(
                    title: 'Design Goal:',
                    body: data['design_goal'],
                    mobile: mobile,
                  ),

                  // UX DECISIONS
                  Container(
                    margin: const EdgeInsets.only(top: AppConstants.spacingS),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppTheme.darkBackground,
                      borderRadius: BorderRadius.circular(AppConstants.circularS),
                    ),
                    child: _buildSection(
                      title: 'Key UX Decisions:',
                      child: _buildSkillCard(
                        mobile: mobile,
                        skills: List<String>.from(data['ux_decisions']),
                      ),
                      mobile: mobile,
                    ),
                  ),

                  // LEARNINGS
                  Container(
                    margin: const EdgeInsets.only(top: AppConstants.spacingS),
                    padding: const EdgeInsets.all(AppConstants.circularM),
                    decoration: BoxDecoration(
                      color: AppTheme.darkBackground,
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(AppConstants.circularS),
                        topRight: const Radius.circular(AppConstants.circularS),
                        bottomLeft: Radius.circular(mobile ? 0 : AppConstants.circularS),
                        bottomRight: Radius.circular(mobile ? 0 : AppConstants.circularS),
                      ),
                    ),
                    child: _buildSection(
                      title: 'Learnings:',
                      body: data['learnings'],
                      mobile: mobile,
                    ),
                  ),

                  if (!mobile) const SizedBox(height: AppConstants.spacingS),

                  // ACTIONS
                  mobile
                      ? Column(
                        children: [
                          Container(
                            width: double.infinity,
                            color: AppTheme.darkBackground,
                            child: _figmaButton(context, figmaUrl, images),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: _galleryButton(context, images),
                          ),
                        ],
                      )
                      : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _figmaButton(context, figmaUrl, images),
                          _galleryButton(context, images),
                        ],
                      ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _figmaButton(
    BuildContext context,
    String? figmaUrl,
    List<String> images,
  ) {
    final isReady = figmaUrl != null;

    return ElevatedButton.icon(
      onPressed:
          isReady
              ? () => openUrlExternal(figmaUrl)
              : () => showDialog(
                context: context,
                builder: (_) => _projectImagesGalleryDialog(context, images),
              ),
      style: ElevatedButton.styleFrom(
        backgroundColor: isReady ? AppTheme.accentYellow : Colors.grey,
        foregroundColor: Colors.black,
      ),
      icon: Image.asset("assets/icons/figma.png", width: 24),
      label: Text(isReady ? 'View on Figma' : 'In Progress'),
    );
  }

  Widget _galleryButton(BuildContext context, List<String> images) {
    return TextButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (_) => _projectImagesGalleryDialog(context, images),
        );
      },
      child: const Text(
        'View Images',
        style: TextStyle(color: AppTheme.primaryCyan),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    String? body,
    Widget? child,
    required bool mobile,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: AppConstants.spacingS),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: mobile ? 14 : 16,
              color: AppTheme.primaryCyan,
            ),
          ),
          const SizedBox(height: AppConstants.spacingXs),
          if (body != null)
            Text(
              body,
              style: TextStyle(
                fontSize: mobile ? 13 : 15,
                color: AppTheme.textSecondary,
                height: 1.6,
              ),
            ),
          if (child != null) child,
        ],
      ),
    );
  }

  Widget _buildSkillCard({required List<String> skills, required bool mobile}) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(AppConstants.circularM)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Skills list
          ...skills.map(
            (skill) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '• ',
                    style: TextStyle(
                      fontSize: mobile ? 13 : 15,
                      color: AppTheme.primaryCyan,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      skill,
                      softWrap: true,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: mobile ? 13 : 15,
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

  Widget _projectImagesGalleryDialog(context, images) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Center(
        
        child: SizedBox(
          width: AppConstants.tabletBreakpoint,
          child: Stack(
            children: [
              ImageGallery(images: images),
              // Close button
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: const Icon(Icons.close, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
