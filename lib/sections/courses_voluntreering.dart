import 'package:flutter/material.dart';
import '../theme/app_constants.dart';
import '../theme/app_theme.dart';
import '../widgets/widgets.dart';

// =======================
// DATA SOURCES
// =======================
final List<Map<String, dynamic>> coursesData = [
  {
    'title': 'Google IT Support',
    'platform': 'Google',
    'year': '2025',
    'borderColor': AppTheme.primaryCyan,
    'url':'',
    'icon': 'assets/icons/google.png',
    'description':
        'Developed foundational skills in troubleshooting, customer service, networking, and system administration.',
  },
  {
    'title': 'Google UX Design',
    'platform': 'Google',
    'year': '2025',
    'borderColor': AppTheme.accentYellow,
    'url':'',
    'icon': 'assets/icons/google.png',
    'description':
        'Mastered the end-to-end design process, from user research and wireframing to high-fidelity prototyping.',
  },
  {
    'title': 'Google Project Management',
    'platform': 'Google',
    'year': '2024',
    'borderColor': AppTheme.primaryCyan,
    'url':'',
    'icon': 'assets/icons/google.png',
    'description':
        'Proficient in Agile and Waterfall methodologies, stakeholder communication, and managing project lifecycles.',
  },
  {
    'title': 'Cybersecurity Fundamentals Specialization',
    'platform': 'IBM',
    'year': '2026',
    'borderColor': AppTheme.accentYellow,
    'url':'',
    'icon': 'assets/icons/ibmpng.png',
    'description':
        'Mastered cybersecurity essentials, including threat mitigation, data privacy, and incident response to protect critical digital infrastructure.',
  },
];

final List<Map<String, dynamic>> volunteeringData = [
  {
    'organization': 'Syrian Association For AI and Entrepreneurhip',
    'date': 'Sep 2025 - Present',
    'logo': 'assets/images/saae.png',
    'url': 'https://aisyria.org/',
    'borderColor': AppTheme.primaryCyan,
    'description':
        'Participating in tech events and representing the association at national fairs and expeditions to promote AI literacy. Bridging the gap between complex technology and the public, fostering community engagement and ecosystem growth.',
  },
];

// =======================
// UI
// =======================
class CoursesSection extends StatelessWidget {
  const CoursesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final mobile = isMobile(context);

