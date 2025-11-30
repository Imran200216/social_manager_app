import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:social_manager_app/core/themes/app_color_themes.dart';
import 'package:social_manager_app/core/utils/utils.dart';

class LanguageTile extends StatelessWidget {
  final String title;
  final String flagAsset;

  final bool value;
  final ValueChanged<bool?> onChanged;

  final Color bgColor;
  final Color borderColor;
  final Color textColor;
  final Color checkColor;
  final Color checkBoxBorderColor;

  const LanguageTile({
    super.key,
    required this.title,
    required this.flagAsset,
    required this.value,
    required this.onChanged,
    required this.bgColor,
    required this.borderColor,
    required this.textColor,
    required this.checkColor,
    required this.checkBoxBorderColor,
  });

  @override
  Widget build(BuildContext context) {
    // Responsive
    final isTablet = ResponsiveUtils.isTablet(context);
    final isMobile = ResponsiveUtils.isMobile(context);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor, width: 1),
      ),
      child: CheckboxListTile(
        value: value,
        onChanged: (bool? newValue) {
          // Add haptic feedback
          HapticFeedback.selectionClick();
          // Call the original callback
          onChanged(newValue);
        },
        title: Text(
          title,
          style: TextStyle(
            color: textColor,
            fontSize: isMobile
                ? 16
                : isTablet
                ? 18
                : 20,
            fontWeight: FontWeight.w600,
            fontFamily: "Lato",
          ),
        ),
        activeColor: AppColorThemes.whiteColor,
        // you can also make this configurable
        checkboxShape: CircleBorder(
          side: BorderSide(color: checkBoxBorderColor),
        ),
        checkColor: checkColor,

        secondary: ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: SvgPicture.asset(flagAsset, height: 32, fit: BoxFit.cover),
        ),

        controlAffinity: ListTileControlAffinity.trailing,
        contentPadding: EdgeInsets.zero,
      ),
    );
  }
}
