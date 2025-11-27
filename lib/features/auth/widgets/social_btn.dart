import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialBtn extends StatelessWidget {
  final String btnTitle;
  final Color btnBgColor;
  final Color btnTitleColor;
  final Color borderColor;
  final VoidCallback onTap;
  final bool isLoading;
  final double borderRadius;
  final double fontSize;
  final double btnHeight;
  final double btnWidth;
  final String? svgIconPath;
  final double iconHeight;
  final double iconWidth;

  const SocialBtn({
    super.key,
    required this.btnTitle,
    required this.btnBgColor,
    required this.btnTitleColor,
    required this.borderColor,
    required this.onTap,
    this.isLoading = false,
    required this.borderRadius,
    required this.fontSize,
    required this.btnHeight,
    required this.btnWidth,
    this.svgIconPath,
    this.iconHeight = 24.0,
    this.iconWidth = 24.0,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: isLoading
            ? null
            : () {
                HapticFeedback.heavyImpact();
                onTap();
              },
        child: Container(
          height: btnHeight,
          width: btnWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            color: btnBgColor,
            border: Border.all(color: borderColor, width: 1.5),
          ),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (svgIconPath != null)
                  SvgPicture.asset(
                    svgIconPath!,
                    height: iconHeight,
                    width: iconWidth,
                  ),
                if (svgIconPath != null) const SizedBox(width: 10),
                Text(
                  isLoading ? "Loading..." : btnTitle,
                  style: TextStyle(
                    fontFamily: "Lato",
                    color: btnTitleColor,
                    fontWeight: FontWeight.w600,
                    fontSize: fontSize,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
