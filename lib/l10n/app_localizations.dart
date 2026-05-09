import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_bn.dart';
import 'app_localizations_en.dart';

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
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('bn'),
    Locale('en')
  ];

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @soundAndMusic.
  ///
  /// In en, this message translates to:
  /// **'Sound & Music'**
  String get soundAndMusic;

  /// No description provided for @voiceInstructions.
  ///
  /// In en, this message translates to:
  /// **'Voice Instructions'**
  String get voiceInstructions;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @bangla.
  ///
  /// In en, this message translates to:
  /// **'Bangla'**
  String get bangla;

  /// No description provided for @bottleCapMath.
  ///
  /// In en, this message translates to:
  /// **'BOTTLE CAP MATH'**
  String get bottleCapMath;

  /// No description provided for @bottleCapMathTitleCase.
  ///
  /// In en, this message translates to:
  /// **'Bottle Cap Math'**
  String get bottleCapMathTitleCase;

  /// No description provided for @makingMathTangible.
  ///
  /// In en, this message translates to:
  /// **'Making math tangible and fun.'**
  String get makingMathTangible;

  /// No description provided for @version.
  ///
  /// In en, this message translates to:
  /// **'Version 1.0.0'**
  String get version;

  /// No description provided for @resetAllProgress.
  ///
  /// In en, this message translates to:
  /// **'Reset All Progress'**
  String get resetAllProgress;

  /// No description provided for @requiresParentToUnlock.
  ///
  /// In en, this message translates to:
  /// **'(REQUIRES PARENT TO UNLOCK)'**
  String get requiresParentToUnlock;

  /// No description provided for @parentsOnly.
  ///
  /// In en, this message translates to:
  /// **'Parents Only'**
  String get parentsOnly;

  /// No description provided for @whatIsTwelveTimesFour.
  ///
  /// In en, this message translates to:
  /// **'What is 12 x 4?'**
  String get whatIsTwelveTimesFour;

  /// No description provided for @answerHint.
  ///
  /// In en, this message translates to:
  /// **'Answer'**
  String get answerHint;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @verify.
  ///
  /// In en, this message translates to:
  /// **'Verify'**
  String get verify;

  /// No description provided for @progressResetSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Progress Reset Successfully'**
  String get progressResetSuccessfully;

  /// No description provided for @incorrectAnswer.
  ///
  /// In en, this message translates to:
  /// **'Incorrect Answer'**
  String get incorrectAnswer;

  /// No description provided for @mathBuddy.
  ///
  /// In en, this message translates to:
  /// **'Math Buddy'**
  String get mathBuddy;

  /// No description provided for @hearIt.
  ///
  /// In en, this message translates to:
  /// **'Hear it!'**
  String get hearIt;

  /// No description provided for @startScanning.
  ///
  /// In en, this message translates to:
  /// **'START SCANNING'**
  String get startScanning;

  /// No description provided for @adventureMap.
  ///
  /// In en, this message translates to:
  /// **'Adventure Map'**
  String get adventureMap;

  /// No description provided for @levelUnlocked.
  ///
  /// In en, this message translates to:
  /// **'LEVEL {level} UNLOCKED!'**
  String levelUnlocked(Object level);

  /// No description provided for @practiceMode.
  ///
  /// In en, this message translates to:
  /// **'Practice Mode'**
  String get practiceMode;

  /// No description provided for @sharpenSkills.
  ///
  /// In en, this message translates to:
  /// **'SHARPEN SKILLS'**
  String get sharpenSkills;

  /// No description provided for @streak.
  ///
  /// In en, this message translates to:
  /// **'STREAK'**
  String get streak;

  /// No description provided for @daysStreak.
  ///
  /// In en, this message translates to:
  /// **'{count} Day(s)'**
  String daysStreak(Object count);

  /// No description provided for @mathJourney.
  ///
  /// In en, this message translates to:
  /// **'Math Journey'**
  String get mathJourney;

  /// No description provided for @mapView.
  ///
  /// In en, this message translates to:
  /// **'Map View'**
  String get mapView;

  /// No description provided for @listView.
  ///
  /// In en, this message translates to:
  /// **'List View'**
  String get listView;

  /// No description provided for @level.
  ///
  /// In en, this message translates to:
  /// **'Level {level}'**
  String level(Object level);

  /// No description provided for @lvl.
  ///
  /// In en, this message translates to:
  /// **'Lvl {level}'**
  String lvl(Object level);

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'DONE'**
  String get done;

  /// No description provided for @current.
  ///
  /// In en, this message translates to:
  /// **'CURRENT'**
  String get current;

  /// No description provided for @locked.
  ///
  /// In en, this message translates to:
  /// **'LOCKED'**
  String get locked;

  /// No description provided for @playNow.
  ///
  /// In en, this message translates to:
  /// **'Play Now ▶'**
  String get playNow;

  /// No description provided for @startAdventure.
  ///
  /// In en, this message translates to:
  /// **'Start Adventure →'**
  String get startAdventure;

  /// No description provided for @digitalCapsMode.
  ///
  /// In en, this message translates to:
  /// **'DIGITAL CAPS MODE'**
  String get digitalCapsMode;

  /// No description provided for @practiceModeFreePlay.
  ///
  /// In en, this message translates to:
  /// **'Practice Mode: Free Play!'**
  String get practiceModeFreePlay;

  /// No description provided for @solve.
  ///
  /// In en, this message translates to:
  /// **'Solve: '**
  String get solve;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'SUBMIT'**
  String get submit;

  /// No description provided for @fillAllSlotsFirst.
  ///
  /// In en, this message translates to:
  /// **'Fill all slots first!'**
  String get fillAllSlotsFirst;

  /// No description provided for @greatJob.
  ///
  /// In en, this message translates to:
  /// **'Great Job! 🎉'**
  String get greatJob;

  /// No description provided for @solvedDigitally.
  ///
  /// In en, this message translates to:
  /// **'You solved the puzzle digitally!'**
  String get solvedDigitally;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'NEXT'**
  String get next;

  /// No description provided for @camera.
  ///
  /// In en, this message translates to:
  /// **'CAMERA'**
  String get camera;

  /// No description provided for @missingAnswerCap.
  ///
  /// In en, this message translates to:
  /// **'Missing answer cap after \'=\''**
  String get missingAnswerCap;

  /// No description provided for @couldNotParseNumber.
  ///
  /// In en, this message translates to:
  /// **'Could not parse number (Read: {equation})'**
  String couldNotParseNumber(Object equation);

  /// No description provided for @missingFirstNumber.
  ///
  /// In en, this message translates to:
  /// **'Missing first number before \'{op}\''**
  String missingFirstNumber(Object op);

  /// No description provided for @missingSecondNumber.
  ///
  /// In en, this message translates to:
  /// **'Missing second number after \'{op}\''**
  String missingSecondNumber(Object op);

  /// No description provided for @noOperatorFound.
  ///
  /// In en, this message translates to:
  /// **'No operator found (Read: {equation}).'**
  String noOperatorFound(Object equation);

  /// No description provided for @noEqualsSignFound.
  ///
  /// In en, this message translates to:
  /// **'No equals sign found (Read: {equation}).'**
  String noEqualsSignFound(Object equation);

  /// No description provided for @incorrectMismatch.
  ///
  /// In en, this message translates to:
  /// **'Incorrect. {num1} {op} {num2} is NOT {detectedAnswer}'**
  String incorrectMismatch(
      Object num1, Object op, Object num2, Object detectedAnswer);

  /// No description provided for @alignCapsAndPressCheck.
  ///
  /// In en, this message translates to:
  /// **'Align caps and press Check'**
  String get alignCapsAndPressCheck;

  /// No description provided for @analyzingEquation.
  ///
  /// In en, this message translates to:
  /// **'Analyzing Equation...'**
  String get analyzingEquation;

  /// No description provided for @errorCapturingImage.
  ///
  /// In en, this message translates to:
  /// **'Error capturing image. Try again.'**
  String get errorCapturingImage;

  /// No description provided for @noBottleCapsFound.
  ///
  /// In en, this message translates to:
  /// **'No bottle caps found! Try again.'**
  String get noBottleCapsFound;

  /// No description provided for @noAlignedEquationFound.
  ///
  /// In en, this message translates to:
  /// **'No aligned equation found.'**
  String get noAlignedEquationFound;

  /// No description provided for @correctMatch.
  ///
  /// In en, this message translates to:
  /// **'Correct! {equation}'**
  String correctMatch(Object equation);

  /// No description provided for @oopsBuildThis.
  ///
  /// In en, this message translates to:
  /// **'Oops! Build this equation: {displayTargetLeft} = ?'**
  String oopsBuildThis(Object displayTargetLeft);

  /// No description provided for @hintScreenOops.
  ///
  /// In en, this message translates to:
  /// **'💡 Oops! Almost there.'**
  String get hintScreenOops;

  /// No description provided for @hintScreenCheckClosely.
  ///
  /// In en, this message translates to:
  /// **'Let\'s check the numbers closely!'**
  String get hintScreenCheckClosely;

  /// No description provided for @hintScreenEquationSoFar.
  ///
  /// In en, this message translates to:
  /// **'Here is the equation so far:'**
  String get hintScreenEquationSoFar;

  /// No description provided for @hintScreenMissingCap.
  ///
  /// In en, this message translates to:
  /// **'We are missing a cap!'**
  String get hintScreenMissingCap;

  /// No description provided for @tryAgain.
  ///
  /// In en, this message translates to:
  /// **'TRY AGAIN'**
  String get tryAgain;

  /// No description provided for @countingCheck.
  ///
  /// In en, this message translates to:
  /// **'COUNTING CHECK'**
  String get countingCheck;

  /// No description provided for @hereIsHowWeCalculate.
  ///
  /// In en, this message translates to:
  /// **'Here is how we calculate this:'**
  String get hereIsHowWeCalculate;

  /// No description provided for @theAnswerIs.
  ///
  /// In en, this message translates to:
  /// **'THE ANSWER IS {answer}!'**
  String theAnswerIs(Object answer);

  /// No description provided for @letsTryTheNumber.
  ///
  /// In en, this message translates to:
  /// **'Let\'s try the number {answer} together!\nLet\'s look closely at the apples.'**
  String letsTryTheNumber(Object answer);

  /// No description provided for @whatsTheAnswer.
  ///
  /// In en, this message translates to:
  /// **'What\'s the answer?'**
  String get whatsTheAnswer;

  /// No description provided for @analyzing.
  ///
  /// In en, this message translates to:
  /// **'ANALYZING...'**
  String get analyzing;

  /// No description provided for @snap.
  ///
  /// In en, this message translates to:
  /// **'SNAP'**
  String get snap;

  /// No description provided for @lineUpYourAnswerHere.
  ///
  /// In en, this message translates to:
  /// **'Line up your answer here!'**
  String get lineUpYourAnswerHere;

  /// No description provided for @youDidIt.
  ///
  /// In en, this message translates to:
  /// **'You did it!'**
  String get youDidIt;

  /// No description provided for @greatJobSolvingPuzzle.
  ///
  /// In en, this message translates to:
  /// **'Great job solving the puzzle!'**
  String get greatJobSolvingPuzzle;

  /// No description provided for @nextPuzzle.
  ///
  /// In en, this message translates to:
  /// **'Next Puzzle →'**
  String get nextPuzzle;

  /// No description provided for @firstWeHave.
  ///
  /// In en, this message translates to:
  /// **'First, we have {num}.'**
  String firstWeHave(Object num);

  /// No description provided for @thenWeTakeAway.
  ///
  /// In en, this message translates to:
  /// **'Then we take away {num}.'**
  String thenWeTakeAway(Object num);

  /// No description provided for @thenWeAdd.
  ///
  /// In en, this message translates to:
  /// **'Then we add {num}.'**
  String thenWeAdd(Object num);

  /// No description provided for @letsCountCapsOneMoreTime.
  ///
  /// In en, this message translates to:
  /// **'Let\'s count the caps one more time!'**
  String get letsCountCapsOneMoreTime;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['bn', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'bn':
      return AppLocalizationsBn();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
