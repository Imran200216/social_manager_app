import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:social_manager_app/core/themes/app_color_themes.dart';
import 'package:social_manager_app/features/scan/scan.dart';
import 'package:social_manager_app/l10n/app_localizations.dart';
import 'package:social_manager_app/core/utils/utils.dart';
import 'package:social_manager_app/commons/widgets/widgets.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({super.key});

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  // Controller
  final MobileScannerController controller = MobileScannerController();

  // Scanned Data
  String scannedData = "";

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Responsive
    final isTablet = ResponsiveUtils.isTablet(context);
    final isMobile = ResponsiveUtils.isMobile(context);

    // AppLocalization
    final appLoc = AppLocalizations.of(context)!;

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Colors.white,

        appBar: ScanAppBar(
          title: appLoc.scanQRCode,
          onRestartScanner: () {
            controller.start();
          },
          onFlash: () async {
            await controller.toggleTorch();
            setState(() {});
          },
        ),

        body: Column(
          children: [
            // Scanner camera view
            Expanded(
              flex: 3,
              child: MobileScanner(
                tapToFocus: true,
                controller: controller,
                onDetect: (BarcodeCapture capture) {
                  final barcode = capture.barcodes.first;
                  setState(() {
                    scannedData = barcode.rawValue ?? '';
                  });
                },
              ),
            ),

            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Title
                    KText(
                      text: appLoc.scanQRCodeTitle,
                      softWrap: true,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      color: AppColorThemes.titleColor,
                      fontWeight: FontWeight.w700,
                      fontSize: isMobile
                          ? 20
                          : isTablet
                          ? 22
                          : 24,
                    ),

                    KVerticalSpacer(height: 12),

                    // Sub Title
                    KText(
                      text: appLoc.scanQRCodeSubTitle,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      maxLines: 3,
                      color: AppColorThemes.subTitleColor,
                      fontWeight: FontWeight.w600,
                      fontSize: isMobile
                          ? 14
                          : isTablet
                          ? 16
                          : 18,
                    ),

                    KVerticalSpacer(height: 20),

                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 9,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColorThemes.primaryColor.withOpacity(0.15),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        spacing: 12,
                        children: [
                          // Icon
                          Icon(
                            Icons.lightbulb_outline_sharp,
                            color: AppColorThemes.subTitleColor,
                          ),

                          // Text
                          Expanded(
                            child: KText(
                              text: appLoc.scanQRLightningSetup,
                              textAlign: TextAlign.left,
                              softWrap: true,
                              maxLines: 5,
                              color: AppColorThemes.subTitleColor,
                              fontWeight: FontWeight.w600,
                              fontSize: isMobile
                                  ? 14
                                  : isTablet
                                  ? 16
                                  : 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
