import 'package:get_it/get_it.dart';
import 'package:social_manager_app/features/on_boarding/view_model/bloc/on_boarding_bloc/on_boarding_bloc.dart';

final GetIt getIt = GetIt.instance;

void initOnBoardingInjection() {
  // On Boarding Bloc
  getIt.registerFactory<OnBoardingBloc>(() => OnBoardingBloc());
}
