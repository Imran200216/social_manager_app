import 'package:flutter/material.dart';
import 'package:social_manager_app/core/themes/app_color_themes.dart';
import 'package:social_manager_app/commons/widgets/widgets.dart';
import 'package:social_manager_app/core/utils/utils.dart';

class TotalImpressionRepresentationListTile extends StatelessWidget {
  final Color circleAvatarBgColor;
  final Color containerBgColor;
  final String listTileTitle;
  final String listTileTrailingCount;

  const TotalImpressionRepresentationListTile({
    super.key,
    required this.circleAvatarBgColor,
    required this.containerBgColor,
    required this.listTileTitle,
    required this.listTileTrailingCount,
  });

  @override
  Widget build(BuildContext context) {
    // Responsive
    final isTablet = ResponsiveUtils.isTablet(context);
    final isMobile = ResponsiveUtils.isMobile(context);

    return Container(
      decoration: BoxDecoration(
        color: containerBgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        dense: true,
        minVerticalPadding: 0,
        minLeadingWidth: 0,
        leading: CircleAvatar(
          backgroundColor: circleAvatarBgColor,
          radius: isMobile
              ? 8
              : isTablet
              ? 10
              : 12,
        ),

        title: Text(listTileTitle),
        titleTextStyle: TextStyle(
          color: AppColorThemes.titleColor,
          fontFamily: "Lato",
          fontSize: isMobile
              ? 14
              : isTablet
              ? 16
              : 18,
          fontWeight: FontWeight.w600,
        ),
        trailing: KText(
          text: listTileTrailingCount,
          softWrap: true,
          maxLines: 2,
          textAlign: TextAlign.center,
          color: AppColorThemes.titleColor,
          fontWeight: FontWeight.w800,
          fontSize: isMobile
              ? 14
              : isTablet
              ? 16
              : 18,
        ),
      ),
    );
  }
}
