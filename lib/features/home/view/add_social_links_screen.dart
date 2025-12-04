import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:social_manager_app/core/constants/app_assets_constants.dart';
import 'package:social_manager_app/core/themes/app_color_themes.dart';
import 'package:social_manager_app/features/home/home.dart';
import 'package:social_manager_app/l10n/app_localizations.dart';
import 'package:social_manager_app/core/utils/utils.dart';
import 'package:social_manager_app/commons/widgets/widgets.dart';

class AddSocialLinksScreen extends StatefulWidget {
  const AddSocialLinksScreen({super.key});

  @override
  State<AddSocialLinksScreen> createState() => _AddSocialLinksScreenState();
}

class _AddSocialLinksScreenState extends State<AddSocialLinksScreen> {
  // Inside your widget:
  int selectedIndex = -1;

  // Controllers
  final TextEditingController _urlOrUsernameController =
      TextEditingController();
  final TextEditingController _displayNameController = TextEditingController();

  @override
  void dispose() {
    _urlOrUsernameController.dispose();
    _displayNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Responsive
    final isTablet = ResponsiveUtils.isTablet(context);
    final isMobile = ResponsiveUtils.isMobile(context);

    // AppLocalization
    final appLoc = AppLocalizations.of(context)!;

    // Screen Height
    final screenHeight = MediaQuery.of(context).size.height;

    final List<String> socialIcons = [
      AppAssetsConstants.instagram,
      AppAssetsConstants.facebook,
      AppAssetsConstants.linkedin,
      AppAssetsConstants.tiktok,
      AppAssetsConstants.github,
      AppAssetsConstants.youtube,
      AppAssetsConstants.pinterest,
      AppAssetsConstants.medium,
      AppAssetsConstants.snapchat,
    ];

    final List<Color> socialIconThemeColors = [
      Color(0xFFE1306C), // Instagram
      Color(0xFF1877F2), // Facebook
      Color(0xFF0A66C2), // LinkedIn
      Color(0xFF000000), // TikTok
      Color(0xFF181717), // GitHub
      Color(0xFFFF0000), // YouTube
      Color(0xFFE60023), // Pinterest
      Color(0xFF000000), // Medium
      Color(0xFF000000), // Snapchat
    ];

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: KAppBar(
          title: appLoc.addMoreSocialProfiles,
          centerTitle: false,
          onBack: () {
            // Back
            context.pop();
          },
        ),

        bottomNavigationBar: Container(
          height: isMobile
              ? screenHeight * 0.12
              : isTablet
              ? screenHeight * 0.2
              : screenHeight * 0.22,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: AppColorThemes.whiteColor,
            border: Border(
              top: BorderSide(
                color: AppColorThemes.subTitleColor.withOpacity(0.2),
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              spacing: 20,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Cancel Btn
                Expanded(
                  flex: 1,
                  child: KOutlinedBtn(
                    btnTitle: appLoc.clear,
                    onTap: () {},
                    borderRadius: 10,
                    fontSize: isMobile
                        ? 14
                        : isTablet
                        ? 16
                        : 18,
                    btnHeight: isMobile
                        ? 50
                        : isTablet
                        ? 55
                        : 60,
                    btnWidth: double.maxFinite,
                  ),
                ),

                Expanded(
                  flex: 1,
                  child: KFilledBtn(
                    btnTitle: appLoc.addSocialProfile,
                    btnBgColor: AppColorThemes.primaryColor,
                    btnTitleColor: AppColorThemes.whiteColor,
                    onTap: () {},
                    borderRadius: 10,
                    fontSize: isMobile
                        ? 14
                        : isTablet
                        ? 16
                        : 18,
                    btnHeight: isMobile
                        ? 50
                        : isTablet
                        ? 55
                        : 60,
                    btnWidth: double.maxFinite,
                  ),
                ),
              ],
            ),
          ),
        ),

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
                // Select Social Platform
                KText(
                  text: appLoc.selectSocialPlatform,
                  softWrap: true,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  color: AppColorThemes.titleColor,
                  fontWeight: FontWeight.w600,
                  fontSize: isMobile
                      ? 16
                      : isTablet
                      ? 18
                      : 20,
                ),

                KVerticalSpacer(height: 10),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: AppColorThemes.secondaryColor.withOpacity(0.2),
                      width: 0.8,
                    ),
                  ),
                  child: Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: List.generate(
                      socialIcons.length,
                      (index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: CircleAvatar(
                          radius: isMobile
                              ? 24
                              : isTablet
                              ? 26
                              : 28,
                          backgroundColor: selectedIndex == index
                              ? (index == 8
                                    ? Color(0xFFFFFC00).withOpacity(
                                        0.25,
                                      ) // Snapchat yellow tint
                                    : socialIconThemeColors[index].withOpacity(
                                        0.15,
                                      ))
                              : AppColorThemes.transparentColor,

                          child: SvgPicture.asset(
                            socialIcons[index],
                            height: isMobile
                                ? 24
                                : isTablet
                                ? 26
                                : 28,
                            width: isMobile
                                ? 24
                                : isTablet
                                ? 26
                                : 28,
                            color: selectedIndex == index
                                ? (index == 8
                                      ? Colors
                                            .black // Snapchat icon must be black
                                      : socialIconThemeColors[index])
                                : null,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                KVerticalSpacer(height: 30),

                // Url Or User Name
                BlocBuilder<ToggleUserNameUrlCubit, ToggleUserNameUrlState>(
                  builder: (context, state) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Text Field Label
                        KText(
                          text: state.isUrl
                              ? appLoc.displayName
                              : appLoc.enterSocialProfileUrl,
                          softWrap: true,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          color: AppColorThemes.titleColor,
                          fontWeight: FontWeight.w600,
                          fontSize: isMobile
                              ? 16
                              : isTablet
                              ? 18
                              : 20,
                        ),

                        // Use Username or Use Social Profile Url
                        GestureDetector(
                          onTap: () {
                            context.read<ToggleUserNameUrlCubit>().toggle();
                          },
                          child: KText(
                            text: state.isUrl ? appLoc.useUrl : appLoc.userName,
                            softWrap: true,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            color: AppColorThemes.primaryColor,
                            fontWeight: FontWeight.w500,
                            fontSize: isMobile
                                ? 13
                                : isTablet
                                ? 15
                                : 17,
                          ),
                        ),
                      ],
                    );
                  },
                ),

                KVerticalSpacer(height: 10),

                // Url Or User Name TextFormField
                KTextFormField(
                  controller: _urlOrUsernameController,
                  hintText: "eg: http://instagram.com/imran_dev",
                ),

                KVerticalSpacer(height: 20),

                // Display Name TextFormField
                KTextFormField(
                  labelText: "${appLoc.displayName} (${appLoc.optional})",
                  controller: _displayNameController,
                  hintText: "eg: ImranDev",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
