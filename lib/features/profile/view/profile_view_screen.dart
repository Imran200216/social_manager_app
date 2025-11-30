import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:social_manager_app/commons/widgets/k_app_bar.dart';
import 'package:social_manager_app/l10n/app_localizations.dart';
import 'package:social_manager_app/core/utils/utils.dart';

class ProfileViewScreen extends StatelessWidget {
  const ProfileViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Responsive
    final isTablet = ResponsiveUtils.isTablet(context);
    final isMobile = ResponsiveUtils.isMobile(context);

    // AppLocalization
    final appLoc = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: KAppBar(
        title: appLoc.profileViews,
        centerTitle: false,
        onBack: () {
          // Back
          context.pop();
        },
      ),
      body: Center(child: Text("hi profile view")),
    );
  }
}
