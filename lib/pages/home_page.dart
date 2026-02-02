
// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import '../sections/about_me.dart';
import '../sections/contact.dart';
import '../sections/courses_voluntreering.dart';
import '../sections/header_footer.dart';
import '../sections/hero.dart';
import '../sections/projects.dart';
import '../sections/skills.dart';
import '../sections/ui_ux.dart';
import '../theme/app_theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  final Map<String, GlobalKey> _sectionKeys = {
    'home': GlobalKey(),
    'about': GlobalKey(),
    'skills': GlobalKey(),
    'projects': GlobalKey(),
    'uiux': GlobalKey(),
    'courses': GlobalKey(),
    'volunteering': GlobalKey(),
    'contact': GlobalKey(),
  };

  void _scrollToSection(String section) {
    final key = _sectionKeys[section];
    if (key?.currentContext != null) {
      Scrollable.ensureVisible(
        key!.currentContext!,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
         endDrawer: Drawer(
        child: Container(
          color: AppTheme.cardBackground,
          padding: const EdgeInsets.symmetric(vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...['Home', 'About', 'Skills', 'Projects', 'Courses', 'Contact']
                  .map(
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
                    _scrollToSection(item.toLowerCase());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
        body: Stack(
          children: [
            SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  // ContactSection(key: _sectionKeys['contact']),

                  HeroSection(key: _sectionKeys['home']),
                  AboutMeSection(key: _sectionKeys['about']),
                  SkillsSection(key: _sectionKeys['skills']),
                  ProjectsSection(key: _sectionKeys['projects']),
                  UIUXSection(key: _sectionKeys['uiux']),
                  CoursesSection(key: _sectionKeys['courses']),
                  // VolunteeringSection(key: _sectionKeys['volunteering']),
                  ContactSection(key: _sectionKeys['contact']),
                  const Footer(),
                ],
              ),
            ),
            CustomNavigationBar(
              onNavigate: _scrollToSection,
            ),
          ],
        ),
      ),
    );
  }
}
