import 'package:flutter/material.dart';
import 'package:social_manager_app/commons/widgets/k_text.dart';
import 'package:social_manager_app/core/themes/app_color_themes.dart';
import 'package:social_manager_app/l10n/app_localizations.dart';
import 'package:social_manager_app/core/utils/utils.dart';

class Greeting extends StatelessWidget {
  final bool isMobile;
  final bool isTablet;
  final String userName;
  final AppLocalizations appLoc;

  const Greeting({
    super.key,
    required this.isMobile,
    required this.isTablet,
    required this.userName,
    required this.appLoc,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // Your Connection Text
        KText(
          text: "${appLoc.hi}, $userName",
          softWrap: true,
          maxLines: 2,
          textAlign: TextAlign.center,
          color: AppColorThemes.titleColor,
          fontWeight: FontWeight.w700,
          fontSize: isMobile
              ? 20
              : isTablet
              ? 22
              : 24,
        ),

        // Greetings
        KText(
          text: getGreetingUtils(appLoc),
          softWrap: true,
          maxLines: 2,
          textAlign: TextAlign.center,
          color: AppColorThemes.subTitleColor,
          fontWeight: FontWeight.w700,
          fontSize: isMobile
              ? 16
              : isTablet
              ? 18
              : 20,
        ),
      ],
    );
  }
}
