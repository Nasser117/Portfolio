import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../theme/app_constants.dart';
import '../theme/app_theme.dart';
import '../widgets/widgets.dart';
import 'hero.dart';

class CustomNavigationBar extends StatefulWidget {
  final Function(String) onNavigate;

  const CustomNavigationBar({super.key, required this.onNavigate});

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final isMobileOrTablet = screenWidth < 750;

    double horizontalPadding;
    if (screenWidth < 600) {
      horizontalPadding = 16; // small mobile
    } else if (screenWidth < 900) {
      horizontalPadding = 24; // tablet
    } else {
      horizontalPadding = (screenWidth * 0.07).clamp(80, 200); // desktop
    }

    return Container(
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border(
          bottom: BorderSide(color: AppTheme.cardBackground, width: 1),
        ),
      ),
      child: Row(
        children: [
          //logo
          CircleAvatar(
            radius: 20, // Adjust size here
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage('assets/icons/nh01.jpg'),
          ),
          const Spacer(),
          if (!isMobileOrTablet) ..._buildDesktopNav(),
          if (isMobileOrTablet)
            Row(
              children: [
                Tooltip(
                  message: 'Download CV',
                  child: IconButton(
                    hoverColor: AppTheme.cardBackground,
                    onPressed: () => openUrlExternal(heroData['cvUrl']),
                    icon: Icon(FontAwesomeIcons.userTie),
                  ),
                ),
                _buildMobileDrawerButton(),
              ],
            ),
        ],
      ),
    );
  }

  List<Widget> _buildDesktopNav() {
    final screenWidth = MediaQuery.of(context).size.width;
    final items = ['Home', 'About', 'Skills', 'Projects', 'Courses', 'Contact'];
    double itemPadding = screenWidth < 1024 ? 6 : 12;

    return [
      ...items.map(
        (item) => Padding(
          padding: EdgeInsets.symmetric(horizontal: itemPadding),
          child: TextButton(
            onPressed: () => widget.onNavigate(item.toLowerCase()),
            child: Text(
              item,
              style: const TextStyle(
                color: AppTheme.textSecondary,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
      const SizedBox(width: 16),

      ElevatedButton(
        onPressed: () => openUrlExternal(heroData['cvUrl']),
        child: const Text('Download CV'),
      ),
      // downloadCVButton(heroData['cvUrl'])
    ];
  }

  Widget _buildMobileDrawerButton() {
    return Builder(
      builder:
          (context) => IconButton(
            icon: const Icon(Icons.menu, color: AppTheme.textPrimary),
            onPressed: () {
              Scaffold.of(
                context,
              ).openEndDrawer(); // opens the endDrawer from the scaffold
            },
          ),
    );
  }

  Widget buildMobileDrawer() {
    final items = ['Home', 'About', 'Skills', 'Projects', 'Courses', 'Contact'];
    return Drawer(
      child: Container(
        color: AppTheme.cardBackground,
        padding: const EdgeInsets.symmetric(vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...items.map(
              (item) => ListTile(
                title: Text(
                  item,
                  style: const TextStyle(
                    color: AppTheme.textPrimary,
                    fontSize: 16,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context); // close drawer
                  widget.onNavigate(item.toLowerCase());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//
class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final mobile = isMobile(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: mobile ? 24 : 80, vertical: 30),
      decoration: const BoxDecoration(
        color: Colors.black,
        border: Border(
          top: BorderSide(color: AppTheme.cardBackground, width: 1),
        ),
      ),
      child: Column(
        children: [
          Text(
            '© 2025 Al-Nasser Haddad. All rights reserved.',
            style: TextStyle(
              fontSize: mobile ? 12 : 14,
              color: AppTheme.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
