import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../theme/app_constants.dart';
import '../theme/app_theme.dart';
import '../widgets/widgets.dart';

// =======================
// DATA SOURCES
// =======================
List<Map<String, dynamic>> _projectsData() {
  return [
    // library
    {
      'title': 'Tecno Library',
      'catchphrase': 'Your books. Organized. Everywhere.',
      'description':
          'A comprehensive digital library platform designed to help users catalog, search, and manage their book collections with seamless cloud sync.',
      'role': 'UI/UX Design, Mobile Developer',
      'color': const Color.fromARGB(255, 146, 0, 0),
      'image': 'assets/images/library.png',
      'images': [
        'assets/tecno_library/11.png',
        'assets/tecno_library/12.png',
        'assets/tecno_library/13.png',
        'assets/tecno_library/14.png',
        'assets/tecno_library/15.png',
        'assets/tecno_library/16.png',
        // 'assets/tecno_library/7.jpg',
        // 'assets/tecno_library/8.jpg',
        'assets/tecno_library/9.jpg',
        'assets/tecno_library/10.jpg',
      ],
      'githubUrl': 'https://github.com/Nasser117/Techno-Library',
      'demoUrl': null,
      'techStack': ['Flutter', 'Firebase', 'Laravel'],
      'problem': [
        'Scattered physical books',
        'No centralized catalog',
        'Difficult search and tracking',
      ],
      'solution':
          'Build a digital library that allows users to catalog, search, and manage books efficiently.',
      'challenges': [
        'State management',
        'Data synchronization',
        'Book catagorization',
      ],
      'learnings': [
        'REST API integration',
        'Theme persistancy',
        'Scalable UI design',
      ],
      'keyFeatures': ['Book cataloging', 'Advanced search', 'Book Lists'],
      'technicalDecisions': [
        'Dual Apps vs Roles',
        'Bloc vs Getx',
        'Clean architecture',
      ],
    },
    // fix me
    {
      'title': 'Fix Me',
      'catchphrase': 'Turn habits into progress.',
      'description':
          'A personal productivity and habit tracking app that utilizes visual analytics and streak systems to help users build lasting daily routines.',
      'role': 'UI/UX Design, Mobile Developer',
      'color': const Color.fromARGB(255, 255, 139, 7),
      'image': 'assets/images/fixme.png',
      'images': [
        'assets/images/fixme.png',
      ],
      'githubUrl': null,
      'demoUrl': null,
      'techStack': ['Flutter', 'Cubit', 'Sqlite'],
      'problem': [
        'No progress tracking',
        'No visual motivation',
        'Lack of structure',
      ],
      'solution':
          'Create a habit-based productivity app with visual analytics and streak tracking.',
      'challenges': ['State management', 'Local persistence', 'UX clarity'],
      'learnings': [
        'BLoC architecture',
        'UX-driven planning',
        'Scalable structure',
      ],
      'keyFeatures': [
        'Monthly progress tracking',
        'Visual analytics',
        'Habit streak system',
      ],
      'technicalDecisions': [
        'Sqlite for local storage',
        'BLoC for scalability',
        'Modular UI design',
      ],
    },
    // jobly
    {
      'title': 'Jobly',
      'catchphrase': 'Connecting talent with opportunity.',
      'description':
          'A streamlined job search platform designed to bridge the gap between recruiters and seekers with a focus on speed and local offline access.',
      'role': 'UI/UX Design, Mobile Developer',
      'color': AppTheme.accentPurple,
      'image': 'assets/images/jobly.png',
      'images': [
        'assets/jobly/26.png',
        'assets/jobly/27.png',
        'assets/jobly/28.png',
        'assets/jobly/29.png',
        'assets/jobly/30.png',
        'assets/jobly/31.png',
        'assets/jobly/32.png',
        'assets/jobly/33.png',
        'assets/jobly/34.png',
        'assets/jobly/35.png',
        'assets/jobly/36.png',
        'assets/jobly/37.png',
        'assets/jobly/38.png',
        'assets/jobly/39.png',
        'assets/jobly/40.png',
        'assets/jobly/41.png',
        'assets/jobly/42.png',
        'assets/jobly/43.png',
        'assets/jobly/44.png',
        'assets/jobly/45.png',
        'assets/jobly/46.png',
        'assets/jobly/47.png',
        'assets/jobly/25.jpg',
      ],
      'githubUrl': 'https://github.com/Nasser117/Jobly',
      'demoUrl': null,
      'techStack': ['Flutter', 'React', 'Laravel'],
      'problem': [
        'Fragmented job listings',
        'Difficult application tracking',
        'Poor offline accessibility',
      ],
      'solution':
          'Develop a robust mobile application with local caching for seamless browsing and an intuitive application management system.',
      'challenges': [
        'Complex relational data modeling',
        'Handling asynchronous job feeds',
        'Maintaining app performance with large datasets',
      ],
      'learnings': [
        'Advanced BLoC state management',
        'SQLite database optimization',
        'User-centric job filtering logic',
      ],
      'keyFeatures': [
        'Offline job saving',
        'Advanced category filtering',
        'Application status tracker',
      ],
      'technicalDecisions': [
        'SQLite for persistent offline access',
        'BLoC for predictable state transitions',
        'Modular repository pattern',
      ],
    },
    // tayar
    {
      'title': 'Tayar Shop',
      'catchphrase': 'E-commerce, simplified.',
      'description':
          'A modern e-commerce platform offering a smooth shopping experience with integrated payment gateways and real-time order tracking systems.',
      'role': 'UI/UX Design, Mobile Developer',
      'color': const Color.from(alpha: 1, red: 0, green: 1, blue: 0.898),
      'image': 'assets/images/solar.png',
      'images': [
        'assets/tayar/user/15.png',
        'assets/tayar/user/16.png',
        'assets/tayar/user/17.png',
        'assets/tayar/user/18.png',
        'assets/tayar/user/19.png',
        'assets/tayar/user/20.png',
        'assets/tayar/user/21.png',
        'assets/tayar/user/22.png',
        'assets/tayar/user/23.png',
        'assets/tayar/user/24.png',
        'assets/tayar/user/25.png',
        'assets/tayar/user/26.png',
        'assets/tayar/user/27.png',
        'assets/tayar/user/28.png',
        'assets/tayar/worker/20.png',
        'assets/tayar/worker/21.png',
        'assets/tayar/worker/22.png',
        'assets/tayar/worker/23.png',
        'assets/tayar/worker/24.png',
      ],
      'githubUrl': 'https://github.com/Nasser117/Tayar-user',
      'demoUrl': null,
      'techStack': ['Flutter', 'React', 'Laravel'],
      'problem': [
        'High friction in checkout processes',
        'Lack of after purchase survices',
        'Inconsistent product management',
      ],
      'solution':
          'Create a secure, fast-loading retail app with integrated Stripe payments and a custom Node.js backend.',
      'challenges': [
        'Payment integration',
        'Handling real-time stock updates',
        'Secure user authentication',
      ],
      'learnings': [
        'Financial transaction security',
        'Backend-to-frontend communication',
        'Scalable product cataloging',
      ],
      'keyFeatures': [
        'Full after purchase support',
        'Simple set recommendation system ',
        'Real-time order updates',
      ],
      'technicalDecisions': [
        'Laravel for a custom, scalable backend',
        'Dual apps to handle shop + maintenance',
        'Cubit for state management',
      ],
    },
  ];
}

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;
    return holderContainer(
      color: AppTheme.cardBackground,
      horizontalMobilePadding: AppConstants.spacingM,
      horizontalDesktopPadding: AppConstants.spacingL,
      verticalMobilePadding: (screenWidth * 0.05).clamp(60, 100),
      verticalDesktopPadding: (screenWidth * 0.05).clamp(60, 100),
      mobile: isMobile,
      title: 'Featured',
      highlight: 'Projects',
      catchphrase:
          'Here are some of my recent projects that I\'m most proud of.',
      sizedBox01Height: 16,
      sizedBox02Height: 60,
      body: _projectsDesktop(context),
    );
  }

  Widget _projectsDesktop(BuildContext context) {
    final projects = _projectsData();
    final screenWidth = MediaQuery.of(context).size.width;

    final double spacing = AppConstants.spacingL;

    int columns;
    if (screenWidth < 700) {
      columns = 1;
    } else if (screenWidth < AppConstants.desktopBreakpoint) {
      columns = 2;
    } else if (screenWidth < 1400) {
      columns = 2;
    } else {
      columns = 3;
    }

    // Calculate card width manually
    final double totalSpacing = spacing * (columns - 1);
    final double cardWidth =
        (screenWidth -
            totalSpacing -
            (AppConstants.spacingL * 2)) / // section padding
        columns;

    return Wrap(
      spacing: spacing,
      runSpacing: spacing,
      children:
          projects.map((project) {
            return SizedBox(
              width: cardWidth,
              child: ProjectCard(project: project),
            );
          }).toList(),
    );
  }
}

