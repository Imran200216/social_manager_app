import 'package:get_it/get_it.dart';
import 'package:social_manager_app/features/bottom_nav/bottom_nav.dart';
import 'package:social_manager_app/features/localization/localization.dart';
import 'package:social_manager_app/features/on_boarding/on_boarding.dart';
import 'package:social_manager_app/features/home/home.dart';

final GetIt getIt = GetIt.instance;

void setUpServiceLocators() {
  // On Boarding Injection
  initOnBoardingInjection();

  // Localization Injection
  initLocalizationInjection();

  // Bottom Nav Injection
  initBottomNavInjection();

  // Toggle User Name Url Cubit
  initHomeInjection();
}
