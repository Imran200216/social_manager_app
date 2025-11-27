import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:social_manager_app/commons/widgets/widgets.dart';
import 'package:social_manager_app/core/themes/app_color_themes.dart';
import 'package:social_manager_app/core/utils/utils.dart';
import 'package:social_manager_app/features/auth/auth.dart';
import 'package:social_manager_app/core/constants/constants.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Responsive
    final isTablet = ResponsiveUtils.isTablet(context);
    final isMobile = ResponsiveUtils.isMobile(context);

    return Scaffold(
      backgroundColor: AppColorThemes.whiteColor,
      body: Padding(
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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 1),

            // Svg
            Align(
              alignment: Alignment.center,
              child: SvgPicture.asset(
                color: AppColorThemes.primaryColor,
                AppAssetsConstants.auth,
                height: isMobile
                    ? 200
                    : isTablet
                    ? 300
                    : 350,
              ),
            ),

            KVerticalSpacer(height: 30),

            // Title
            KText(
              text: "Enable passkeys",
              textAlign: TextAlign.center,
              color: AppColorThemes.titleColor,
              fontWeight: FontWeight.w700,
              fontSize: isMobile
                  ? 26
                  : isTablet
                  ? 28
                  : 32,
            ),

            KVerticalSpacer(height: 12),

            // Sub Title
            KText(
              text:
                  "Use Your face os fingerprint to verify it's\n you. No Password required",
              textAlign: TextAlign.center,
              color: AppColorThemes.subTitleColor,
              fontWeight: FontWeight.w600,
              fontSize: isMobile
                  ? 16
                  : isTablet
                  ? 18
                  : 20,
            ),

            const Spacer(flex: 2),

            // Google Sign In
            SocialBtn(
              btnTitle: "Continue with Google",
              btnBgColor: AppColorThemes.secondaryColor,
              btnTitleColor: AppColorThemes.whiteColor,
              borderColor: AppColorThemes.subTitleColor.withOpacity(0.2),
              onTap: () {
                // Bottom Nav
                context.pushReplacementNamed(AppRouterConstants.bottomNav);
              },
              borderRadius: 12,
              fontSize: isMobile
                  ? 16
                  : isTablet
                  ? 18
                  : 20,
              btnHeight: isMobile
                  ? 50
                  : isTablet
                  ? 54
                  : 60,
              btnWidth: double.maxFinite,
              svgIconPath: AppAssetsConstants.google,
              iconHeight: isMobile
                  ? 24
                  : isTablet
                  ? 26
                  : 28,
              iconWidth: isMobile
                  ? 24
                  : isTablet
                  ? 26
                  : 28,
            ),

            KVerticalSpacer(height: 20),

            // Apple Sign In
            SocialBtn(
              btnTitle: "Continue with Apple",
              btnBgColor: AppColorThemes.whiteColor,
              btnTitleColor: AppColorThemes.titleColor,
              borderColor: AppColorThemes.subTitleColor.withOpacity(0.2),
              onTap: () {},
              borderRadius: 12,
              fontSize: isMobile
                  ? 16
                  : isTablet
                  ? 18
                  : 20,
              btnHeight: isMobile
                  ? 50
                  : isTablet
                  ? 54
                  : 60,
              btnWidth: double.maxFinite,
              svgIconPath: AppAssetsConstants.apple,
              iconHeight: isMobile
                  ? 24
                  : isTablet
                  ? 26
                  : 28,
              iconWidth: isMobile
                  ? 24
                  : isTablet
                  ? 26
                  : 28,
            ),

            KVerticalSpacer(height: 30),

            // Terms of Service & Privacy Policy
            TermsFooter(onTermsTap: () {}, onPrivacyTap: () {}),
          ],
        ),
      ),
    );
  }
}
