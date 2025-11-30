import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:social_manager_app/core/themes/app_color_themes.dart';
import 'package:social_manager_app/l10n/app_localizations.dart';
import 'package:social_manager_app/commons/widgets/widgets.dart';
import 'package:social_manager_app/core/constants/constants.dart';
import 'package:social_manager_app/core/utils/utils.dart';
import 'package:social_manager_app/features/localization/localization.dart';

class ProfileLocalizationScreen extends StatelessWidget {
  const ProfileLocalizationScreen({super.key});

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
        appBar: KAppBar(
          onBack: () {
            // Back
            context.pop();
          },
          title: appLoc.languagePreference,
          centerTitle: false,
        ),

        body: SafeArea(
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
                // Title
                KText(
                  text: appLoc.chooseYourLanguage,
                  textAlign: TextAlign.start,
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
                  text: appLoc.chooseYourLanguageDescription,
                  textAlign: TextAlign.start,
                  softWrap: true,
                  maxLines: 3,
                  color: AppColorThemes.subTitleColor,
                  fontWeight: FontWeight.w600,
                  fontSize: isMobile
                      ? 16
                      : isTablet
                      ? 18
                      : 20,
                ),

                KVerticalSpacer(height: 30),

                // Language Option
                BlocBuilder<LocalizationCubit, LocalizationState>(
                  builder: (context, state) {
                    final cubit = context.read<LocalizationCubit>();
                    final selectedLang = cubit.selectedLanguage;

                    return Column(
                      children: [
                        // English
                        LanguageTile(
                          title: "United States (English)",
                          flagAsset: AppAssetsConstants.us,
                          value: selectedLang == "en",
                          onChanged: (val) => cubit.selectLanguage("en"),
                          bgColor: selectedLang == "en"
                              ? AppColorThemes.primaryColor
                              : AppColorThemes.whiteColor,
                          borderColor: selectedLang == "en"
                              ? AppColorThemes.whiteColor
                              : AppColorThemes.subTitleColor.withOpacity(0.2),
                          textColor: selectedLang == "en"
                              ? AppColorThemes.whiteColor
                              : AppColorThemes.titleColor,
                          checkColor: selectedLang == "en"
                              ? AppColorThemes.primaryColor
                              : AppColorThemes.subTitleColor,
                          checkBoxBorderColor: selectedLang == "en"
                              ? AppColorThemes.secondaryColor
                              : AppColorThemes.subTitleColor,
                        ),

                        // Hindi
                        LanguageTile(
                          title: "India (Hindi)",
                          flagAsset: AppAssetsConstants.india,
                          value: selectedLang == "hi",
                          onChanged: (val) => cubit.selectLanguage("hi"),
                          bgColor: selectedLang == "hi"
                              ? AppColorThemes.primaryColor
                              : AppColorThemes.whiteColor,
                          borderColor: selectedLang == "hi"
                              ? AppColorThemes.whiteColor
                              : AppColorThemes.subTitleColor.withOpacity(0.2),
                          textColor: selectedLang == "hi"
                              ? AppColorThemes.whiteColor
                              : AppColorThemes.titleColor,
                          checkColor: selectedLang == "hi"
                              ? AppColorThemes.primaryColor
                              : AppColorThemes.subTitleColor,
                          checkBoxBorderColor: selectedLang == "hi"
                              ? AppColorThemes.secondaryColor
                              : AppColorThemes.subTitleColor,
                        ),

                        // Arabic
                        LanguageTile(
                          title: "United Arab Emirates (Arabic)",
                          flagAsset: AppAssetsConstants.uae,
                          value: selectedLang == "ar",
                          onChanged: (val) => cubit.selectLanguage("ar"),
                          bgColor: selectedLang == "ar"
                              ? AppColorThemes.primaryColor
                              : AppColorThemes.whiteColor,
                          borderColor: selectedLang == "ar"
                              ? AppColorThemes.whiteColor
                              : AppColorThemes.subTitleColor.withOpacity(0.2),
                          textColor: selectedLang == "ar"
                              ? AppColorThemes.whiteColor
                              : AppColorThemes.titleColor,
                          checkColor: selectedLang == "ar"
                              ? AppColorThemes.primaryColor
                              : AppColorThemes.subTitleColor,
                          checkBoxBorderColor: selectedLang == "ar"
                              ? AppColorThemes.secondaryColor
                              : AppColorThemes.subTitleColor,
                        ),

                        // French
                        LanguageTile(
                          title: "France (French)",
                          flagAsset: AppAssetsConstants.french,
                          value: selectedLang == "fr",
                          onChanged: (val) => cubit.selectLanguage("fr"),
                          bgColor: selectedLang == "fr"
                              ? AppColorThemes.primaryColor
                              : AppColorThemes.whiteColor,
                          borderColor: selectedLang == "fr"
                              ? AppColorThemes.whiteColor
                              : AppColorThemes.subTitleColor.withOpacity(0.2),
                          textColor: selectedLang == "fr"
                              ? AppColorThemes.whiteColor
                              : AppColorThemes.titleColor,
                          checkColor: selectedLang == "fr"
                              ? AppColorThemes.primaryColor
                              : AppColorThemes.subTitleColor,
                          checkBoxBorderColor: selectedLang == "fr"
                              ? AppColorThemes.secondaryColor
                              : AppColorThemes.subTitleColor,
                        ),
                      ],
                    );
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