class ProjectCard extends StatefulWidget {
  final Map<String, dynamic> project;

  const ProjectCard({super.key, required this.project});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final p = widget.project;

    final String title = p['title'];
    final String catchphrase = p['catchphrase'];
    final String description = p['description'];
    // final String role = p['role'];
    final Color accentColor = p['color'];
    final String image = p['image'];
    // final List<String> images = List<String>.from(p['images']);
    final List<String> techStack = List<String>.from(p['techStack']);
    final String? githubUrl = p['githubUrl'];
    // final String? demoUrl = p['demoUrl'];

    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;
    final bool hasGithub = githubUrl != null;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: AppConstants.hoverDuration,
        transform: Matrix4.translationValues(0, _isHovered ? -6 : 0, 0),
        child: Container(
          decoration: BoxDecoration(
            color: AppTheme.darkBackground,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color:
                  _isHovered
                      ? accentColor
                      // .withValues(alpha: 0.3)
                      : AppTheme.cardBackground,
              width: 2,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image + badge
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(AppConstants.circularL),
                    ),
                    child: Container(
                      color: Colors.white,
                      child: Image.asset(
                        image,
                        width: double.infinity,
                        height: isMobile ? 180 : 200, // reduce height on tablet
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  if (!hasGithub)
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: AppConstants.spacingXxs,
                        ),
                        decoration: BoxDecoration(
                          color: AppTheme.accentYellow,
                          borderRadius: BorderRadius.circular(
                            AppConstants.circularS,
                          ),
                        ),
                        child: const Text(
                          'In Progress',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? AppConstants.spacingS : 20,
                  vertical: AppConstants.spacingS,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //project name
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: isMobile ? 16 : 18,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.textPrimary,
                      ),
                    ),
                    const SizedBox(height: AppConstants.spacingXs),
                    // catchphrase
                    Text(
                      catchphrase,
                      style: TextStyle(
                        fontSize: isMobile ? 13 : 14,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.primaryCyan,
                      ),
                    ),

                    const SizedBox(height: 6),

                    // description
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: isMobile ? 12 : 13,
                        color: AppTheme.textSecondary,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 12),
                    //stack
                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children:
                          techStack.map((tech) {
                            return Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: AppConstants.spacingXs,
                                vertical: AppConstants.spacingXxs,
                              ),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 3, 46, 80),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                tech,
                                style: TextStyle(
                                  fontSize: isMobile ? 11 : 12,
                                  color: AppTheme.primaryCyan,
                                ),
                              ),
                            );
                          }).toList(),
                    ),
                    const SizedBox(height: AppConstants.spacingS),
                    //buttons
                    isMobile
                        ? Center(
                          child: Column(
                            spacing: AppConstants.spacingXs,
                            children: [
                              //details
                              SizedBox(
                                width: double.infinity,
                                child: _buildOutlinedButton(
                                  context,
                                  'View Project',
                                  Colors.blueGrey,
                                  icon: FontAwesomeIcons.eye,
                                  onTap: () {
                                    // This is the function being passed
                                    !isMobile
                                        ? showDialog(
                                          context: context,
                                          barrierDismissible: true,
                                          builder:
                                              (_) => ProjectDetailsDialog(
                                                project: widget.project,
                                              ),
                                        )
                                        : navigateTo(
                                          context,
                                          ProjectDetailsPage(project: p),
                                        );
                                  },
                                ),
                              ),
                              //github
                              SizedBox(
                                width: double.infinity,
                                child: _buildElevatedButton(
                                  hasGithub ? 'GitHub' : 'Coming Soon',
                                  icon: FontAwesomeIcons.github,
                                  enabled: hasGithub,
                                  onTap:
                                      hasGithub
                                          ? () => openUrlExternal(githubUrl)
                                          : null,
                                ),
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: _buildOutlinedButton(
                                  context,
                                  'View Demo',
                                  icon: FontAwesomeIcons.upRightFromSquare,
                                  AppTheme.primaryCyan,
                                  onTap: () {},
                                ),
                              ),
                            ],
                          ),
                        )
                        : Wrap(
                          spacing: AppConstants.spacingXs,
                          runSpacing: AppConstants.spacingXs,
                          children: [
                            _buildOutlinedButton(
                              context,
                              'View Details',
                              Colors.blueGrey,
                              onTap: () {
                                // This is the function being passed
                                showDialog(
                                  context: context,
                                  barrierDismissible: true,
                                  builder:
                                      (_) => ProjectDetailsDialog(
                                        project: widget.project,
                                      ),
                                );
                              },
                            ),
                            _buildElevatedButton(
                              hasGithub ? 'GitHub' : 'Coming Soon',
                              icon: FontAwesomeIcons.github,
                              enabled: hasGithub,
                              onTap:
                                  hasGithub
                                      ? () => openUrlExternal(githubUrl)
                                      : null,
                            ),
                            _buildOutlinedButton(
                              context,
                              onTap: () {},
                              'View Demo',
                              icon: FontAwesomeIcons.upRightFromSquare,
                              AppTheme.primaryCyan,
                            ),
                          ],
                        ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOutlinedButton(
    BuildContext context,
    String text,
    Color color, {
    IconData? icon,
    required VoidCallback onTap,
  }) {
    return OutlinedButton(
      onPressed: onTap, // 2. Assign the function here
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        foregroundColor: color,
        side: BorderSide(color: color, width: 1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 15, color: color),
            const SizedBox(width: 4),
          ],
          Text(text, style: TextStyle(color: color, fontSize: 13)),
        ],
      ),
    );
  }

  Widget _buildElevatedButton(
    String text, {
    IconData? icon,
    VoidCallback? onTap,
    bool enabled = true, // 👈 whether the button is clickable
  }) {
    return ElevatedButton(
      onPressed: enabled ? onTap : null, // disabled if no URL
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        backgroundColor:
            enabled
                ? AppTheme.primaryCyan
                : Colors.grey.shade700, // greyed out when disabled
        foregroundColor:
            enabled
                ? Colors.black
                : Colors.grey.shade400, // text color when disabled
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(
              icon,
              size: 16,
              color: enabled ? Colors.black : Colors.grey.shade400,
            ),
            const SizedBox(width: 4),
          ],
          Text(
            text,
            style: TextStyle(
              color: enabled ? Colors.black : Colors.grey.shade400,
            ),
          ),
          if (!enabled) ...[
            const SizedBox(width: 6),
            const Icon(Icons.lock, size: 14, color: Colors.grey),
          ],
        ],
      ),
    );
  }
}

