import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:social_manager_app/core/themes/app_color_themes.dart';
import 'package:social_manager_app/core/utils/url_launcher_utils.dart';
import 'package:social_manager_app/core/utils/utils.dart';
import 'package:social_manager_app/features/profile/profile.dart';
import 'package:social_manager_app/l10n/app_localizations.dart';
import 'package:social_manager_app/commons/widgets/widgets.dart';
import 'package:social_manager_app/core/constants/constants.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Avatar
                ProfileAvatar(
                  personImageUrl:
                      "https://plus.unsplash.com/premium_photo-1681493353999-a3eea8b95e1d?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                  height: isMobile
                      ? 100
                      : isTablet
                      ? 120
                      : 140,
                  width: isMobile
                      ? 100
                      : isTablet
                      ? 120
                      : 140,
                ),

                KVerticalSpacer(height: 8),

                // Title
                KText(
                  text: "Kenny Jackson",
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

                KVerticalSpacer(height: 3),

                // Sub Title
                KText(
                  text: "kennyJackson162002@gmail.com",
                  textAlign: TextAlign.center,
                  softWrap: true,
                  maxLines: 3,
                  color: AppColorThemes.subTitleColor,
                  fontWeight: FontWeight.w600,
                  fontSize: isMobile
                      ? 14
                      : isTablet
                      ? 16
                      : 18,
                ),

                KVerticalSpacer(height: 40),

                Column(
                  spacing: 14,
                  children: [
                    // Personal Info
                    ProfileListTile(
                      leadingSvgPath: AppAssetsConstants.profileOutlined,
                      title: appLoc.personalInfo,
                      subtitle: appLoc.personalInfoDescription,
                      onTap: () {
                        // Profile Personal Info Screen
                        context.pushNamed(
                          AppRouterConstants.profilePersonalInfo,
                        );
                      },
                    ),

                    // Language Preference
                    ProfileListTile(
                      leadingSvgPath: AppAssetsConstants.language,
                      title: appLoc.languagePreference,
                      subtitle: appLoc.languagePreferenceDescription,
                      onTap: () {
                        // Profile Localization Screen
                        context.pushNamed(
                          AppRouterConstants.profileLocalization,
                        );
                      },
                    ),

                    // Profile Views
                    ProfileListTile(
                      leadingSvgPath: AppAssetsConstants.view,
                      title: appLoc.profileViews,
                      subtitle: appLoc.profileViewsDescription,
                      onTap: () {
                        // Profile Views Screen
                        context.pushNamed(AppRouterConstants.profileView);
                      },
                    ),

                    // Share
                    ProfileListTile(
                      leadingSvgPath: AppAssetsConstants.share,
                      title: appLoc.shareApp,
                      subtitle: appLoc.shareAppDescription,
                      onTap: () {
                        // Share App
                        UrlLauncherUtils.launchUrlLink(
                          AppContentConstants.shareApp,
                        );
                      },
                    ),

                    // FAQ
                    ProfileListTile(
                      leadingSvgPath: AppAssetsConstants.faq,
                      title: appLoc.faq,
                      subtitle: appLoc.faqDescription,
                      onTap: () {
                        // FAQ
                        UrlLauncherUtils.launchUrlLink(AppContentConstants.faq);
                      },
                    ),

                    // Privacy policy
                    ProfileListTile(
                      leadingSvgPath: AppAssetsConstants.privacyPolicy,
                      title: appLoc.privacyPolicy,
                      subtitle: appLoc.privacyPolicyDescription,
                      onTap: () {
                        // Privacy Policy
                        UrlLauncherUtils.launchUrlLink(
                          AppContentConstants.privacyPolicy,
                        );
                      },
                    ),

                    // Support
                    ProfileListTile(
                      leadingSvgPath: AppAssetsConstants.support,
                      title: appLoc.contactSupport,
                      subtitle: appLoc.contactSupportDescription,
                      onTap: () {
                        // Support
                        UrlLauncherUtils.launchUrlLink(
                          AppContentConstants.contactSupport,
                        );
                      },
                    ),

                    // Logout
                    ProfileListTile(
                      leadingSvgPath: AppAssetsConstants.logout,
                      title: appLoc.logout,
                      subtitle: appLoc.logoutDescription,
                      onTap: () {
                        // Localization Screen
                        context.goNamed(AppRouterConstants.localization);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
