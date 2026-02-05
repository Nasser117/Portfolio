import 'dart:async';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_v_1_0/sections/hero.dart';
import '../theme/app_constants.dart';
import '../theme/app_theme.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../widgets/widgets.dart';

// =======================
// NO DATA NEEDED HERE
// =======================
class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final mobile = isMobile(context);

    return holderContainer(
      mobile: mobile,
      horizontalMobilePadding: AppConstants.spacingS,
      horizontalDesktopPadding: 80,
      verticalMobilePadding: 40,
      verticalDesktopPadding: AppConstants.spacingXxl,
      title: 'Let\'s Work',
      highlight: 'Together',
      sizedBox01Height: AppConstants.spacingS,
      catchphrase: 'Have a project in mind? Let\'s bring your ideas to life.',
      sizedBox02Height: AppConstants.spacingXxl,
      //remove const if breaks
      body: const WorkForm(),
    );
  }
}

Widget _buildTextField({
  required TextEditingController controller,
  required String label,
  required String hint,
  required bool enabled,
  TextInputType? keyboardType,
  int maxLines = 1,
  String? Function(String?)? validator,
  TextInputAction? textInputAction,
  int? maxLength,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppTheme.textPrimary,
        ),
      ),
      const SizedBox(height: AppConstants.spacingXs),
      TextFormField(
        buildCounter:
            (
              context, {
              required currentLength,
              required isFocused,
              maxLength,
            }) => null,

        maxLength: maxLength, // name
        textInputAction: textInputAction,
        enabled: enabled,
        controller: controller,
        keyboardType: keyboardType,
        maxLines: maxLines,
        style: const TextStyle(color: AppTheme.textPrimary),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            color: AppTheme.textSecondary.withValues(alpha: 0.5),
          ),
          filled: true,
          fillColor: AppTheme.cardBackground,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppConstants.circularS),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.all(AppConstants.spacingS),
        ),
        validator:
            validator ??
            (value) {
              if (value == null || value.trim().isEmpty) {
                return 'This field is required';
              }
              return null;
            },
      ),
    ],
  );
}

Widget buildContactRow(BuildContext context, {required bool isMobile}) {
  // Define the common social buttons to avoid repetition
  Widget linkedinBtn = IconButton(
    onPressed: () => openUrlExternal(heroData['socials'][0]['url']),
    icon: Image.asset(
      "assets/icons/linkedin.png",
      width: AppConstants.spacingM,
      height: AppConstants.spacingM,
    ),
    padding: EdgeInsets.zero,
    constraints: const BoxConstraints(),
  );

  Widget githubBtn = IconButton(
    onPressed: () => openUrlExternal(heroData['socials'][2]['url']),
    icon: const Icon(FontAwesomeIcons.github, color: Colors.white),
    padding: EdgeInsets.zero,
    constraints: const BoxConstraints(),
  );

  Widget gmailSection = InkWell(
    onTap: () => openUrlExternal(heroData['socials'][1]['url']),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () => {},

          icon: Image.asset(
            "assets/icons/gmail.png",
            width: AppConstants.spacingM,
            height: AppConstants.spacingM,
          ),
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        ),
        const SizedBox(width: AppConstants.spacingXs),
        Text(
          'alnaser.h@gmail.com',
          style: TextStyle(
            fontSize: isMobile ? 16 : 18,
            color: AppTheme.primaryCyan,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    ),
  );

  // If Mobile: Stack them in a Column
  if (isMobile) {
    return Column(
      children: [
        gmailSection,
        const SizedBox(height: AppConstants.spacingS),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: AppConstants.spacingL, // XL spacing
          children: [linkedinBtn, githubBtn],
        ),
      ],
    );
  }

  // If Desktop: Spread them in a Row
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [linkedinBtn, gmailSection, githubBtn],
  );
}

class WorkForm extends StatefulWidget {
  const WorkForm({super.key});

  @override
  State<WorkForm> createState() => _WorkFormState();
}

class _WorkFormState extends State<WorkForm> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _messageController;

  bool _sending = false;

  @override
  void initState() {
    super.initState();
    _initControllers();
  }

  void _initControllers() {
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _messageController = TextEditingController();
  }

  Future<void> sendForm() async {
    if (_sending) return;
    if (!_formKey.currentState!.validate()) return;

    setState(() => _sending = true);

    final uri = Uri.parse('https://formspree.io/f/mvzqajkn');

    try {
      final response = await http
          .post(
            uri,
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
            body: jsonEncode({
              'name': _nameController.text.trim(),
              'email': _emailController.text.trim(),
              'message': _messageController.text.trim(),
            }),
          )
          .timeout(const Duration(seconds: 15));

      if (!mounted) return;

      if (response.statusCode == 200 || response.statusCode == 201) {
        // 🔥 THE FIX: recreate controllers
        setState(() {
          _nameController.dispose();
          _emailController.dispose();
          _messageController.dispose();
          _initControllers();
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Message sent successfully!')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Server error (${response.statusCode}). Try again later.',
            ),
          ),
        );
      }
    } on TimeoutException {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Request timed out.')));
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Network error.')));
    } finally {
      if (mounted) {
        setState(() => _sending = false);
      }
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mobile = isMobile(context);

    return Column(
      children: [
        Form(
          key: _formKey,
          child: Column(
            spacing: AppConstants.spacingM,
            children: [
              _buildTextField(
                controller: _nameController,
                label: 'Name',
                hint: 'Your name',
                enabled: !_sending,
                maxLength: 100,
                textInputAction: TextInputAction.next,
              ),
              //
              _buildTextField(
                controller: _emailController,
                label: 'Email',
                hint: 'your.email@example.com',
                enabled: !_sending,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Email is required';
                  }
                  final emailRegex = RegExp(
                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                  );
                  if (!emailRegex.hasMatch(value.trim())) {
                    return 'Enter a valid email';
                  }
                  return null;
                },
              ),
              //
              _buildTextField(
                controller: _messageController,
                label: 'Message',
                hint: 'Tell me about your project...',
                enabled: !_sending,
                maxLines: 6,
                maxLength: 1000,
                textInputAction: TextInputAction.newline,
              ),
              //
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _sending ? null : sendForm,
                  child: Text(_sending ? 'Sending...' : 'Send Message'),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppConstants.spacingS),
        buildContactRow(context, isMobile: mobile),
      ],
    );
  }
}
