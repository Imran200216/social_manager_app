import 'package:flutter/material.dart';
import 'package:social_manager_app/commons/widgets/widgets.dart';
import 'package:social_manager_app/core/themes/app_color_themes.dart';
import 'package:social_manager_app/core/utils/utils.dart';

class KTextFormField extends StatelessWidget {
  final bool readOnly;
  final String? labelText;
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;
  final bool obscureText;
  final TextInputType keyboardType;
  final Iterable<String>? autofillHints;
  final int? maxLines;
  final int? maxLength;
  final Widget? prefixIcon;
  final Function(String)? onChanged;
  final FocusNode? focusNode; // 👈 Optional focus node

  const KTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.validator,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.autofillHints,
    this.labelText,
    this.maxLines,
    this.readOnly = false,
    this.prefixIcon,
    this.onChanged,
    this.focusNode, // 👈 Added optional parameter
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    final isTablet = ResponsiveUtils.isTablet(context);
    final isMobile = ResponsiveUtils.isMobile(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null && labelText!.isNotEmpty) ...[
          KText(
            textAlign: TextAlign.start,
            text: labelText!,
            fontSize: isMobile
                ? 16
                : isTablet
                ? 18
                : 20,
            fontWeight: FontWeight.w600,
            color: AppColorThemes.titleColor,
          ),
          const SizedBox(height: 10),
        ],
        TextFormField(
          controller: controller,
          validator: validator,
          obscureText: obscureText,
          keyboardType: keyboardType,
          autofillHints: autofillHints,
          readOnly: readOnly,
          maxLines: maxLines ?? 1,
          maxLength: maxLength,
          focusNode: focusNode,
          // 👈 Use focus node if provided
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontFamily: "Lato",
          ),
          onChanged: onChanged,
          decoration: InputDecoration(
            prefixIcon: prefixIcon,
            filled: true,
            fillColor: AppColorThemes.whiteColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: AppColorThemes.subTitleColor.withOpacity(0.2),
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: AppColorThemes.subTitleColor.withOpacity(0.2),
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: AppColorThemes.primaryColor,
                width: 1,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: AppColorThemes.snackBarFailureColor,
                width: 1,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: AppColorThemes.primaryColor,
                width: 1,
              ),
            ),
            hintText: hintText,
            hintStyle: TextStyle(
              fontFamily: "Lato",
              fontWeight: FontWeight.w500,
              fontSize: isMobile
                  ? 16
                  : isTablet
                  ? 18
                  : 20,
              color: AppColorThemes.subTitleColor,
            ),
          ),
        ),
      ],
    );
  }
}
