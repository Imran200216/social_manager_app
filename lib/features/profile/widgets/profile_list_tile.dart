import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:social_manager_app/core/themes/app_color_themes.dart';
import 'package:social_manager_app/core/utils/utils.dart';

class ProfileListTile extends StatelessWidget {
  final String leadingSvgPath;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const ProfileListTile({
    super.key,
    required this.leadingSvgPath,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // Responsive
    final isTablet = ResponsiveUtils.isTablet(context);
    final isMobile = ResponsiveUtils.isMobile(context);

    return ListTile(
      splashColor: AppColorThemes.transparentColor,
      hoverColor: AppColorThemes.transparentColor,
      focusColor: AppColorThemes.transparentColor,
      tileColor: AppColorThemes.transparentColor,

      onTap: () {
        HapticFeedback.heavyImpact();

        onTap();
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          width: 0.8,
          color: AppColorThemes.subTitleColor.withOpacity(0.2),
        ),
      ),
      leading: Container(
        height: isMobile
            ? 44
            : isTablet
            ? 48
            : 52,
        width: isMobile
            ? 44
            : isTablet
            ? 48
            : 52,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColorThemes.primaryColor.withOpacity(0.15),
        ),
        child: Center(
          child: SvgPicture.asset(
            height: isMobile
                ? 24
                : isTablet
                ? 22
                : 28,
            leadingSvgPath,
            color: AppColorThemes.primaryColor,
          ),
        ),
      ),

      title: Text(title),
      titleTextStyle: TextStyle(
        color: AppColorThemes.titleColor,
        fontWeight: FontWeight.w600,
        fontFamily: "Lato",
        fontSize: isMobile
            ? 16
            : isTablet
            ? 18
            : 20,
      ),

      subtitle: Text(subtitle),
      subtitleTextStyle: TextStyle(
        color: AppColorThemes.subTitleColor,
        fontWeight: FontWeight.w600,
        fontFamily: "Lato",
        fontSize: isMobile
            ? 14
            : isTablet
            ? 16
            : 18,
      ),

      trailing: Icon(
        Icons.arrow_forward_ios,
        color: AppColorThemes.secondaryColor,
        size: isMobile
            ? 17
            : isTablet
            ? 19
            : 21,
      ),
    );
  }
}
