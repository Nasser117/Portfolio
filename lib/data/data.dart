import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../theme/app_theme.dart';

final Map<String, dynamic> heroData = {
  // Avatar image
  'avatar': 'assets/images/me.png',
  // Name & title
  'name': 'Al-Nasser Haddad',
  'subtitle': 'Software Engineer | Flutter Developer | UI/UX Enthusiast',
  'description':
      'Crafting beautiful, performant mobile experiences that users love',
  // Buttons URLs
  'cvUrl': 'https://raw.githubusercontent.com/Nasser117/CV/main/Al-Nasser_Haddad_CV_2026.pdf',
  // https://github.com/Nasser117/CV/blob/c89748a0869a0bb3bd52bbfa59a0c6e5abc0c537/Al-Nasser%20Haddad%20CV%20-%202026.pdf
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




final Map<String, dynamic> aboutMeData = {
  'description':
      '''I'm a passionate mobile developer specializing in Flutter, with a keen eye for design and user experience. With 3+ years of experience, I transform ideas into polished, production-ready applications.

My approach combines technical excellence with creative problem-solving, ensuring every app I build is not just functional, but delightful to use.''',
};




final List<Map<String, dynamic>> skillsData = [
  {
    'icon': Icons.code,
    'title': 'Languages',
    'skills': ['Dart', 'Java', 'Python'],
  },
  {
    'icon': FontAwesomeIcons.mobileScreen,
    'title': 'Frameworks',
    'skills': ['Flutter'],
  },
  {
    'icon': FontAwesomeIcons.wrench,
    'title': 'Tools',
    'skills': ['Figma', 'GitHub', 'Draw IO'],
  },
  {
    'icon': FontAwesomeIcons.lightbulb,
    'title': 'Strengths',
    'skills': [
      'Mobile Architecture',
      'Clean UI Implementation',
      'UX-Oriented Development',
    ],
  },
];




List<Map<String, dynamic>> projectsData() {
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



List<Map<String, dynamic>> uxData() {
  return [
    {
      'title': 'Fix Me',
      'design_goal':
          'A personal productivity and habit tracking app that utilizes visual analytics and streak systems to help users build lasting daily routines.',
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
        'assets/images/fixme.png',
      ],
    },
  ];
}




final List<Map<String, dynamic>> coursesData = [
  {
    'title': 'Google IT Support',
    'platform': 'Google',
    'year': '2025',
    'borderColor': AppTheme.primaryCyan,
    'url':
        'https://www.coursera.org/professional-certificates/google-it-support',
    'icon': 'assets/icons/google.png',
    'description':
        'Developed foundational skills in troubleshooting, customer service, networking, and system administration.',
  },
  {
    'title': 'Google UX Design',
    'platform': 'Google',
    'year': '2025',
    'borderColor': AppTheme.accentYellow,
    'url':
        'https://www.coursera.org/professional-certificates/google-ux-design',
    'icon': 'assets/icons/google.png',
    'description':
        'Mastered the end-to-end design process, from user research and wireframing to high-fidelity prototyping.',
  },
  {
    'title': 'Google Project Management',
    'platform': 'Google',
    'year': '2024',
    'borderColor': AppTheme.primaryCyan,
    'url':
        'https://www.coursera.org/professional-certificates/google-project-management',
    'icon': 'assets/icons/google.png',
    'description':
        'Proficient in Agile and Waterfall methodologies, stakeholder communication, and managing project lifecycles.',
  },
  {
    'title': 'Cybersecurity Fundamentals Specialization',
    'platform': 'IBM',
    'year': '2026',
    'borderColor': AppTheme.accentYellow,
    'url':
        'https://www.coursera.org/specializations/cybersecurity-fundamentals',
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
    {
    'organization': 'Damascus International Book Fair',
    'date': 'Feb 2026',
    'logo': 'assets/images/fair.png',
    'url': 'https://aisyria.org/',
    'borderColor': AppTheme.primaryCyan,
    'description':
        'Provided on-site support to bookstores, publishing houses, and visitors throughout the fair. Responsibilities included coordinating logistics, providing maintenance assistance, and handling visitor requests—all while demonstrating strong teamwork and the ability to work effectively under pressure.',
  },
];




