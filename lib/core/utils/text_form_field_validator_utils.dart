import 'package:flutter/material.dart';
import 'package:social_manager_app/l10n/app_localizations.dart';

class TextFormFieldValidatorUtils {
  /// Validator to check if the field is empty
  static String? isEmptyValidator(
    BuildContext context,
    String? value, {
    String fieldName = "This field",
  }) {
    final appLoc = AppLocalizations.of(context)!;
    if (value == null || value.trim().isEmpty) {
      return "$fieldName ${appLoc.cannotBeEmpty}";
    }
    return null;
  }
}
