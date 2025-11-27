import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:social_manager_app/core/constants/constants.dart';
import 'package:social_manager_app/core/themes/app_color_themes.dart';
import 'package:social_manager_app/core/utils/responsive_utils.dart';
import 'package:social_manager_app/commons/widgets/widgets.dart';
import 'package:social_manager_app/features/on_boarding/on_boarding.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Responsive
    final isTablet = ResponsiveUtils.isTablet(context);
    final isMobile = ResponsiveUtils.isMobile(context);

    // Screen Height
    final double screenHeight = MediaQuery.of(context).size.height;

    // Controller
    final PageController pageController = PageController();

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

            // ⬇️ BlocListener only for PageView ⬇️
            BlocListener<OnBoardingBloc, OnBoardingState>(
              listener: (context, state) {
                pageController.animateToPage(
                  state.currentPage,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
              child: SizedBox(
                height: screenHeight * 0.38,
                child: PageView(
                  controller: pageController,
                  onPageChanged: (index) {
                    context.read<OnBoardingBloc>().add(
                      OnBoardingPageChangedEvent(index),
                    );
                  },
                  children: [
                    _onBoardPage(
                      isMobile,
                      isTablet,
                      screenHeight,
                      AppAssetsConstants.effortlessManagement,
                      "Smarter Networking like a King",
                      "Exchange socials seamlessly and grow your network effortlessly, anytime, anywhere.",
                    ),
                    _onBoardPage(
                      isMobile,
                      isTablet,
                      screenHeight,
                      AppAssetsConstants.network,
                      "Connect Instantly",
                      "Scan QR codes and connect with people in seconds.",
                    ),
                    _onBoardPage(
                      isMobile,
                      isTablet,
                      screenHeight,
                      AppAssetsConstants.sharing,
                      "Share Socials Easily",
                      "Add unlimited social links and share them anytime.",
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            BlocBuilder<OnBoardingBloc, OnBoardingState>(
              builder: (context, state) {
                return SmoothPageIndicator(
                  controller: pageController,
                  count: 3,
                  effect: WormEffect(
                    radius: 6,
                    dotHeight: isMobile
                        ? 6
                        : isTablet
                        ? 8
                        : 10,
                    dotWidth: isMobile
                        ? 20
                        : isTablet
                        ? 22
                        : 24,
                    spacing: 8,
                    activeDotColor: AppColorThemes.titleColor,
                    dotColor: AppColorThemes.subTitleColor.withOpacity(0.3),
                  ),
                );
              },
            ),

            const Spacer(),

            // Skip
            KOutlinedBtn(
              btnTitle: "Skip",
              onTap: () {
                // Auth Screen
                context.pushReplacementNamed(AppRouterConstants.auth);
              },
              borderRadius: 10,
              fontSize: isMobile
                  ? 16
                  : isTablet
                  ? 18
                  : 20,
              btnHeight: isMobile
                  ? 50
                  : isTablet
                  ? 55
                  : 60,
              btnWidth: double.maxFinite,
            ),

            KVerticalSpacer(height: 18),

            BlocBuilder<OnBoardingBloc, OnBoardingState>(
              builder: (context, state) {
                final bool isLast = state.currentPage == 2;

                return KFilledBtn(
                  btnTitle: isLast ? "Get Started" : "Next",
                  btnBgColor: AppColorThemes.primaryColor,
                  btnTitleColor: AppColorThemes.titleColor,
                  onTap: () {
                    if (!isLast) {
                      context.read<OnBoardingBloc>().add(
                        OnBoardingNextPressedEvent(),
                      );
                    } else {
                      // Auth Screen
                      context.pushReplacementNamed(AppRouterConstants.auth);
                    }
                  },
                  borderRadius: 10,
                  fontSize: isMobile
                      ? 16
                      : isTablet
                      ? 18
                      : 20,
                  btnHeight: isMobile
                      ? 50
                      : isTablet
                      ? 55
                      : 60,
                  btnWidth: double.maxFinite,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _onBoardPage(
    bool isMobile,
    bool isTablet,
    double screenHeight,
    String asset,
    String title,
    String subtitle,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.center,
          child: SvgPicture.asset(
            asset,
            height: isMobile
                ? screenHeight * 0.23
                : isTablet
                ? screenHeight * 0.28
                : 0.45,
          ),
        ),
        const SizedBox(height: 20),
        KText(
          softWrap: true,
          maxLines: 3,
          text: title,
          color: AppColorThemes.titleColor,
          fontWeight: FontWeight.w700,
          fontSize: isMobile
              ? 22
              : isTablet
              ? 24
              : 28,
        ),
        const SizedBox(height: 10),
        KText(
          softWrap: true,
          textAlign: TextAlign.center,
          maxLines: 3,
          text: subtitle,
          color: AppColorThemes.subTitleColor,
          fontWeight: FontWeight.w500,
          fontSize: isMobile
              ? 18
              : isTablet
              ? 20
              : 22,
        ),
      ],
    );
  }
}
