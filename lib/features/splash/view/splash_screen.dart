import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:social_manager_app/commons/widgets/widgets.dart';
import 'package:social_manager_app/core/constants/constants.dart';
import 'package:social_manager_app/core/themes/app_color_themes.dart';
import 'package:social_manager_app/core/utils/utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      // On Boarding Screen
      context.pushReplacementNamed(AppRouterConstants.localization);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Responsive
    final isTablet = ResponsiveUtils.isTablet(context);
    final isMobile = ResponsiveUtils.isMobile(context);

    return Scaffold(
      backgroundColor: AppColorThemes.primaryColor,

      body: Center(
        child: KText(
          text: "Fineed",
          color: AppColorThemes.titleColor,
          fontWeight: FontWeight.w700,
          fontSize: isMobile
              ? 22
              : isTablet
              ? 24
              : 28,
        ),
      ),
    );
  }
}
