import 'package:flutter/material.dart';
import 'package:social_manager_app/core/themes/app_color_themes.dart';
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

    return Scaffold(
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
                    title: "Personal Info",
                    subtitle: "Manage your basic details",
                    onTap: () {},
                  ),

                  // Share
                  ProfileListTile(
                    leadingSvgPath: AppAssetsConstants.share,
                    title: "Share App",
                    subtitle: "Let others discover this app",
                    onTap: () {},
                  ),

                  // FAQ
                  ProfileListTile(
                    leadingSvgPath: AppAssetsConstants.faq,
                    title: "FAQ's",
                    subtitle: "Learn more about the app",
                    onTap: () {},
                  ),

                  // Support
                  ProfileListTile(
                    leadingSvgPath: AppAssetsConstants.support,
                    title: "Contact Support",
                    subtitle: "Reach out for any support",
                    onTap: () {},
                  ),

                  // Logout
                  ProfileListTile(
                    leadingSvgPath: AppAssetsConstants.logout,
                    title: "Logout",
                    subtitle: "Reach out for any support",
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
