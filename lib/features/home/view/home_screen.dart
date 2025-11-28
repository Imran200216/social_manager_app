import 'package:flutter/material.dart';
import 'package:social_manager_app/core/themes/app_color_themes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorThemes.whiteColor,
      body: Center(child: Text("hi home")),
    );
  }
}
