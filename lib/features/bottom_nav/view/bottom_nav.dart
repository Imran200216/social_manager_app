import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:social_manager_app/core/themes/app_color_themes.dart';
import 'package:social_manager_app/core/utils/utils.dart';
import 'package:social_manager_app/features/bottom_nav/bottom_nav.dart';
import 'package:social_manager_app/features/connections/connections.dart';
import 'package:social_manager_app/features/digital_card/digital_card.dart';
import 'package:social_manager_app/core/constants/constants.dart';
import 'package:social_manager_app/features/home/home.dart';
import 'package:social_manager_app/features/profile/profile.dart';
import 'package:social_manager_app/l10n/app_localizations.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      const HomeScreen(),
      const DigitalCardScreen(),
      const ConnectionsScreen(),
      const ProfileScreen(),
    ];

    final isTablet = ResponsiveUtils.isTablet(context);
    final isMobile = ResponsiveUtils.isMobile(context);
    final appLoc = AppLocalizations.of(context)!;

    return BlocBuilder<BottomNavCubit, BottomNavState>(
      builder: (context, state) {
        final selectedIndex = (state is BottomNavSelected)
            ? state.selectedIndex
            : 0;

        return Scaffold(
          backgroundColor: AppColorThemes.whiteColor,

          body: SafeArea(
            child: IndexedStack(index: selectedIndex, children: screens),
          ),

          bottomNavigationBar: Directionality(
            textDirection: TextDirection.ltr,
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: AppColorThemes.subTitleColor.withOpacity(0.2),
                    // TOP BORDER
                    width: 1,
                  ),
                ),
              ),
              child: NavigationBarTheme(
                data: NavigationBarThemeData(
                  backgroundColor: AppColorThemes.whiteColor,
                  indicatorColor: AppColorThemes.primaryColor.withOpacity(0.15),

                  labelTextStyle: MaterialStateProperty.resolveWith(
                    (states) => TextStyle(
                      fontFamily: "Lato",
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                      color: states.contains(MaterialState.selected)
                          ? AppColorThemes.primaryColor
                          : AppColorThemes.secondaryColor,
                    ),
                  ),
                ),
                child: NavigationBar(
                  height: isMobile
                      ? 65
                      : isTablet
                      ? 75
                      : 85,
                  elevation: 0,
                  selectedIndex: selectedIndex,
                  onDestinationSelected: (index) {
                    context.read<BottomNavCubit>().selectBottomNav(index);
                  },
                  labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,

                  destinations: [
                    // Home
                    NavigationDestination(
                      icon: SvgPicture.asset(
                        AppAssetsConstants.homeOutlined,
                        height: isMobile
                            ? 28
                            : isTablet
                            ? 30
                            : 32,
                        color: AppColorThemes.secondaryColor,
                      ),
                      selectedIcon: SvgPicture.asset(
                        AppAssetsConstants.homeFilled,
                        height: isMobile
                            ? 28
                            : isTablet
                            ? 30
                            : 32,
                        color: AppColorThemes.primaryColor,
                      ),
                      label: appLoc.home,
                    ),

                    // Scan
                    NavigationDestination(
                      icon: SvgPicture.asset(
                        AppAssetsConstants.digitalCardOutlined,
                        height: isMobile
                            ? 28
                            : isTablet
                            ? 30
                            : 32,
                        color: AppColorThemes.secondaryColor,
                      ),
                      selectedIcon: SvgPicture.asset(
                        AppAssetsConstants.digitalCardFilled,
                        height: isMobile
                            ? 28
                            : isTablet
                            ? 30
                            : 32,
                        color: AppColorThemes.primaryColor,
                      ),
                      label: "Digi Card",
                    ),

                    // Connections
                    NavigationDestination(
                      icon: SvgPicture.asset(
                        AppAssetsConstants.historyOutlined,
                        height: isMobile
                            ? 28
                            : isTablet
                            ? 30
                            : 32,
                        color: AppColorThemes.secondaryColor,
                      ),
                      selectedIcon: SvgPicture.asset(
                        AppAssetsConstants.historyFilled,
                        height: isMobile
                            ? 28
                            : isTablet
                            ? 30
                            : 32,
                        color: AppColorThemes.primaryColor,
                      ),
                      label: appLoc.connections,
                    ),

                    // Profile
                    NavigationDestination(
                      icon: SvgPicture.asset(
                        AppAssetsConstants.profileOutlined,
                        height: isMobile
                            ? 28
                            : isTablet
                            ? 30
                            : 32,
                        color: AppColorThemes.secondaryColor,
                      ),
                      selectedIcon: SvgPicture.asset(
                        AppAssetsConstants.profileFilled,
                        height: isMobile
                            ? 28
                            : isTablet
                            ? 30
                            : 32,
                        color: AppColorThemes.primaryColor,
                      ),
                      label: appLoc.profile,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
