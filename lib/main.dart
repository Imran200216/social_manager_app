import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_manager_app/core/router/app_router.dart';
import 'package:social_manager_app/core/themes/app_color_themes.dart';
import 'package:social_manager_app/di/service_locator.dart';
import 'package:social_manager_app/features/localization/localization.dart';
import 'package:social_manager_app/l10n/app_localizations.dart';
import 'package:social_manager_app/providers/app_providers.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Set Up Service Locators
  setUpServiceLocators();

  // Lock orientation to portrait
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: appBlocProviders,
      child: BlocBuilder<LocalizationCubit, LocalizationState>(
        builder: (context, state) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Social Manager App',

            // Localization
            locale: state is LocalizationSelected
                ? Locale(state.selectedLanguage)
                : const Locale("en"),
            supportedLocales: const [
              // English
              Locale('en'),
              // Arabic
              Locale('ar'),
              // French
              Locale('fr'),
              // Hindi
              Locale('hi'),
              // Spanish
              Locale('es'),
              // Russian
              Locale('ru'),
              // German
              Locale('de'),
              // Portuguese
              Locale('pt'),
              // Chinese
              Locale('zh'),
              // Japanese
              Locale('ja'),
            ],
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],

            // Themes
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: AppColorThemes.primaryColor,
              ),
              useMaterial3: true,
            ),

            // Router
            routerConfig: appRouter,
          );
        },
      ),
    );
  }
}
