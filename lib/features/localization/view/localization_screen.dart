import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:social_manager_app/core/themes/app_color_themes.dart';
import 'package:social_manager_app/core/utils/utils.dart';
import 'package:social_manager_app/commons/widgets/widgets.dart';
import 'package:social_manager_app/features/localization/localization.dart';
import 'package:social_manager_app/core/constants/constants.dart';

class LocalizationScreen extends StatelessWidget {
  const LocalizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Responsive
    final isTablet = ResponsiveUtils.isTablet(context);
    final isMobile = ResponsiveUtils.isMobile(context);

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: AppColorThemes.whiteColor,
        bottomSheet: BlocBuilder<LocalizationCubit, LocalizationState>(
          builder: (context, state) {
            final cubit = context.watch<LocalizationCubit>();
            final isLangSelected = cubit.selectedLanguage != null;

            return AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              decoration: BoxDecoration(
                color: AppColorThemes.whiteColor,
                border: Border(
                  top: BorderSide(
                    color: AppColorThemes.subTitleColor.withOpacity(0.2),
                    width: 1,
                  ),
                ),
              ),
              height: isLangSelected ? 90 : 0,
              child: isLangSelected
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 20,
                        ),
                        child: KFilledBtn(
                          btnTitle: "Continue",
                          btnBgColor: AppColorThemes.primaryColor,
                          btnTitleColor: AppColorThemes.titleColor,
                          onTap: () {
                            // Navigate to OnBoarding Screen
                            context.pushReplacementNamed(
                              AppRouterConstants.onBoarding,
                            );
                          },
                          borderRadius: 10,
                          btnHeight: 55,
                          btnWidth: double.maxFinite,
                          fontSize: isMobile
                              ? 16
                              : isTablet
                              ? 18
                              : 20,
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            );
          },
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
                  text: "Choose your language",
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
                  text:
                      "Pick your desired app language and enjoy a smoother, more personalized start.",
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
                          bgColor: AppColorThemes.whiteColor,
                          borderColor: AppColorThemes.subTitleColor.withOpacity(
                            0.2,
                          ),
                          textColor: AppColorThemes.titleColor,
                        ),

                        // Hindi
                        LanguageTile(
                          title: "India (Hindi)",
                          flagAsset: AppAssetsConstants.india,
                          value: selectedLang == "hi",
                          onChanged: (val) => cubit.selectLanguage("hi"),
                          bgColor: AppColorThemes.whiteColor,
                          borderColor: AppColorThemes.subTitleColor.withOpacity(
                            0.2,
                          ),
                          textColor: AppColorThemes.titleColor,
                        ),

                        // Arabic
                        LanguageTile(
                          title: "United Arab Emirates (Arabic)",
                          flagAsset: AppAssetsConstants.uae,
                          value: selectedLang == "ar",
                          onChanged: (val) => cubit.selectLanguage("ar"),
                          bgColor: AppColorThemes.whiteColor,
                          borderColor: AppColorThemes.subTitleColor.withOpacity(
                            0.2,
                          ),
                          textColor: AppColorThemes.titleColor,
                        ),


                        // French
                        LanguageTile(
                          title: "France (French)",
                          flagAsset: AppAssetsConstants.french,
                          value: selectedLang == "fr",
                          onChanged: (val) => cubit.selectLanguage("fr"),
                          bgColor: AppColorThemes.whiteColor,
                          borderColor: AppColorThemes.subTitleColor.withOpacity(
                            0.2,
                          ),
                          textColor: AppColorThemes.titleColor,
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