class ProjectDetailsDialog extends StatelessWidget {
  final Map<String, dynamic> project;

  const ProjectDetailsDialog({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final p = project;

    final String title = p['title'];
    final String subtitle = p['catchphrase'];
    final String image = p['image'];
    final String role = p['role'];
    final String? url = p['githubUrl'];
    final List<String> images = List<String>.from(p['images']);
    final List<String> techStack = List<String>.from(p['techStack']);
    final List<String> problem = List<String>.from(p['problem']);
    final String solution = p['solution'];
    final List<String> challenges = List<String>.from(p['challenges']);
    final List<String> learnings = List<String>.from(p['learnings']);
    final List<String> keyFeatures = List<String>.from(p['keyFeatures']);
    final List<String> technicalDecisions = List<String>.from(
      p['technicalDecisions'],
    );

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(
        horizontal: isMobile(context) ? 16 : 24,
        vertical: isMobile(context) ? 16 : 24,
      ),
      child: Container(
        // constraints: const BoxConstraints(maxWidth: 900, maxHeight: 700),
        constraints: const BoxConstraints(maxWidth: 1280, maxHeight: 700),

        decoration: BoxDecoration(
          color: AppTheme.darkBackground,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Stack(
          children: [
            /// Main content
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  _header(
                    title: title,
                    subtitle: subtitle,
                    image: image,
                    url: url,
                  ),

                  const SizedBox(height: 32),
                  Expanded(
                    child: _body(
                      techStack: techStack,
                      role: role,
                      problem: problem,
                      solution: solution,
                      challenges: challenges,
                      learnings: learnings,
                      keyFeatures: keyFeatures,
                      technicalDecisions: technicalDecisions,
                      images: images,
                    ),
                  ),
                ],
              ),
            ),

            /// Close button
            Positioned(
              top: 20,
              right: 20,
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _body({
    required List<String> techStack,
    required String role,
    required List<String> problem,
    required String solution,
    required List<String> challenges,
    required List<String> learnings,
    required List<String> keyFeatures,
    required List<String> technicalDecisions,
    required List<String> images,
  }) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return CustomScrollView(
          slivers: [
            // Tech stack
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _columnLabel('Tech Stack'),

                  const SizedBox(height: AppConstants.spacingXs),
                  _techStackInline(techStack),

                  const SizedBox(height: AppConstants.spacingS),
                  _columnLabel('My Role'),
                  const SizedBox(height: AppConstants.spacingXs),
                  _roleInline(role),

                  const SizedBox(height: AppConstants.spacingM),
                ],
              ),
            ),
            //cards
            SliverToBoxAdapter(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final columns = getResponsiveColumnCount(
                    constraints.maxWidth,
                  );
                  const spacing = 24.0;

                  final double totalSpacing = spacing * (columns - 1);
                  final double cardWidth =
                      (constraints.maxWidth - totalSpacing) / columns;

                  final cards = [
                    _infoCard(
                      icon: Icons.warning_amber_rounded,
                      color: Colors.yellowAccent,
                      title: 'Problem',
                      items: problem,
                    ),
                    _infoCard(
                      icon: Icons.lightbulb_outline,
                      color: Colors.yellowAccent,
                      title: 'Solution',
                      description: solution,
                    ),
                    _infoCard(
                      icon: Icons.error_outline,
                      color: Colors.red,
                      title: 'Challenges',
                      items: challenges,
                    ),
                    _infoCard(
                      icon: Icons.psychology_outlined,
                      color: Colors.green,
                      title: 'Learnings',
                      items: learnings,
                    ),
                  ];

                  return Column(
                    children: List.generate((cards.length / columns).ceil(), (
                      rowIndex,
                    ) {
                      final rowItems =
                          cards.skip(rowIndex * columns).take(columns).toList();

                      return Padding(
                        padding: const EdgeInsets.only(bottom: spacing),
                        child: IntrinsicHeight(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: List.generate(rowItems.length, (index) {
                              final isLast = index == rowItems.length - 1;

                              return SizedBox(
                                width: cardWidth,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    right: isLast ? 0 : spacing,
                                  ),
                                  child: rowItems[index],
                                ),
                              );
                            }),
                          ),
                        ),
                      );
                    }),
                  );
                },
              ),
            ),

            // Full-width cards
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const SizedBox(height: AppConstants.spacingM),
                  _fullWidthCard(title: 'Key Features', items: keyFeatures),
                  const SizedBox(height: 12),
                  _fullWidthCard(
                    title: 'Technical Decisions',
                    items: technicalDecisions,
                  ),
                  const SizedBox(height: 12),
                  ImageGallery(images: images),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

