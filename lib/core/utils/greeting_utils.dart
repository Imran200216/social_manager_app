import 'package:social_manager_app/l10n/app_localizations.dart';

String getGreetingUtils(AppLocalizations appLoc) {
  final hour = DateTime.now().hour;

  if (hour >= 5 && hour < 12) {
    return appLoc.goodMorning;
  } else if (hour >= 12 && hour < 17) {
    return appLoc.goodAfternoon;
  } else {
    return appLoc.goodEvening;
  }
}
