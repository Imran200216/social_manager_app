import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:social_manager_app/commons/widgets/widgets.dart';
import 'package:social_manager_app/core/themes/app_color_themes.dart';
import 'package:social_manager_app/l10n/app_localizations.dart';
import 'package:social_manager_app/core/utils/utils.dart';

class ProfilePersonalInfoScreen extends StatefulWidget {
  const ProfilePersonalInfoScreen({super.key});

  @override
  State<ProfilePersonalInfoScreen> createState() =>
      _ProfilePersonalInfoScreenState();
}

class _ProfilePersonalInfoScreenState extends State<ProfilePersonalInfoScreen> {
  // Form Key
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _bioController.dispose();
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

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: AppColorThemes.whiteColor,

        appBar: KAppBar(
          trailing: IconButton(
            onPressed: () {
              // Haptics
              HapticFeedback.heavyImpact();
            },
            icon: Icon(Icons.edit, color: AppColorThemes.whiteColor),
          ),
          title: appLoc.personalInfo,
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
                // Clear Btn
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
                    btnTitle: appLoc.save,
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

        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
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
                spacing: 14,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // First Name
                  KTextFormField(
                    labelText: appLoc.firstName,
                    controller: _firstNameController,
                    hintText: appLoc.enterFirstName,
                    validator: (value) =>
                        TextFormFieldValidatorUtils.isEmptyValidator(
                          context,
                          value,
                          fieldName: appLoc.firstName,
                        ),
                  ),

                  // Last Name
                  KTextFormField(
                    labelText: "${appLoc.lastName} (${appLoc.optional})",
                    controller: _firstNameController,
                    hintText: appLoc.enterLastName,
                    validator: (value) =>
                        TextFormFieldValidatorUtils.isEmptyValidator(
                          context,
                          value,
                          fieldName: appLoc.lastName,
                        ),
                  ),

                  // Bio
                  KTextFormField(
                    maxLength: 2000,
                    controller: _bioController,
                    hintText: appLoc.enterBio,
                    maxLines: 12,
                    labelText: "${appLoc.bio} (${appLoc.aboutYou})",
                    validator: (value) =>
                        TextFormFieldValidatorUtils.isEmptyValidator(
                          context,
                          value,
                          fieldName: appLoc.bio,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
