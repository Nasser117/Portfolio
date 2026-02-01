import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_constants.dart';
import '../theme/app_theme.dart';
import '../widgets/widgets.dart';
import 'package:flutter/foundation.dart';

// =======================
// DATA SOURCES
// =======================
final Map<String, dynamic> heroData = {
  // Avatar image
  'avatar': 'assets/images/me.png',
  // Name & title
  'name': 'Al-Nasser Haddad',
  'subtitle': 'Software Engineer | Flutter Developer | UI/UX Enthusiast',
  'description':
      'Crafting beautiful, performant mobile experiences that users love',
  // Buttons URLs
  'cvUrl': 'https://raw.githubusercontent.com/Nasser117/CV/main/cv.pdf',
  // Social links
  'socials': [
    {
      'icon': FontAwesomeIcons.linkedin,
      'url': 'https://www.linkedin.com/in/al-nasser-haddad-b4a1b42b1/',
    },
    {
      'icon': Icons.mail,
      'url':
          'https://mail.google.com/mail/?view=cm&fs=1&to=alnaser.h@gmail.com&su=Portfolio%20Contact',
    },
    {'icon': FontAwesomeIcons.github, 'url': 'https://github.com/Nasser117'},
  ],
};

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final mobile = isMobile(context);
    final tablet = isTablet(context);

    return holderContainer(
      horizontalMobilePadding: 24,
      horizontalDesktopPadding: tablet ? 48 : 80,
      verticalMobilePadding: 30,
      verticalDesktopPadding: 10,
      mobile: mobile,
      title: '',
      highlight: '',
      body: heroBody(mobile, context),
    );
  }

  Widget heroBody(bool mobile, BuildContext context) {
    final String avatar = heroData['avatar'];
    final String name = heroData['name'];
    final String subtitle = heroData['subtitle'];
    final String description = heroData['description'];
    final String cvUrl = heroData['cvUrl'];
    final List socials = heroData['socials'];

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //image
        CircleAvatar(
          radius: mobile ? 60 : 70,
          backgroundColor: AppTheme.primaryCyan,
          child: CircleAvatar(
            radius: mobile ? 58 : 68,
            backgroundColor: AppTheme.cardBackground,
            backgroundImage: AssetImage(avatar),
          ),
        ),
        const SizedBox(height: 24),
        //name
        Text(
          name,
          style: TextStyle(
            fontSize: mobile ? 32 : 48,
            fontWeight: FontWeight.bold,
            color: AppTheme.textPrimary,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 12),
        //roles
        Text(
          subtitle,
          style: TextStyle(
            fontSize: mobile ? 14 : 16,
            color: AppTheme.textSecondary,
            height: 1.6,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        //catchphrase
        Text(
          description,
          style: TextStyle(
            fontSize: mobile ? 13 : 14,
            color: AppTheme.textSecondary.withValues(alpha: 0.8),
            height: 1.6,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 32),
        // Buttons
        mobile
            ? Column(
              spacing: 16,
              children: [
                SizedBox(width: double.infinity, child: projectsButton()),
                SizedBox(
                  width: double.infinity,
                  child: viewCVButton(context, cvUrl),
                ),
              ],
            )
            : Wrap(
              spacing: 16,
              runSpacing: 16,
              alignment: WrapAlignment.center,
              children: [
                SizedBox(width: 200, child: projectsButton()),
                SizedBox(width: 200, child: viewCVButton(context, cvUrl)),
              ],
            ),
        SizedBox(height: mobile ? 16 : 32),
        // Social buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 16,
          children:
              socials.map<Widget>((social) {
                return SocialIconButton(
                  icon: social['icon'],
                  onTap: () => launchExternal(social['url']),
                );
              }).toList(),
        ),
        const SizedBox(height: 100),
      ],
    );
  }

  Widget projectsButton() {
    return ElevatedButton(
      onPressed: () {},
      child: const Text('View Projects', style: TextStyle(fontSize: 14)),
    );
  }
}

Widget downloadCVButton(String cvUrl) {
  return OutlinedButton(
    onPressed: () async {
      final Uri uri = Uri.parse(cvUrl);

      if (await canLaunchUrl(uri)) {
        await launchUrl(
          uri,
          // This mode tells Mobile to open in a browser/system viewer
          mode: LaunchMode.externalApplication,
        );
      } else {
        // Fallback if the URL can't be opened
        debugPrint('Could not launch $cvUrl');
      }
    },
    child: const Text('Download CV'),
  );
}

Widget viewCVButton(BuildContext context, String cvUrl) {
  return OutlinedButton(
    onPressed: () {
      showDialog(context: context, builder: (_) => cvPdfDialog(context, cvUrl));
    },
    child: const Text('View CV'),
  );
}

Widget cvPdfDialog(BuildContext context, String cvUrl) {
  final Uri uri = Uri.parse(cvUrl);
  return Dialog(
    insetPadding: const EdgeInsets.all(16),
    child: SizedBox(
      width: 800,
      height: 600,
      child: Column(
        children: [
          // Header with close button and download button
          Container(
            color: AppTheme.primaryCyan,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'CV Preview',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Row(
                  children: [
                    // Download button
                    OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        side: const BorderSide(color: Colors.white),
                      ),
                      icon: const Icon(Icons.download, size: 18),
                      label: const Text('Download'),
                      onPressed: () async {
                        if (await canLaunchUrl(uri)) {
                          await launchUrl(
                            uri,
                            // This mode tells Mobile to open in a browser/system viewer
                            mode: LaunchMode.externalApplication,
                          );
                        } else {
                          // Fallback if the URL can't be opened
                          debugPrint('Could not launch url');
                        }
                      },
                    ),
                    const SizedBox(width: 8),
                    // Close button
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.white),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // PDF Viewer
          Expanded(
            child:
                kIsWeb
                    ? SfPdfViewer.network(cvUrl)
                    : SfPdfViewer.asset('assets/files/cv.pdf'),
          ),
        ],
      ),
    ),
  );
}