// ---------------- HEADER ----------------
Widget _header({
  required String title,
  required String subtitle,
  required String image,
  required String? url,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          CircleAvatar(backgroundImage: AssetImage(image), radius: 25),
          const SizedBox(width: 12),
          Text(title, style: const TextStyle(fontSize: 28)),
        ],
      ),
      const SizedBox(height: 8),
      Text(subtitle),
      const SizedBox(height: AppConstants.spacingM),

      Row(
        children: [
          if (url != null)
            _primaryButton(
              label: 'View GitHub',
              icon: FontAwesomeIcons.github,
              url: url,
            )
          else
            const ElevatedButton(
              onPressed: null,
              child: Text('Private / Coming Soon'),
            ),
        ],
      ),
    ],
  );
}

//
Widget _techStackInline(List<String> techStack) {
  return Wrap(
    spacing: 6,
    runSpacing: 6,
    children:
        techStack.map((tech) {
          return Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.spacingXs,
              vertical: AppConstants.spacingXxs,
            ),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 3, 46, 80),
              borderRadius: BorderRadius.circular(AppConstants.circularM),
            ),
            child: Text(
              tech,
              style: const TextStyle(fontSize: 12, color: AppTheme.primaryCyan),
            ),
          );
        }).toList(),
  );
}

Widget _roleInline(String role) {
  return Text(
    role,
    style: const TextStyle(
      fontSize: 14,
      color: AppTheme.textPrimary,
      height: 1.5,
    ),
  );
}