    return holderContainer(
      mobile: mobile,
      horizontalMobilePadding: AppConstants.spacingM,
      verticalDesktopPadding: AppConstants.spacingXxl,
      horizontalDesktopPadding: 80,
      verticalMobilePadding: 80,
      title: 'Courses &',
      highlight: 'Learnings',
      sizedBox01Height: AppConstants.spacingXxl,
      body: Column(
        children: [_buildCoursesList(mobile), const VolunteeringSection()],
      ),
      color: AppTheme.cardBackground,
    );
  }

  Widget _buildCoursesList(bool mobile) {
    return Column(
      children:
          coursesData.map((course) {
            return courseCard(mobile, course);
          }).toList(),
    );
  }

  Widget courseCard(mobile, course) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppConstants.spacingM),
      padding: EdgeInsets.all(
        mobile ? AppConstants.spacingM : AppConstants.spacingL,
      ),
      decoration: BoxDecoration(
        color: AppTheme.darkBackground,
        borderRadius: BorderRadius.circular(AppConstants.circularM),
        border: Border(
          left:
              mobile
                  ? BorderSide(
                    color:
                        (course['borderColor'] as Color?) ??
                        AppTheme.accentYellow,
                    width: 2.0,
                  )
                  : BorderSide.none,
          bottom:
              !mobile
                  ? BorderSide(
                    color:
                        (course['borderColor'] as Color?) ??
                        AppTheme.accentYellow,
                    width: 2.0,
                  )
                  : BorderSide.none,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        HoverLinkText(
                          text: course['title'],
                          url: course['url'],
                          mobile: mobile,
                        ),
                        // Expanded(
                        //   child: Text(
                        //     course['title'],
                        //     style: TextStyle(
                        //       fontSize: mobile ? 16 : 18,
                        //       fontWeight: FontWeight.w600,
                        //       color: AppTheme.textPrimary,
                        //     ),
                        //   ),
                        // ),
                        Text(
                          course['year'],
                          style: TextStyle(
                            fontSize: mobile ? 11 : 12,
                            color: AppTheme.textSecondary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppConstants.spacingXs),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: AppConstants.spacingS,
                          backgroundImage: AssetImage(course['icon']),
                        ),
                        Text(
                          '  ${course['platform']}',
                          style: TextStyle(
                            fontSize: mobile ? 13 : 14,
                            color: AppTheme.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppConstants.spacingS),
          Text(
            course['description'],
            style: TextStyle(
              fontSize: mobile ? 13 : 14,
              color: AppTheme.textSecondary,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}

// =======================
// Voluntering
// =======================
class VolunteeringSection extends StatelessWidget {
  const VolunteeringSection({super.key});

  @override
  Widget build(BuildContext context) {
    final mobile = isMobile(context);

    return holderContainer(
      verticalMobilePadding: 40,
      verticalDesktopPadding: AppConstants.spacingXxl,
      horizontalDesktopPadding: 0,
      horizontalMobilePadding: 0,
      sizedBox01Height: mobile ? AppConstants.spacingXs : AppConstants.spacingL,
      mobile: mobile,
      title: 'Volunteering',
      highlight: 'Experience',
      body: _buildVolunteeringList(context, mobile),
      color: AppTheme.cardBackground,
    );
  }

  Widget _buildVolunteeringList(BuildContext context, bool mobile) {
    return Column(
      children:
          volunteeringData.map((course) {
            return _volunteerCard(context, course, mobile);
          }).toList(),
    );
  }

  Widget _volunteerCard(
    BuildContext context,
    Map<String, dynamic> data,
    bool mobile,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppConstants.spacingM),
      padding: EdgeInsets.all(
        mobile ? AppConstants.spacingM : AppConstants.spacingL,
      ),
      decoration: BoxDecoration(
        color: AppTheme.darkBackground,
        borderRadius: BorderRadius.circular(AppConstants.circularM),
        border:
            mobile
                ? Border.symmetric(
                  horizontal: BorderSide(color: data['borderColor'], width: 2),
                )
                : Border.symmetric(
                  vertical: BorderSide(color: data['borderColor'], width: 2),
                ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: AppConstants.spacingXs,
        children: [
          Row(
            children: [
              //logo
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: mobile ? AppConstants.spacingM : AppConstants.spacingL,
                backgroundImage: AssetImage(data['logo']),
              ),
              const SizedBox(width: AppConstants.spacingM),
              //name
              // Expanded(
              //   flex: 3,
              //   child:
              //   // // ... inside your Row children ...
              //   // HoverLinkText(
              //   //   text: data['organization'],
              //   //   url: 'https://aisyria.org/',
              //   //   mobile: mobile,
              //   // ),
              //   InkWell(
              //     onTap: () {
              //       openUrlExternal('https://aisyria.org/');
              //     },
              //     child: Text(
              //       '${data['organization']} 🔗',
              //       maxLines: 2,
              //       overflow: TextOverflow.ellipsis,
              //       style: TextStyle(
              //         fontSize: mobile ? 16 : 18,
              //         fontWeight: FontWeight.w600,
              //         color: AppTheme.textPrimary,
              //       ),
              //     ),
              //   ),
              // ),
              HoverLinkText(
                text: data['organization'],
                url: data['url'],
                mobile: mobile,
              ),
              //date
              if (!mobile)
                Expanded(
                  flex: 1,
                  child: Text(
                    data['date'],
                    maxLines: 4,
                    softWrap: true,
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: mobile ? 12 : 12,
                      color: AppTheme.textSecondary,
                    ),
                  ),
                ),
            ],
          ),
          //date
          if (mobile)
            Text(
              data['date'],
              maxLines: 3,
              softWrap: true,
              style: TextStyle(
                fontSize: mobile ? 12 : 13,
                color: AppTheme.textSecondary,
              ),
            ),
          //description
          Text(
            data['description'],
            style: TextStyle(
              fontSize: mobile ? 13 : 14,
              color: AppTheme.textSecondary,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}

class HoverLinkText extends StatefulWidget {
  final String text;
  final String url;
  final bool mobile;

  const HoverLinkText({
    super.key,
    required this.text,
    required this.url,
    required this.mobile,
  });

  @override
  State<HoverLinkText> createState() => _HoverLinkTextState();
}

class _HoverLinkTextState extends State<HoverLinkText> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final linkColor = _hovered ? AppTheme.primaryCyan : Colors.white;

    return Expanded(
      flex: 3,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _hovered = true),
        onExit: (_) => setState(() => _hovered = false),
        child: InkWell(
          onTap: () => openUrlExternal(widget.url),
          splashColor: Colors.transparent,
          hoverColor: Colors.transparent,
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 150),
            style: TextStyle(
              fontSize: widget.mobile ? 16 : 18,
              fontWeight: FontWeight.w600,
              color: linkColor,
              decoration:
                  _hovered ? TextDecoration.underline : TextDecoration.none,
            ),
            child: Text(
              widget.text,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ),
    );
  }
}
