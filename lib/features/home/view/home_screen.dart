import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:social_manager_app/core/themes/app_color_themes.dart';
import 'package:social_manager_app/l10n/app_localizations.dart';
import 'package:social_manager_app/commons/widgets/widgets.dart';
import 'package:social_manager_app/core/constants/constants.dart';
import 'package:social_manager_app/core/utils/utils.dart';

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
                ? 24
                : isTablet
                ? 26
                : 28,
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
                ? 16
                : isTablet
                ? 18
                : 20,
          ),
          extendedIconLabelSpacing: 6,
        ),
        backgroundColor: AppColorThemes.whiteColor,
        body: Center(child: Text("hi home")),
      ),
    );
  }
}
