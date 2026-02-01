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
    {
      'title': 'Tecno Library',
      'description': 'A comprehensive digital library platform...',
      'color': const Color.fromARGB(255, 146, 0, 0),
      'image': 'assets/images/library.png',
      'githubUrl': 'https://github.com/yourname/tecno-library',
      'images': [
        'assets/images/library.png',
        'assets/images/library.png',
        'assets/images/library.png',
      ],
    },
    {
      'title': 'Jobly',
      'description': 'Job search platform...',
      'color': AppTheme.accentPurple,
      'image': 'assets/images/jobly.png',
      'githubUrl': null, // 👈 not uploaded yet
      'images': [
        'assets/images/library.png',
        'assets/images/library.png',
        'assets/images/library.png',
      ],
    },
    {
      'title': 'Tayar Shop',
      'description': 'E-commerce platform...',
      'color': const Color.from(alpha: 1, red: 0, green: 1, blue: 0.898),
      'image': 'assets/images/solar.png',
      'githubUrl': 'https://github.com/yourname/tayar-shop',
      'images': [
        'assets/images/library.png',
        'assets/images/library.png',
        'assets/images/library.png',
      ],
    },
    {
      'title': 'Fix Me',
      'description': 'Personal productivity app...',
      'color': const Color.fromARGB(255, 255, 139, 7),
      'image': 'assets/images/fixme.png',
      'badge': 'Featured',
      'githubUrl': null,
      'images': [
        'assets/images/fixme.png',
        'assets/images/fixme.png',
        'assets/images/fixme.png',
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
    double spacing = AppConstants.spacingL;

    int crossAxisCount;

    if (screenWidth < 700) {
      crossAxisCount = 1;
    } else if (screenWidth < AppConstants.desktopBreakpoint) {
      crossAxisCount = 2;
    } else if (screenWidth < 1400) {
      crossAxisCount = 2;
    } else {
      crossAxisCount = 3;
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate:
       SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: spacing,
        crossAxisSpacing: spacing,
        mainAxisExtent: screenWidth < 700?500:450, // keeps height stable
      ),

      itemCount: projects.length,
      itemBuilder: (context, index) {
        final project = projects[index];
        return ProjectCard(
          title: project['title'] as String,
          description: project['description'] as String,
          accentColor: project['color'] as Color,
          image: project['image'] as String,
          badge: project['badge'] as String?,
          githubUrl: project['githubUrl'] as String?,
          images: project['images'],
        );
      },
    );
  }
}

