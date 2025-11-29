import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScanAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback onRestartScanner;
  final VoidCallback onFlash;

  const ScanAppBar({
    super.key,
    required this.title,
    required this.onRestartScanner,
    required this.onFlash,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(
        title,
        style: TextStyle(
          fontFamily: "Lato",
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
      ),
      actions: [
        // Restart scanner
        IconButton(
          icon: const Icon(Icons.refresh, color: Colors.black),
          onPressed: () {
            HapticFeedback.heavyImpact();

            onRestartScanner();
          },
        ),

        // Flash toggle
        IconButton(
          icon: const Icon(Icons.flash_on, color: Colors.black),
          onPressed: () {
            HapticFeedback.heavyImpact();

            onFlash();
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
