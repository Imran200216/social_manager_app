import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:social_manager_app/core/themes/app_color_themes.dart';
import 'package:social_manager_app/l10n/app_localizations.dart';
import 'package:social_manager_app/commons/widgets/widgets.dart';
import 'package:social_manager_app/features/home/home.dart';

class TotalImpression extends StatelessWidget {
  final bool isMobile;
  final bool isTablet;
  final AppLocalizations appLoc;
  final String totalViewsCount;
  final String totalConnectionsCount;
  final String totalLinksAddedCount;
  final String totalImpressionCount;
  final VoidCallback onAddLinkTap;

  const TotalImpression({
    super.key,
    required this.isMobile,
    required this.isTablet,
    required this.appLoc,
    required this.totalViewsCount,
    required this.totalConnectionsCount,
    required this.totalLinksAddedCount,
    required this.totalImpressionCount,
    required this.onAddLinkTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColorThemes.whiteColor,
        border: Border.all(
          color: AppColorThemes.subTitleColor.withOpacity(0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Total Impression
              KText(
                text: appLoc.totalImpression,
                softWrap: true,
                maxLines: 2,
                textAlign: TextAlign.center,
                color: AppColorThemes.titleColor,
                fontWeight: FontWeight.w700,
                fontSize: isMobile
                    ? 16
                    : isTablet
                    ? 18
                    : 20,
              ),

              GestureDetector(
                onTap: () {
                  HapticFeedback.heavyImpact();

                  onAddLinkTap();
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColorThemes.primaryColor,
                  ),
                  child: Row(
                    spacing: 6,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add,
                        color: AppColorThemes.whiteColor,
                        size: isMobile
                            ? 20
                            : isTablet
                            ? 22
                            : 24,
                      ),

                      KText(
                        text: appLoc.addLinks,
                        softWrap: true,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        color: AppColorThemes.whiteColor,
                        fontWeight: FontWeight.w700,
                        fontSize: isMobile
                            ? 14
                            : isTablet
                            ? 16
                            : 18,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Total Impression Count
          KText(
            text: totalImpressionCount,
            softWrap: true,
            maxLines: 2,
            textAlign: TextAlign.center,
            color: AppColorThemes.titleColor,
            fontWeight: FontWeight.w800,
            fontSize: isMobile
                ? 24
                : isTablet
                ? 26
                : 28,
          ),

          KVerticalSpacer(height: 10),

          // Impression Split Container
          Row(
            children: [
              // Total Views
              Expanded(
                flex: 2,
                child: Stack(
                  children: [
                    Container(
                      height: isMobile
                          ? 60
                          : isTablet
                          ? 70
                          : 80,
                      decoration: BoxDecoration(
                        color: AppColorThemes.totalViewsBgColor,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                      ),
                    ),

                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: KText(
                        text: totalViewsCount,
                        softWrap: true,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        color: AppColorThemes.titleColor,
                        fontWeight: FontWeight.w800,
                        fontSize: isMobile
                            ? 22
                            : isTablet
                            ? 24
                            : 26,
                      ),
                    ),
                  ],
                ),
              ),

              // Total Links Added
              Expanded(
                flex: 2,
                child: Stack(
                  children: [
                    Container(
                      height: isMobile
                          ? 60
                          : isTablet
                          ? 70
                          : 80,
                      decoration: BoxDecoration(
                        color: AppColorThemes.totalLinksAddedBgColor,
                      ),
                    ),

                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: KText(
                        text: totalLinksAddedCount,
                        softWrap: true,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        color: AppColorThemes.titleColor,
                        fontWeight: FontWeight.w800,
                        fontSize: isMobile
                            ? 22
                            : isTablet
                            ? 24
                            : 26,
                      ),
                    ),
                  ],
                ),
              ),

              // Total Connections
              Expanded(
                flex: 2,
                child: Stack(
                  children: [
                    Container(
                      height: isMobile
                          ? 60
                          : isTablet
                          ? 70
                          : 80,
                      decoration: BoxDecoration(
                        color: AppColorThemes.totalConnectionsBgColor,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                    ),

                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: KText(
                        text: totalConnectionsCount,
                        softWrap: true,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        color: AppColorThemes.whiteColor,
                        fontWeight: FontWeight.w800,
                        fontSize: isMobile
                            ? 22
                            : isTablet
                            ? 24
                            : 26,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          KVerticalSpacer(height: 20),

          // Total Views
          TotalImpressionRepresentationListTile(
            circleAvatarBgColor: AppColorThemes.totalViewsBgColor,
            containerBgColor: AppColorThemes.totalViewsListTileBgColor,
            listTileTitle: appLoc.totalViews,
            listTileTrailingCount: totalViewsCount,
          ),

          KVerticalSpacer(height: 10),

          // Total Links Added
          TotalImpressionRepresentationListTile(
            circleAvatarBgColor: AppColorThemes.totalLinksAddedBgColor,
            containerBgColor: AppColorThemes.totalLinksAddedListTileBgColor,
            listTileTitle: appLoc.totalLinksAdded,
            listTileTrailingCount: totalLinksAddedCount,
          ),

          KVerticalSpacer(height: 10),

          // Total Connections
          TotalImpressionRepresentationListTile(
            circleAvatarBgColor: AppColorThemes.totalConnectionsBgColor,
            containerBgColor: AppColorThemes.totalConnectionsListTileBgColor,
            listTileTitle: appLoc.totalConnections,
            listTileTrailingCount: totalConnectionsCount,
          ),
        ],
      ),
    );
  }
}