class ProjectCard extends StatefulWidget {
  final String title;
  final String description;
  final Color accentColor;
  final String image;
  final String? badge;
  final String? githubUrl;
  final List<String> images;

  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.accentColor,
    required this.image,
    this.badge,
    this.githubUrl,
    required this.images,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;
    final bool hasGithub = widget.githubUrl != null;

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
                      ? widget.accentColor
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
                      top: Radius.circular(16),
                    ),
                    child: Container(
                      color: Colors.white,
                      child: Image.asset(
                        widget.image,
                        width: double.infinity,
                        height: isMobile ? 180 : 200, // reduce height on tablet
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  // if (widget.badge != null)
                  //   Positioned(
                  //     top: 12,
                  //     right: 12,
                  //     child: Container(
                  //       padding: const EdgeInsets.symmetric(
                  //         horizontal: 10,
                  //         vertical: 4,
                  //       ),
                  //       decoration: BoxDecoration(
                  //         color: AppTheme.accentYellow,
                  //         borderRadius: BorderRadius.circular(12),
                  //         boxShadow: [
                  //           BoxShadow(
                  //             color: Colors.black.withValues(alpha: 0.1),
                  //             blurRadius: 4,
                  //             offset: const Offset(0, 2),
                  //           ),
                  //         ],
                  //       ),
                  //       child: Text(
                  //         widget.badge!,
                  //         style: const TextStyle(
                  //           fontSize: 11,
                  //           fontWeight: FontWeight.bold,
                  //           color: Colors.black,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  if (!hasGithub)
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppTheme.accentYellow,
                          borderRadius: BorderRadius.circular(10),
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
                  horizontal: isMobile ? 16 : 20,
                  vertical: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(
                        fontSize: isMobile ? 16 : 18,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.description,
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
                      children: List.generate(
                        3,
                        (index) => Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 3, 46, 80),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            'Flutter',
                            style: TextStyle(
                              fontSize: isMobile ? 11 : 12,
                              color: AppTheme.primaryCyan,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    //buttons
                    isMobile
                        ? Center(
                          child: Column(
                            spacing: 8,
                            children: [
                              SizedBox(
                                width: double.infinity,
                                child: _buildOutlinedButton(
                                  context,
                                  'View Project',
                                  Colors.blueGrey,
                                  icon: FontAwesomeIcons.eye,
                                  onTap: () {
                                    // This is the function being passed
                                    showDialog(
                                      context: context,
                                      barrierDismissible: true,
                                      builder:
                                          (_) => ProjectDetailsDialog(
                                            title: widget.title,
                                            subtitle:
                                                'Helping users stay on the right track',
                                            image: widget.image,
                                            images: widget.images, // 👈 PASS IT
                                          ),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: _buildElevatedButton(
                                  hasGithub ? 'GitHub' : 'Coming Soon',
                                  icon: FontAwesomeIcons.github,
                                  enabled: hasGithub,
                                  onTap:
                                      hasGithub
                                          ? () =>
                                              launchExternal(widget.githubUrl!)
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
                          spacing: 8,
                          runSpacing: 8,
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
                                        title: widget.title,
                                        subtitle:
                                            'Helping users stay on the right track',
                                        image: widget.image,
                                        images: widget.images, // 👈 PASS IT
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
                                      ? () => launchExternal(widget.githubUrl!)
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

  // Widget _buildElevatedButton(String text, {IconData? icon}) {
  //   return ElevatedButton(
  //     onPressed: () {},
  //     style: ElevatedButton.styleFrom(
  //       padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
  //     ),
  //     child: Row(
  //       mainAxisSize: MainAxisSize.min,
  //       children: [
  //         if (icon != null) ...[Icon(icon, size: 16), const SizedBox(width: 4)],
  //         Text(text),
  //       ],
  //     ),
  //   );
  // }

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
  final String title;
  final String subtitle;
  final String image;
  final List<String> images; // 👈 ADD THIS

  const ProjectDetailsDialog({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.images, // 👈 ADD THIS
  });

  int _getColumnCount(double width) {
    if (width >= 900) return 4; // extra-wide screens
    if (width >= 600) return 3; // large screens
    if (width >= 300) return 2; // medium screens
    return 1; // small screens
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
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
              padding: const EdgeInsets.all(32),
              child: Column(
                children: [
                  _header(context),
                  const SizedBox(height: 32),
                  Expanded(child: _body()),
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

  // ---------------- HEADER ----------------
  Widget _header(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(image),
                  fit:
                      BoxFit
                          .cover, // This ensures the circle is filled perfectly
                ),
              ),
            ),
            const SizedBox(width: 12),
            Text(
              title,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: AppTheme.textPrimary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: 15,
            color: AppTheme.textSecondary.withValues(alpha: 0.8),
          ),
        ),
        const SizedBox(height: 24),

        Row(
          children: [
            _primaryButton(label: 'View GitHub', icon: FontAwesomeIcons.github),
            const SizedBox(width: 16),
            _outlinedButton(
              label: 'Live Demo',
              icon: FontAwesomeIcons.upRightFromSquare,
            ),
          ],
        ),

        // Tech Stack line
      ],
    );
  }

  // ---------------- BODY ----------------
  Widget _body() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final columns = _getColumnCount(constraints.maxWidth);

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
          slivers: [
            // Tech stack
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _columnLabel('Tech Stack'),
                  const SizedBox(height: 8),
                  _techStackInline(),
                  const SizedBox(height: 16),
                  _columnLabel('My Role'),
                  const SizedBox(height: 8),
                  _roleInline(),
                  const SizedBox(height: 24),
                ],
              ),
            ),

            // Grid
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
                  items: [
                    'No track of progress',
                    'No visualization',
                    'Need for order',
                  ],
                ),
                _infoCard(
                  icon: Icons.lightbulb_outline,
                  color: Colors.yellowAccent,

                  title: 'Solution',
                  description:
                      'Build a comprehensive app to visualize the progress made and compare between months.',
                ),
                _infoCard(
                  icon: Icons.error_outline,
                  color: Colors.red,

                  title: 'Challenges',
                  items: ['State management', 'Data persistence', 'UX clarity'],
                ),
                _infoCard(
                  icon: Icons.psychology_outlined,
                  color: Colors.green,

                  title: 'Learnings',
                  items: [
                    'BLoC architecture',
                    'UX-driven planning',
                    'Scalable structure',
                  ],
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
                    items: [
                      'Monthly progress tracking',
                      'Visual analytics',
                      'Habit streak system',
                      'Local persistence',
                    ],
                  ),
                  const SizedBox(height: 12),
                  _fullWidthCard(
                    title: 'Technical Decisions',
                    items: [
                      'Monthly progress tracking',
                      'Visual analytics',
                      'Habit streak system',
                      'Local persistence',
                    ],
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

  //
  Widget _techStackInline() {
    final techStack = ['Flutter', 'BLoC', 'SQLite', 'Figma'];

    return Wrap(
      spacing: 6,
      runSpacing: 6,
      children:
          techStack.map((tech) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 3, 46, 80),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                tech,
                style: const TextStyle(
                  fontSize: 12,
                  color: AppTheme.primaryCyan,
                ),
              ),
            );
          }).toList(),
    );
  }

  Widget _roleInline() {
    return Text(
      'UI/UX Design, Product Owner, Mobile Developer',
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
              const SizedBox(width: 8),
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

  Widget _primaryButton({required String label, required IconData icon}) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(icon, size: 18),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      ),
    );
  }

  Widget _outlinedButton({required String label, required IconData icon}) {
    return OutlinedButton.icon(
      onPressed: () {},
      icon: Icon(icon, size: 18),
      label: Text(label),
      style: OutlinedButton.styleFrom(
        foregroundColor: AppTheme.primaryCyan,
        side: BorderSide(color: AppTheme.primaryCyan),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      ),
    );
  }
}
