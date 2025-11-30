import 'package:go_router/go_router.dart';
import 'package:social_manager_app/features/auth/auth.dart';
import 'package:social_manager_app/features/home/home.dart';
import 'package:social_manager_app/features/localization/localization.dart';
import 'package:social_manager_app/features/on_boarding/on_boarding.dart';
import 'package:social_manager_app/features/profile/profile.dart';
import 'package:social_manager_app/features/scan/scan.dart';
import 'package:social_manager_app/features/splash/splash.dart';
import 'package:social_manager_app/core/constants/constants.dart';
import 'package:social_manager_app/features/bottom_nav/bottom_nav.dart';

GoRouter appRouter = GoRouter(
  // Initial Location
  initialLocation: "/splash",

  routes: [
    // Splash Screen
    GoRoute(
      path: '/splash',
      name: AppRouterConstants.splash,
      builder: (context, state) {
        return SplashScreen();
      },
    ),

    // On Boarding Screen
    GoRoute(
      path: '/onBoarding',
      name: AppRouterConstants.onBoarding,
      builder: (context, state) {
        return OnBoardingScreen();
      },
    ),

    // Auth Screen
    GoRoute(
      path: '/auth',
      name: AppRouterConstants.auth,
      builder: (context, state) {
        return AuthScreen();
      },
    ),

    // Bottom Nav
    GoRoute(
      path: '/bottomNav',
      name: AppRouterConstants.bottomNav,
      builder: (context, state) {
        return BottomNav();
      },
    ),

    // Localization Screen
    GoRoute(
      path: '/localization',
      name: AppRouterConstants.localization,
      builder: (context, state) {
        return LocalizationScreen();
      },
    ),

    // Profile Localization Screen
    GoRoute(
      path: '/profileLocalization',
      name: AppRouterConstants.profileLocalization,
      builder: (context, state) {
        return ProfileLocalizationScreen();
      },
    ),

    // Scan Screen
    GoRoute(
      path: '/scanner',
      name: AppRouterConstants.scanner,
      builder: (context, state) {
        return ScannerScreen();
      },
    ),

    // Profile Personal Info Screen
    GoRoute(
      path: '/profilePersonalInfo',
      name: AppRouterConstants.profilePersonalInfo,
      builder: (context, state) {
        return ProfilePersonalInfoScreen();
      },
    ),

    // Profile View Screen
    GoRoute(
      path: '/profileView',
      name: AppRouterConstants.profileView,
      builder: (context, state) {
        return ProfileViewScreen();
      },
    ),

    // Add Social Links
    GoRoute(
      path: '/addSocialLinks',
      name: AppRouterConstants.addSocialLinks,
      builder: (context, state) {
        return AddSocialLinksScreen();
      },
    ),
  ],
);
