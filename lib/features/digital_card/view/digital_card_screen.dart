import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:social_manager_app/core/themes/app_color_themes.dart';
import 'package:social_manager_app/commons/widgets/widgets.dart';
import 'package:social_manager_app/core/constants/constants.dart';
import 'package:social_manager_app/core/utils/utils.dart';
import 'package:social_manager_app/l10n/app_localizations.dart';

class DigitalCardScreen extends StatelessWidget {
  const DigitalCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Responsive
    final isTablet = ResponsiveUtils.isTablet(context);
    final isMobile = ResponsiveUtils.isMobile(context);

    // Screen Height
    final screenHeight = MediaQuery.of(context).size.height;

    // App Localization
    final appLoc = AppLocalizations.of(context)!;

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: AppColorThemes.whiteColor,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Your Digital Card Text
                    KText(
                      text: appLoc.yourDigitalCard,
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

                    // Refresh
                    GestureDetector(
                      onTap: () {
                        // Haptics
                        HapticFeedback.heavyImpact();
                      },
                      child: SvgPicture.asset(
                        AppAssetsConstants.refresh,
                        height: isMobile
                            ? 24
                            : isTablet
                            ? 28
                            : 32,
                        color: AppColorThemes.primaryColor,
                      ),
                    ),
                  ],
                ),

                KVerticalSpacer(height: 20),

                SizedBox(
                  height: screenHeight * 0.6,
                  child: KNoFound(
                    svgPath: AppAssetsConstants.noDigitalCardFound,
                    title: appLoc.noDigitalCardFound,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
