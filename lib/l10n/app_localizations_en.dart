// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get settings => 'Settings';

  @override
  String get soundAndMusic => 'Sound & Music';

  @override
  String get voiceInstructions => 'Voice Instructions';

  @override
  String get english => 'English';

  @override
  String get bangla => 'Bangla';

  @override
  String get bottleCapMath => 'BOTTLE CAP MATH';

  @override
  String get bottleCapMathTitleCase => 'Bottle Cap Math';

  @override
  String get makingMathTangible => 'Making math tangible and fun.';

  @override
  String get version => 'Version 1.0.0';

  @override
  String get resetAllProgress => 'Reset All Progress';

  @override
  String get requiresParentToUnlock => '(REQUIRES PARENT TO UNLOCK)';

  @override
  String get parentsOnly => 'Parents Only';

  @override
  String get whatIsTwelveTimesFour => 'What is 12 x 4?';

  @override
  String get answerHint => 'Answer';

  @override
  String get cancel => 'Cancel';

  @override
  String get verify => 'Verify';

  @override
  String get progressResetSuccessfully => 'Progress Reset Successfully';

  @override
  String get incorrectAnswer => 'Incorrect Answer';

  @override
  String get mathBuddy => 'Math Buddy';

  @override
  String get hearIt => 'Hear it!';

  @override
  String get startScanning => 'START SCANNING';

  @override
  String get adventureMap => 'Adventure Map';

  @override
  String levelUnlocked(Object level) {
    return 'LEVEL $level UNLOCKED!';
  }

  @override
  String get practiceMode => 'Practice Mode';

  @override
  String get sharpenSkills => 'SHARPEN SKILLS';

  @override
  String get streak => 'STREAK';

  @override
  String daysStreak(Object count) {
    return '$count Day(s)';
  }

  @override
  String get mathJourney => 'Math Journey';

  @override
  String get mapView => 'Map View';

  @override
  String get listView => 'List View';

  @override
  String level(Object level) {
    return 'Level $level';
  }

  @override
  String lvl(Object level) {
    return 'Lvl $level';
  }

  @override
  String get done => 'DONE';

  @override
  String get current => 'CURRENT';

  @override
  String get locked => 'LOCKED';

  @override
  String get playNow => 'Play Now ▶';

  @override
  String get startAdventure => 'Start Adventure →';

  @override
  String get digitalCapsMode => 'DIGITAL CAPS MODE';

  @override
  String get practiceModeFreePlay => 'Practice Mode: Free Play!';

  @override
  String get solve => 'Solve: ';

  @override
  String get submit => 'SUBMIT';

  @override
  String get fillAllSlotsFirst => 'Fill all slots first!';

  @override
  String get greatJob => 'Great Job! 🎉';

  @override
  String get solvedDigitally => 'You solved the puzzle digitally!';

  @override
  String get next => 'NEXT';

  @override
  String get camera => 'CAMERA';

  @override
  String get missingAnswerCap => 'Missing answer cap after \'=\'';

  @override
  String couldNotParseNumber(Object equation) {
    return 'Could not parse number (Read: $equation)';
  }

  @override
  String missingFirstNumber(Object op) {
    return 'Missing first number before \'$op\'';
  }

  @override
  String missingSecondNumber(Object op) {
    return 'Missing second number after \'$op\'';
  }

  @override
  String noOperatorFound(Object equation) {
    return 'No operator found (Read: $equation).';
  }

  @override
  String noEqualsSignFound(Object equation) {
    return 'No equals sign found (Read: $equation).';
  }

  @override
  String incorrectMismatch(
      Object num1, Object op, Object num2, Object detectedAnswer) {
    return 'Incorrect. $num1 $op $num2 is NOT $detectedAnswer';
  }

  @override
  String get alignCapsAndPressCheck => 'Align caps and press Check';

  @override
  String get analyzingEquation => 'Analyzing Equation...';

  @override
  String get errorCapturingImage => 'Error capturing image. Try again.';

  @override
  String get noBottleCapsFound => 'No bottle caps found! Try again.';

  @override
  String get noAlignedEquationFound => 'No aligned equation found.';

  @override
  String correctMatch(Object equation) {
    return 'Correct! $equation';
  }

  @override
  String oopsBuildThis(Object displayTargetLeft) {
    return 'Oops! Build this equation: $displayTargetLeft = ?';
  }

  @override
  String get hintScreenOops => '💡 Oops! Almost there.';

  @override
  String get hintScreenCheckClosely => 'Let\'s check the numbers closely!';

  @override
  String get hintScreenEquationSoFar => 'Here is the equation so far:';

  @override
  String get hintScreenMissingCap => 'We are missing a cap!';

  @override
  String get tryAgain => 'TRY AGAIN';

  @override
  String get countingCheck => 'COUNTING CHECK';

  @override
  String get hereIsHowWeCalculate => 'Here is how we calculate this:';

  @override
  String theAnswerIs(Object answer) {
    return 'THE ANSWER IS $answer!';
  }

  @override
  String letsTryTheNumber(Object answer) {
    return 'Let\'s try the number $answer together!\nLet\'s look closely at the apples.';
  }

  @override
  String get whatsTheAnswer => 'What\'s the answer?';

  @override
  String get analyzing => 'ANALYZING...';

  @override
  String get snap => 'SNAP';

  @override
  String get lineUpYourAnswerHere => 'Line up your answer here!';

  @override
  String get youDidIt => 'You did it!';

  @override
  String get greatJobSolvingPuzzle => 'Great job solving the puzzle!';

  @override
  String get nextPuzzle => 'Next Puzzle →';

  @override
  String firstWeHave(Object num) {
    return 'First, we have $num.';
  }

  @override
  String thenWeTakeAway(Object num) {
    return 'Then we take away $num.';
  }

  @override
  String thenWeAdd(Object num) {
    return 'Then we add $num.';
  }

  @override
  String get letsCountCapsOneMoreTime => 'Let\'s count the caps one more time!';
}
