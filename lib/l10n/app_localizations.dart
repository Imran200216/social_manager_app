import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('hi'),
    Locale('ja'),
    Locale('pt'),
    Locale('ru'),
    Locale('zh')
  ];

  /// No description provided for @onBoardingTitleOne.
  ///
  /// In en, this message translates to:
  /// **'Smarter Networking like a King'**
  String get onBoardingTitleOne;

  /// No description provided for @onBoardingDescriptionOne.
  ///
  /// In en, this message translates to:
  /// **'Exchange socials seamlessly and grow your network effortlessly, anytime, anywhere.'**
  String get onBoardingDescriptionOne;

  /// No description provided for @onBoardingTitleTwo.
  ///
  /// In en, this message translates to:
  /// **'Connect Instantly'**
  String get onBoardingTitleTwo;

  /// No description provided for @onBoardingDescriptionTwo.
  ///
  /// In en, this message translates to:
  /// **'Scan QR codes and connect with people in seconds.'**
  String get onBoardingDescriptionTwo;

  /// No description provided for @onBoardingTitleThree.
  ///
  /// In en, this message translates to:
  /// **'Share Socials Easily'**
  String get onBoardingTitleThree;

  /// No description provided for @onBoardingDescriptionThree.
  ///
  /// In en, this message translates to:
  /// **'Add unlimited social links and share them anytime'**
  String get onBoardingDescriptionThree;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStarted;

  /// No description provided for @enablePassKeys.
  ///
  /// In en, this message translates to:
  /// **'Enable passkeys'**
  String get enablePassKeys;

  /// No description provided for @enablePasskeysDescription.
  ///
  /// In en, this message translates to:
  /// **'Use your face os fingerprint t verify it\'s\nyou. No Password required'**
  String get enablePasskeysDescription;

  /// No description provided for @continueWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Continue with Google'**
  String get continueWithGoogle;

  /// No description provided for @continueWithApple.
  ///
  /// In en, this message translates to:
  /// **'Continue with Apple'**
  String get continueWithApple;

  /// No description provided for @termsPara.
  ///
  /// In en, this message translates to:
  /// **'By continuing, you confirm that you\'ve read\nand agreed to the '**
  String get termsPara;

  /// No description provided for @termsOfService.
  ///
  /// In en, this message translates to:
  /// **'Terms of Service'**
  String get termsOfService;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @termsConsent.
  ///
  /// In en, this message translates to:
  /// **' and\n consent to the '**
  String get termsConsent;

  /// No description provided for @personalInfo.
  ///
  /// In en, this message translates to:
  /// **'Personal Info'**
  String get personalInfo;

  /// No description provided for @personalInfoDescription.
  ///
  /// In en, this message translates to:
  /// **'Manage your basic details'**
  String get personalInfoDescription;

  /// No description provided for @shareApp.
  ///
  /// In en, this message translates to:
  /// **'Share App'**
  String get shareApp;

  /// No description provided for @shareAppDescription.
  ///
  /// In en, this message translates to:
  /// **'Let others discover this app'**
  String get shareAppDescription;

  /// No description provided for @faq.
  ///
  /// In en, this message translates to:
  /// **'FAQ\'s'**
  String get faq;

  /// No description provided for @faqDescription.
  ///
  /// In en, this message translates to:
  /// **'Learn more about the app'**
  String get faqDescription;

  /// No description provided for @contactSupport.
  ///
  /// In en, this message translates to:
  /// **'Contact Support'**
  String get contactSupport;

  /// No description provided for @contactSupportDescription.
  ///
  /// In en, this message translates to:
  /// **'Reach out for any support'**
  String get contactSupportDescription;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @logoutDescription.
  ///
  /// In en, this message translates to:
  /// **'Reach out for any support'**
  String get logoutDescription;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @connections.
  ///
  /// In en, this message translates to:
  /// **'Connections'**
  String get connections;

  /// No description provided for @scan.
  ///
  /// In en, this message translates to:
  /// **'Scan'**
  String get scan;

  /// No description provided for @privacyPolicyDescription.
  ///
  /// In en, this message translates to:
  /// **'Know how we use and secure your data'**
  String get privacyPolicyDescription;

  /// No description provided for @languagePreference.
  ///
  /// In en, this message translates to:
  /// **'Language Preference'**
  String get languagePreference;

  /// No description provided for @languagePreferenceDescription.
  ///
  /// In en, this message translates to:
  /// **'Manage your app’s language settings'**
  String get languagePreferenceDescription;

  /// No description provided for @chooseYourLanguage.
  ///
  /// In en, this message translates to:
  /// **'Choose your language'**
  String get chooseYourLanguage;

  /// No description provided for @chooseYourLanguageDescription.
  ///
  /// In en, this message translates to:
  /// **'Pick your desired app language and enjoy a smoother, more personalized start.'**
  String get chooseYourLanguageDescription;

  /// No description provided for @scanQRCode.
  ///
  /// In en, this message translates to:
  /// **'Scan QR Code'**
  String get scanQRCode;

  /// No description provided for @scanQRCodeTitle.
  ///
  /// In en, this message translates to:
  /// **'Align the QR Code Inside the Frame'**
  String get scanQRCodeTitle;

  /// No description provided for @scanQRCodeSubTitle.
  ///
  /// In en, this message translates to:
  /// **'Keep your device steady and ensure the QR code is fully visible for best results.'**
  String get scanQRCodeSubTitle;

  /// No description provided for @scanQRLightningSetup.
  ///
  /// In en, this message translates to:
  /// **'Use good lighting to improve detection and scanning speed.'**
  String get scanQRLightningSetup;

  /// No description provided for @yourConnections.
  ///
  /// In en, this message translates to:
  /// **'Your Connections'**
  String get yourConnections;

  /// No description provided for @noConnectionsFound.
  ///
  /// In en, this message translates to:
  /// **'No Connections added yet. Please can your friends add you as a connection.'**
  String get noConnectionsFound;

  /// No description provided for @yourDigitalCard.
  ///
  /// In en, this message translates to:
  /// **'Your Digital Card'**
  String get yourDigitalCard;

  /// No description provided for @noDigitalCardFound.
  ///
  /// In en, this message translates to:
  /// **'You don’t have a digital card yet. Add your details under Personal Info to create one.'**
  String get noDigitalCardFound;

  /// No description provided for @digiCard.
  ///
  /// In en, this message translates to:
  /// **'DigiCard'**
  String get digiCard;

  /// No description provided for @searchConnections.
  ///
  /// In en, this message translates to:
  /// **'Search connections...'**
  String get searchConnections;

  /// No description provided for @goodMorning.
  ///
  /// In en, this message translates to:
  /// **'Good Morning'**
  String get goodMorning;

  /// No description provided for @goodAfternoon.
  ///
  /// In en, this message translates to:
  /// **'Good Afternoon'**
  String get goodAfternoon;

  /// No description provided for @goodEvening.
  ///
  /// In en, this message translates to:
  /// **'Good Evening'**
  String get goodEvening;

  /// No description provided for @hi.
  ///
  /// In en, this message translates to:
  /// **'hi'**
  String get hi;

  /// No description provided for @totalImpression.
  ///
  /// In en, this message translates to:
  /// **'Total Impression'**
  String get totalImpression;

  /// No description provided for @addLinks.
  ///
  /// In en, this message translates to:
  /// **'Add Links'**
  String get addLinks;

  /// No description provided for @totalViews.
  ///
  /// In en, this message translates to:
  /// **'Total Views'**
  String get totalViews;

  /// No description provided for @totalConnections.
  ///
  /// In en, this message translates to:
  /// **'Total Connections'**
  String get totalConnections;

  /// No description provided for @totalLinksAdded.
  ///
  /// In en, this message translates to:
  /// **'Total Links Added'**
  String get totalLinksAdded;

  /// No description provided for @firstName.
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get firstName;

  /// No description provided for @enterFirstName.
  ///
  /// In en, this message translates to:
  /// **'Enter first name'**
  String get enterFirstName;

  /// No description provided for @lastName.
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get lastName;

  /// No description provided for @enterLastName.
  ///
  /// In en, this message translates to:
  /// **'Enter last name'**
  String get enterLastName;

  /// No description provided for @bio.
  ///
  /// In en, this message translates to:
  /// **'Bio'**
  String get bio;

  /// No description provided for @enterBio.
  ///
  /// In en, this message translates to:
  /// **'Enter bio'**
  String get enterBio;

  /// No description provided for @cannotBeEmpty.
  ///
  /// In en, this message translates to:
  /// **'cannot be empty'**
  String get cannotBeEmpty;

  /// No description provided for @optional.
  ///
  /// In en, this message translates to:
  /// **'Optional'**
  String get optional;

  /// No description provided for @aboutYou.
  ///
  /// In en, this message translates to:
  /// **'About You'**
  String get aboutYou;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @profileViews.
  ///
  /// In en, this message translates to:
  /// **'Profile Views'**
  String get profileViews;

  /// No description provided for @profileViewsDescription.
  ///
  /// In en, this message translates to:
  /// **'Track recent visits to your profile'**
  String get profileViewsDescription;

  /// No description provided for @addMoreSocialProfiles.
  ///
  /// In en, this message translates to:
  /// **'Add More Social Profiles'**
  String get addMoreSocialProfiles;

  /// No description provided for @userName.
  ///
  /// In en, this message translates to:
  /// **'UserName'**
  String get userName;

  /// No description provided for @enterUserName.
  ///
  /// In en, this message translates to:
  /// **'Enter user name'**
  String get enterUserName;

  /// No description provided for @socialProfileUrl.
  ///
  /// In en, this message translates to:
  /// **'Social Profile URL'**
  String get socialProfileUrl;

  /// No description provided for @clear.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get clear;

  /// No description provided for @addSocialProfile.
  ///
  /// In en, this message translates to:
  /// **'Add Social Profile'**
  String get addSocialProfile;

  /// No description provided for @enterSocialProfileUrl.
  ///
  /// In en, this message translates to:
  /// **'Enter Social Profile URL'**
  String get enterSocialProfileUrl;

  /// No description provided for @displayName.
  ///
  /// In en, this message translates to:
  /// **'Display Name'**
  String get displayName;

  /// No description provided for @useUsername.
  ///
  /// In en, this message translates to:
  /// **'Use Username'**
  String get useUsername;

  /// No description provided for @useUrl.
  ///
  /// In en, this message translates to:
  /// **'Use Url'**
  String get useUrl;

  /// No description provided for @selectSocialPlatform.
  ///
  /// In en, this message translates to:
  /// **'Select Social Platform'**
  String get selectSocialPlatform;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'de', 'en', 'es', 'fr', 'hi', 'ja', 'pt', 'ru', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'de': return AppLocalizationsDe();
    case 'en': return AppLocalizationsEn();
    case 'es': return AppLocalizationsEs();
    case 'fr': return AppLocalizationsFr();
    case 'hi': return AppLocalizationsHi();
    case 'ja': return AppLocalizationsJa();
    case 'pt': return AppLocalizationsPt();
    case 'ru': return AppLocalizationsRu();
    case 'zh': return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
