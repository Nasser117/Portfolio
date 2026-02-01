# Al-Nasser Haddad Portfolio - Flutter Web

A responsive, modern portfolio website built with Flutter Web.

## Features

- ✨ Fully responsive design (mobile, tablet, desktop)
- 🎨 Dark theme with cyan accents
- 🖱️ Smooth scrolling and hover effects
- 📱 Mobile-optimized navigation
- 🎯 Section-based layout
- 🔗 Social media integration

## Getting Started

### Prerequisites

- Flutter SDK (3.0.0 or higher)
- Web browser (Chrome recommended)

### Installation

1. Clone the repository
2. Navigate to the project directory
3. Run `flutter pub get` to install dependencies
4. Run `flutter run -d chrome` to launch in Chrome

### Build for Production
```bash
flutter build web --release
```

The output will be in the `build/web` directory.

## Project Structure
```
lib/
├── main.dart                 # App entry point
├── theme/
│   ├── app_theme.dart       # Theme configuration
│   └── app_constants.dart   # Constants and breakpoints
├── pages/
│   └── home_page.dart       # Main page with sections
└── widgets/
    ├── navigation_bar.dart  # Responsive navigation
    ├── footer.dart          # Footer component
    ├── sections/            # All section widgets
    └── [other widgets]      # Reusable components
```

## Customization

### Update Personal Information

Edit the text content in each section widget located in `lib/widgets/sections/`

### Change Colors

Modify the color constants in `lib/theme/app_theme.dart`

### Add Profile Image

1. Place your image in `assets/images/profile.png`
2. Update the CircleAvatar in `hero_section.dart`:
```dart
CircleAvatar(
  backgroundImage: AssetImage('assets/images/profile.png'),
)
```

3. Add to `pubspec.yaml` assets if not already there

## Deployment

### GitHub Pages
```bash
flutter build web --base-href /repository-name/
```

### Firebase Hosting
```bash
flutter build web
firebase deploy
```

### Netlify
Drag and drop the `build/web` folder to Netlify

## License

MIT License - feel free to use this project for your own portfolio!

## Contact

For questions or feedback, reach out via the contact form or social links.
```

--- .gitignore ---
```
# Miscellaneous
*.class
*.log
*.pyc
*.swp
.DS_Store
.atom/
.buildlog/
.history
.svn/
migrate_working_dir/

# IntelliJ related
*.iml
*.ipr
*.iws
.idea/

# The .vscode folder contains launch configuration and tasks you configure in
# VS Code which you may wish to be included in version control, so this line
# is commented out by default.
#.vscode/

# Flutter/Dart/Pub related
**/doc/api/
**/ios/Flutter/.last_build_id
.dart_tool/
.flutter-plugins
.flutter-plugins-dependencies
.packages
.pub-cache/
.pub/
/build/

# Web related
lib/generated_plugin_registrant.dart

# Symbolication related
app.*.symbols

# Obfuscation related
app.*.map.json

# Android Studio will place build artifacts here
/android/app/debug
/android/app/profile
/android/app/release