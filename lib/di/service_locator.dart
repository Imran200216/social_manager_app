import 'package:get_it/get_it.dart';
import 'package:social_manager_app/features/localization/localization.dart';
import 'package:social_manager_app/features/on_boarding/injection/on_boarding_injection.dart';

final GetIt getIt = GetIt.instance;

void setUpServiceLocators() {
  // On Boarding Injection
  initOnBoardingInjection();

  // Localization Injection
  initLocalizationInjection();
}
