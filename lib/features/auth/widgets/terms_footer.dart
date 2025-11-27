import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:social_manager_app/core/themes/app_color_themes.dart';
import 'package:social_manager_app/core/utils/utils.dart';

class TermsFooter extends StatelessWidget {
  final VoidCallback onTermsTap;
  final VoidCallback onPrivacyTap;

  const TermsFooter({
    super.key,
    required this.onTermsTap,
    required this.onPrivacyTap,
  });

  @override
  Widget build(BuildContext context) {
    final primary = AppColorThemes.primaryTextColor;

    // Responsive
    final isTablet = ResponsiveUtils.isTablet(context);
    final isMobile = ResponsiveUtils.isMobile(context);

    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: TextStyle(
          fontFamily: "Lato",
          color: Colors.black,
          fontSize: isMobile
              ? 14
              : isTablet
              ? 16
              : 18,
          height: 1.4,
        ),
        children: [
          const TextSpan(
            text:
                "By continuing, you confirm that you've read\nand agreed to the ",
          ),

          /// Terms of Service (Clickable)
          TextSpan(
            text: "Terms of Service",
            style: TextStyle(
              fontFamily: "Lato",
              color: primary,
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()..onTap = onTermsTap,
          ),

          const TextSpan(text: " and\n consent to the "),

          /// Privacy Policy (Clickable)
          TextSpan(
            text: "Privacy Policy",
            style: TextStyle(
              fontFamily: "Lato",
              color: primary,
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()..onTap = onPrivacyTap,
          ),

          const TextSpan(text: "."),
        ],
      ),
    );
  }
}
