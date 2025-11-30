import 'package:get_it/get_it.dart';
import 'package:social_manager_app/features/home/home.dart';

final GetIt getIt = GetIt.instance;

void initHomeInjection() {
  // Toggle User Name Url Cubit
  getIt.registerFactory(() => ToggleUserNameUrlCubit());
}