Widget _columnLabel(String text) {
  return Text(
    text,
    style: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: AppTheme.textPrimary,
      letterSpacing: 0.5,
    ),
  );
}

Widget _infoCard({
  bool isIcon = true,
  IconData? icon,
  required String title,
  List<String>? items,
  String? description,
  Color? color,
}) {
  return Container(
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: AppTheme.cardBackground,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            isIcon
                ? Icon(icon, color: color ?? AppTheme.primaryCyan)
                : SizedBox.shrink(),
            const SizedBox(width: AppConstants.spacingXs),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppTheme.textPrimary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        if (description != null)
          Text(
            description,
            style: const TextStyle(
              fontSize: 14,
              color: AppTheme.textSecondary,
              height: 1.6,
            ),
          ),
        if (items != null)
          ...items.map(
            (e) => Padding(
              padding: const EdgeInsets.only(top: 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '• ',
                    style: TextStyle(color: AppTheme.primaryCyan),
                  ),
                  Expanded(
                    child: Text(
                      e,
                      style: const TextStyle(color: AppTheme.textSecondary),
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

Widget _fullWidthCard({required String title, required List<String> items}) {
  return _infoCard(title: title, items: items, isIcon: false);
}

Widget _primaryButton({
  required String label,
  required IconData icon,
  required String url,
}) {
  return ElevatedButton.icon(
    onPressed: () {
      openUrlExternal(url);
    },
    icon: Icon(icon, size: 18),
    label: Text(label),
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
    ),
  );
}

class ProjectDetailsPage extends StatelessWidget {
  final Map<String, dynamic> project;

  const ProjectDetailsPage({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final String title = project['title'];
    final String subtitle = project['catchphrase'];
    final String image = project['image'];
    final String role = project['role'];
    final String? url = project['githubUrl'];
    final List<String> images = List<String>.from(project['images']);
    final List<String> techStack = List<String>.from(project['techStack']);
    final List<String> problem = List<String>.from(project['problem']);
    final String solution = project['solution'];
    final List<String> challenges = List<String>.from(project['challenges']);
    final List<String> learnings = List<String>.from(project['learnings']);
    final List<String> keyFeatures = List<String>.from(project['keyFeatures']);
    final List<String> technicalDecisions = List<String>.from(
      project['technicalDecisions'],
    );

    return Scaffold(
      appBar: AppBar(backgroundColor: AppTheme.darkBackground),
      body: Padding(
        padding: const EdgeInsets.all(AppConstants.spacingL),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _header(title: title, subtitle: subtitle, image: image, url: url),
              const SizedBox(height: 32),
              LayoutBuilder(
                builder: (context, constraints) {
                  final columns = getResponsiveColumnCount(
                    constraints.maxWidth,
                  );

                  final double childAspectRatio;
                  final double? mainAxisExtent;
                  switch (columns) {
                    case 4:
                      childAspectRatio = 1.2;
                      mainAxisExtent = 191;
                      break;
                    case 3:
                      childAspectRatio = 1.25;
                      mainAxisExtent = 211;
                      break;
                    case 2:
                      childAspectRatio = 1.1;
                      mainAxisExtent = 211;
                      break;
                    default:
                      childAspectRatio = 1.0;
                      mainAxisExtent = null;
                  }

                  return CustomScrollView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    slivers: [
                      // Tech Stack & Role
                      SliverToBoxAdapter(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _columnLabel('Tech Stack'),
                            const SizedBox(height: 8),
                            _techStackInline(techStack),
                            const SizedBox(height: 16),
                            _columnLabel('My Role'),
                            const SizedBox(height: 8),
                            _roleInline(role),
                            const SizedBox(height: 24),
                          ],
                        ),
                      ),

                      // Grid: Problem, Solution, Challenges, Learnings
                      SliverGrid(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: columns,
                          crossAxisSpacing: 24,
                          mainAxisSpacing: 24,
                          childAspectRatio: childAspectRatio,
                          mainAxisExtent: mainAxisExtent,
                        ),
                        delegate: SliverChildListDelegate([
                          _infoCard(
                            icon: Icons.warning_amber_rounded,
                            color: Colors.yellowAccent,
                            title: 'Problem',
                            items: problem,
                          ),
                          _infoCard(
                            icon: Icons.lightbulb_outline,
                            color: Colors.yellowAccent,
                            title: 'Solution',
                            description: solution,
                          ),
                          _infoCard(
                            icon: Icons.error_outline,
                            color: Colors.red,
                            title: 'Challenges',
                            items: challenges,
                          ),
                          _infoCard(
                            icon: Icons.psychology_outlined,
                            color: Colors.green,
                            title: 'Learnings',
                            items: learnings,
                          ),
                        ]),
                      ),

                      // Full-width cards
                      SliverToBoxAdapter(
                        child: Column(
                          children: [
                            const SizedBox(height: 24),
                            _fullWidthCard(
                              title: 'Key Features',
                              items: keyFeatures,
                            ),
                            const SizedBox(height: 12),
                            _fullWidthCard(
                              title: 'Technical Decisions',
                              items: technicalDecisions,
                            ),
                            const SizedBox(height: 12),
                            ImageGallery(images: images),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

int getResponsiveColumnCount(double width) {
  if (width >= 900) return 4;
  if (width >= 600) return 3;
  if (width >= 300) return 2;
  return 1;
}
