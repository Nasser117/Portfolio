import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'package:url_launcher/url_launcher.dart';

/// Opens a URL (web or mobile) in the system viewer or browser
Future<void> openUrlExternal(String url) async {
  final Uri uri = Uri.parse(url);

  if (await canLaunchUrl(uri)) {
    await launchUrl(
      uri,
      // This mode tells Mobile to open in a browser/system viewer
      mode: LaunchMode.externalApplication,
    );
  } else {
    // Fallback if the URL can't be opened
    debugPrint('Could not launch $uri');
  }
}

class SocialIconButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback onTap;

  const SocialIconButton({super.key, required this.icon, required this.onTap});

  @override
  State<SocialIconButton> createState() => _SocialIconButtonState();
}

class _SocialIconButtonState extends State<SocialIconButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color:
                _isHovered
                    ? AppTheme.primaryCyan.withValues(alpha: 0.1)
                    : AppTheme.cardBackground,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color:
                  _isHovered ? AppTheme.primaryCyan : AppTheme.cardBackground,
              width: 1,
            ),
          ),
          child: Icon(
            widget.icon,
            color: _isHovered ? AppTheme.primaryCyan : AppTheme.textSecondary,
            size: 20,
          ),
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  final String highlight;

  const SectionTitle({super.key, required this.title, required this.highlight});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: const TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.bold,
          color: AppTheme.textPrimary,
        ),
        children: [
          TextSpan(text: '$title '),
          TextSpan(
            text: highlight,
            style: const TextStyle(color: AppTheme.primaryCyan),
          ),
        ],
      ),
    );
  }
}

Future<void> launchExternal(String url) async {
  // final uri = Uri.parse(url);
  // await launchUrl(uri, mode: LaunchMode.platformDefault);
}

void launchMailWeb() {
  // final mailUrl = 'mailto:alnaser.h@gmail.com?subject=Portfolio Contact';
  // html.AnchorElement(href: mailUrl)
  //   ..target = '_self'
  //   ..click();
}

class ImageGallery extends StatefulWidget {
  final List<String> images;

  const ImageGallery({super.key, required this.images});

  @override
  State<ImageGallery> createState() => _ImageGalleryState();
}

class _ImageGalleryState extends State<ImageGallery> {
  int _currentIndex = 0;

  void _showImage(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _nextImage() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % widget.images.length; // wrap around
    });
  }

  void _prevImage() {
    setState(() {
      _currentIndex =
          (_currentIndex - 1 + widget.images.length) % widget.images.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 900, maxHeight: 600),
      decoration: BoxDecoration(
        color: AppTheme.darkBackground,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          // Fullscreen image viewer
          Expanded(
            child: Stack(
              children: [
                Center(
                  child: InteractiveViewer(
                    child: Image.asset(
                      widget.images[_currentIndex],
                      fit: BoxFit.contain,
                    ),
                  ),
                ),

                // Left arrow
                Positioned(
                  left: 0,
                  top: 0,
                  bottom: 0,
                  child: IconButton(
                    iconSize: 40,
                    color: Colors.white.withValues(alpha: 0.7),
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: _prevImage,
                  ),
                ),

                // Right arrow
                Positioned(
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: IconButton(
                    iconSize: 40,
                    color: Colors.white.withValues(alpha: 0.7),
                    icon: const Icon(Icons.arrow_forward_ios),
                    onPressed: _nextImage,
                  ),
                ),
              ],
            ),
          ),

          // Thumbnails
          Container(
            height: 80,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.images.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => _showImage(index),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    padding:
                        _currentIndex == index
                            ? const EdgeInsets.all(2)
                            : EdgeInsets.zero,
                    decoration: BoxDecoration(
                      border:
                          _currentIndex == index
                              ? Border.all(
                                color: AppTheme.primaryCyan,
                                width: 2,
                              )
                              : null,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        widget.images[index],
                        width: 70,
                        height: 70,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

Widget holderContainer({
  required bool mobile,
  required String title,
  required String highlight,
  required Widget body,
  double horizontalMobilePadding = 20.0,
  double verticalMobilePadding = 20.0,
  double horizontalDesktopPadding = 80.0,
  double verticalDesktopPadding = 40.0,
  // double maxWidth = 1200.0,
  double sizedBox01Height = 16.0,
  double sizedBox02Height = 24.0,
  String? catchphrase,
  Color? color,
}) {
  return Container(
    color: color ?? AppTheme.darkBackground,
    padding: EdgeInsets.symmetric(
      horizontal: mobile ? horizontalMobilePadding : horizontalDesktopPadding,
      vertical: mobile ? verticalMobilePadding : verticalDesktopPadding,
    ),
    child: Center(
      child: Column(
        children: [
          SectionTitle(title: title, highlight: highlight),
          SizedBox(height: sizedBox01Height),
          if (catchphrase != '')
            Text(
              catchphrase ?? '',
              style: TextStyle(
                fontSize: mobile ? 14 : 16,
                color: AppTheme.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
          SizedBox(height: sizedBox02Height),
          body,
        ],
      ),
    ),
  );
}

extension ConditionalWrap on Widget {
  Widget wrapIf(bool condition, Widget Function(Widget child) builder) {
    return condition ? builder(this) : this;
  }
}
