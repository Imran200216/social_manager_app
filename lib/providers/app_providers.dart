import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:social_manager_app/features/localization/localization.dart';
import 'package:social_manager_app/features/on_boarding/on_boarding.dart';

final GetIt getIt = GetIt.instance;

List<BlocProvider> appBlocProviders = [
  // On Boarding Bloc
  BlocProvider<OnBoardingBloc>(create: (context) => getIt<OnBoardingBloc>()),

  // Localization Cubit
  BlocProvider<LocalizationCubit>(
    create: (context) => getIt<LocalizationCubit>(),
  ),
];
