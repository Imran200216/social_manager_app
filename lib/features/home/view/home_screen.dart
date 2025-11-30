import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:social_manager_app/core/themes/app_color_themes.dart';
import 'package:social_manager_app/l10n/app_localizations.dart';
import 'package:social_manager_app/commons/widgets/widgets.dart';
import 'package:social_manager_app/core/constants/constants.dart';
import 'package:social_manager_app/core/utils/utils.dart';
import 'package:social_manager_app/features/home/home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Responsive
    final isTablet = ResponsiveUtils.isTablet(context);
    final isMobile = ResponsiveUtils.isMobile(context);

    // AppLocalization
    final appLoc = AppLocalizations.of(context)!;

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: AppColorThemes.primaryColor,
          onPressed: () {
            // Haptics
            HapticFeedback.heavyImpact();

            // Scanner Screen
            context.pushNamed(AppRouterConstants.scanner);
          },
          icon: SvgPicture.asset(
            AppAssetsConstants.scanFilled,
            height: isMobile
                ? 20
                : isTablet
                ? 22
                : 24,
            fit: BoxFit.cover,
            color: AppColorThemes.whiteColor,
          ),
          label: KText(
            text: appLoc.scanQRCode,
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
          extendedIconLabelSpacing: 6,
        ),
        backgroundColor: AppColorThemes.whiteColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile
                  ? 20
                  : isTablet
                  ? 30
                  : 40,
              vertical: isMobile
                  ? 30
                  : isTablet
                  ? 40
                  : 50,
            ),
            child: Column(
              spacing: 20,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Greeting
                Greeting(
                  isMobile: isMobile,
                  isTablet: isTablet,
                  userName: "Mohammed Imran B",
                  appLoc: appLoc,
                ),

                // Total Impression
                TotalImpression(
                  isMobile: isMobile,
                  isTablet: isTablet,
                  appLoc: appLoc,
                  totalViewsCount: "23",
                  totalConnectionsCount: "4",
                  totalLinksAddedCount: "10",
                  totalImpressionCount: "200",
                  onAddLinkTap: () {
                    // Add Social Links Screen
                    context.pushNamed(AppRouterConstants.addSocialLinks);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
