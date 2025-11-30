import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:social_manager_app/core/themes/app_color_themes.dart';
import 'package:social_manager_app/core/utils/utils.dart';
import 'package:social_manager_app/l10n/app_localizations.dart';

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
    final primary = AppColorThemes.primaryColor;

    // Responsive
    final isTablet = ResponsiveUtils.isTablet(context);
    final isMobile = ResponsiveUtils.isMobile(context);

    // AppLocalization
    final appLoc = AppLocalizations.of(context)!;

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
          TextSpan(text: appLoc.termsPara),

          /// Terms of Service (Clickable)
          TextSpan(
            text: appLoc.termsOfService,
            style: TextStyle(
              fontFamily: "Lato",
              color: primary,
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()..onTap = onTermsTap,
          ),

          TextSpan(text: appLoc.termsConsent),

          /// Privacy Policy (Clickable)
          TextSpan(
            text: appLoc.privacyPolicy,
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
