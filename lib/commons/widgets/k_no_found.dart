import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:social_manager_app/commons/widgets/widgets.dart';
import 'package:social_manager_app/core/themes/app_color_themes.dart';
import 'package:social_manager_app/core/utils/utils.dart';

class KNoFound extends StatelessWidget {
  final String svgPath;
  final String title;

  const KNoFound({super.key, required this.svgPath, required this.title});

  @override
  Widget build(BuildContext context) {
    final isTablet = ResponsiveUtils.isTablet(context);
    final isMobile = ResponsiveUtils.isMobile(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            svgPath,
            height: isMobile
                ? 200
                : isTablet
                ? 240
                : 280,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 16),

          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: KText(
              text: title,
              fontSize: isMobile
                  ? 16
                  : isTablet
                  ? 18
                  : 20,
              fontWeight: FontWeight.w600,
              color: AppColorThemes.titleColor,
              textAlign: TextAlign.center,
              softWrap: true,
              maxLines: 3,
            ),
          ),
        ],
      ),
    );
  }
}
