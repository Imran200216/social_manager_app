import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_manager_app/core/router/app_router.dart';
import 'package:social_manager_app/di/service_locator.dart';
import 'package:social_manager_app/providers/app_providers.dart';

void main() async {
  // Set Up Service Locators
  setUpServiceLocators();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: appBlocProviders,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Social Manager App',
        theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),

        // Router
        routerConfig: appRouter,
      ),
    );
  }
}
