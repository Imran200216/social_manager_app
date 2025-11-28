import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:social_manager_app/core/themes/app_color_themes.dart';
import 'package:social_manager_app/core/utils/utils.dart';
import 'package:social_manager_app/features/bottom_nav/bottom_nav.dart';
import 'package:social_manager_app/features/connections/connections.dart';
import 'package:social_manager_app/features/scan/scan.dart';
import 'package:social_manager_app/core/constants/constants.dart';
import 'package:social_manager_app/features/home/home.dart';
import 'package:social_manager_app/features/profile/profile.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    // Screens
    final List<Widget> screens = [
      const HomeScreen(),
      const ScannerScreen(),
      const ConnectionsScreen(),
      const ProfileScreen(),
    ];

    // Responsive
    final isTablet = ResponsiveUtils.isTablet(context);
    final isMobile = ResponsiveUtils.isMobile(context);

    return BlocBuilder<BottomNavCubit, BottomNavState>(
      builder: (context, state) {
        final selectedIndex = (state is BottomNavSelected)
            ? state.selectedIndex
            : 0;

        return Scaffold(
          backgroundColor: AppColorThemes.secondaryColor,
          body: SafeArea(
            child: IndexedStack(index: selectedIndex, children: screens),
          ),

          bottomNavigationBar: Directionality(
            textDirection: TextDirection.ltr,
            child: BottomNavigationBar(
              currentIndex: selectedIndex,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: AppColorThemes.primaryColor,
              unselectedItemColor: AppColorThemes.subTitleColor,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              onTap: (index) {
                context.read<BottomNavCubit>().selectBottomNav(index);
              },
              items: [
                // Home
                BottomNavigationBarItem(
                  activeIcon: SvgPicture.asset(
                    AppAssetsConstants.homeFilled,
                    height: isMobile
                        ? 28
                        : isTablet
                        ? 30
                        : 32,
                    fit: BoxFit.cover,
                    color: AppColorThemes.primaryColor,
                  ),
                  icon: SvgPicture.asset(
                    AppAssetsConstants.homeOutlined,
                    height: isMobile
                        ? 28
                        : isTablet
                        ? 30
                        : 32,
                    fit: BoxFit.cover,
                    color: AppColorThemes.subTitleColor,
                  ),
                  label: '',
                ),

                // Scan
                BottomNavigationBarItem(
                  activeIcon: SvgPicture.asset(
                    AppAssetsConstants.scanFilled,
                    height: isMobile
                        ? 28
                        : isTablet
                        ? 30
                        : 32,
                    fit: BoxFit.cover,
                    color: AppColorThemes.primaryColor,
                  ),
                  icon: SvgPicture.asset(
                    AppAssetsConstants.scanOutlined,
                    color: AppColorThemes.subTitleColor,
                    height: isMobile
                        ? 28
                        : isTablet
                        ? 30
                        : 32,
                    fit: BoxFit.cover,
                  ),
                  label: '',
                ),

                // History
                BottomNavigationBarItem(
                  activeIcon: SvgPicture.asset(
                    AppAssetsConstants.historyFilled,
                    height: isMobile
                        ? 28
                        : isTablet
                        ? 30
                        : 32,
                    fit: BoxFit.cover,
                    color: AppColorThemes.primaryColor,
                  ),
                  icon: SvgPicture.asset(
                    AppAssetsConstants.historyOutlined,
                    height: isMobile
                        ? 28
                        : isTablet
                        ? 30
                        : 32,
                    fit: BoxFit.cover,
                    color: AppColorThemes.subTitleColor,
                  ),
                  label: '',
                ),

                // Profile
                BottomNavigationBarItem(
                  activeIcon: SvgPicture.asset(
                    AppAssetsConstants.profileFilled,
                    height: isMobile
                        ? 28
                        : isTablet
                        ? 30
                        : 32,
                    fit: BoxFit.cover,
                    color: AppColorThemes.primaryColor,
                  ),
                  icon: SvgPicture.asset(
                    AppAssetsConstants.profileOutlined,
                    height: isMobile
                        ? 28
                        : isTablet
                        ? 30
                        : 32,
                    fit: BoxFit.cover,
                    color: AppColorThemes.subTitleColor,
                  ),
                  label: '',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
