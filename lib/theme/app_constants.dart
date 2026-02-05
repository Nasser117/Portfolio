import 'package:flutter/material.dart';

class AppConstants {
  // Breakpoints
  static const double mobileBreakpoint = 600;
  static const double tabletBreakpoint = 900;
  static const double desktopBreakpoint = 1200;

  // Spacing
  static const double spacingXxs = 4.0;
  static const double spacingXs = 8.0;
  static const double spacingS = 16.0;
  static const double spacingM = 24.0;
  static const double spacingL = 32.0;
  static const double spacingXl = 48.0;
  static const double spacingXxl = 64.0;

  static const double circularS = 10;
  static const double circularM = 12;
  static const double circularL = 16;

  // Max widths
  static const double maxContentWidth = 1200.0;
  static const double maxSectionWidth = 1400.0;

  // Animation durations
  static const Duration hoverDuration = Duration(milliseconds: 200);
  static const Duration scrollDuration = Duration(milliseconds: 600);

  // Social links
  static const String linkedInUrl = 'https://linkedin.com';
  static const String githubUrl = 'https://github.com';
  static const String twitterUrl = 'https://twitter.com';
  static const String email = 'contact@alnasser.com';
}

bool isMobile(BuildContext context) =>
    MediaQuery.of(context).size.width < AppConstants.mobileBreakpoint;

bool isTablet(BuildContext context) =>
    MediaQuery.of(context).size.width >= AppConstants.mobileBreakpoint &&
    MediaQuery.of(context).size.width < AppConstants.desktopBreakpoint;

bool isDesktop(BuildContext context) =>
    MediaQuery.of(context).size.width >= AppConstants.desktopBreakpoint;
