import 'package:get_it/get_it.dart';
import 'package:social_manager_app/features/bottom_nav/bottom_nav.dart';

final GetIt getIt = GetIt.instance;

void initBottomNavInjection() {
  // Bottom Nav Cubit
  getIt.registerFactory(() => BottomNavCubit());
}
