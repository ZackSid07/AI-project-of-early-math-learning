// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class AppLocalizationsBn extends AppLocalizations {
  AppLocalizationsBn([String locale = 'bn']) : super(locale);

  @override
  String get settings => 'সেটিংস';

  @override
  String get soundAndMusic => 'সাউন্ড এবং মিউজিক';

  @override
  String get voiceInstructions => 'ভয়েস নির্দেশাবলী';

  @override
  String get english => 'English';

  @override
  String get bangla => 'বাংলা';

  @override
  String get bottleCapMath => 'বোতল ক্যাপ ম্যাথ';

  @override
  String get bottleCapMathTitleCase => 'বোতল ক্যাপ ম্যাথ';

  @override
  String get makingMathTangible => 'গণিতকে বাস্তব এবং মজাদার করা।';

  @override
  String get version => 'সংস্করণ ১.০.০';

  @override
  String get resetAllProgress => 'সব অগ্রগতি রিসেট করুন';

  @override
  String get requiresParentToUnlock => '(আনলক করতে অভিভাবকের প্রয়োজন)';

  @override
  String get parentsOnly => 'শুধুমাত্র অভিভাবকদের জন্য';

  @override
  String get whatIsTwelveTimesFour => '১২ x ৪ কত?';

  @override
  String get answerHint => 'উত্তর';

  @override
  String get cancel => 'বাতিল';

  @override
  String get verify => 'যাচাই করুন';

  @override
  String get progressResetSuccessfully => 'অগ্রগতি সফলভাবে রিসেট হয়েছে';

  @override
  String get incorrectAnswer => 'ভুল উত্তর';

  @override
  String get mathBuddy => 'ম্যাথ বাডি';

  @override
  String get hearIt => 'শুনুন!';

  @override
  String get startScanning => 'স্ক্যানিং শুরু করুন';

  @override
  String get adventureMap => 'অ্যাডভেঞ্চার ম্যাপ';

  @override
  String levelUnlocked(Object level) {
    return 'লেভেল $level আনলক হয়েছে!';
  }

  @override
  String get practiceMode => 'অনুশীলন মোড';

  @override
  String get sharpenSkills => 'দক্ষতা বাড়ান';

  @override
  String get streak => 'স্ট্রিক';

  @override
  String daysStreak(Object count) {
    return '$count দিন';
  }

  @override
  String get mathJourney => 'অঙ্কের যাত্রা';

  @override
  String get mapView => 'ম্যাপ ভিউ';

  @override
  String get listView => 'লিস্ট ভিউ';

  @override
  String level(Object level) {
    return 'লেভেল $level';
  }

  @override
  String lvl(Object level) {
    return 'লেভেল $level';
  }

  @override
  String get done => 'সম্পন্ন';

  @override
  String get current => 'বর্তমান';

  @override
  String get locked => 'লক করা';

  @override
  String get playNow => 'এখন খেলুন ▶';

  @override
  String get startAdventure => 'অ্যাডভেঞ্চার শুরু করুন →';

  @override
  String get digitalCapsMode => 'ডিজিটাল ক্যাপস মোড';

  @override
  String get practiceModeFreePlay => 'অনুশীলন মোড: ফ্রি প্লে!';

  @override
  String get solve => 'সমাধান করুন: ';

  @override
  String get submit => 'জমা দিন';

  @override
  String get fillAllSlotsFirst => 'আগে সব স্লট পূরণ করুন!';

  @override
  String get greatJob => 'খুব ভালো! 🎉';

  @override
  String get solvedDigitally => 'আপনি ডিজিটালভাবে ধাঁধাটি সমাধান করেছেন!';

  @override
  String get next => 'পরবর্তী';

  @override
  String get camera => 'ক্যামেরা';

  @override
  String get missingAnswerCap => '\'=\' এর পরে উত্তরের ক্যাপ নেই';

  @override
  String couldNotParseNumber(Object equation) {
    return 'সংখ্যা বুঝতে পারিনি (পড়া হয়েছে: $equation)';
  }

  @override
  String missingFirstNumber(Object op) {
    return '\'$op\' এর আগে প্রথম সংখ্যা নেই';
  }

  @override
  String missingSecondNumber(Object op) {
    return '\'$op\' এর পরে দ্বিতীয় সংখ্যা নেই';
  }

  @override
  String noOperatorFound(Object equation) {
    return 'কোনো অপারেটর পাওয়া যায়নি (পড়া হয়েছে: $equation)।';
  }

  @override
  String noEqualsSignFound(Object equation) {
    return 'কোনো সমান চিহ্ন পাওয়া যায়নি (পড়া হয়েছে: $equation)।';
  }

  @override
  String incorrectMismatch(
      Object num1, Object op, Object num2, Object detectedAnswer) {
    return 'ভুল। $num1 $op $num2 $detectedAnswer নয়';
  }

  @override
  String get alignCapsAndPressCheck => 'ক্যাপগুলো সারিবদ্ধ করুন এবং চেক টিপুন';

  @override
  String get analyzingEquation => 'সমীকরণ বিশ্লেষণ করা হচ্ছে...';

  @override
  String get errorCapturingImage =>
      'ছবি তুলতে সমস্যা হয়েছে। আবার চেষ্টা করুন।';

  @override
  String get noBottleCapsFound =>
      'কোনো বোতলের ক্যাপ পাওয়া যায়নি! আবার চেষ্টা করুন।';

  @override
  String get noAlignedEquationFound => 'কোনো সারিবদ্ধ সমীকরণ পাওয়া যায়নি।';

  @override
  String correctMatch(Object equation) {
    return 'সঠিক! $equation';
  }

  @override
  String oopsBuildThis(Object displayTargetLeft) {
    return 'উফস! এই সমীকরণটি তৈরি করুন: $displayTargetLeft = ?';
  }

  @override
  String get hintScreenOops => '💡 উফস! প্রায় হয়ে গেছে।';

  @override
  String get hintScreenCheckClosely => 'চলুন সংখ্যাগুলো মনোযোগ দিয়ে দেখি!';

  @override
  String get hintScreenEquationSoFar => 'এখন পর্যন্ত সমীকরণটি হলো:';

  @override
  String get hintScreenMissingCap => 'আমাদের একটি ক্যাপ মিসিং!';

  @override
  String get tryAgain => 'আবার চেষ্টা করুন';

  @override
  String get countingCheck => 'গণনা চেক';

  @override
  String get hereIsHowWeCalculate =>
      'আমরা এটি কীভাবে হিসাব করি তা এখানে দেওয়া হলো:';

  @override
  String theAnswerIs(Object answer) {
    return 'উত্তরটি হলো $answer!';
  }

  @override
  String letsTryTheNumber(Object answer) {
    return 'চলুন একসাথে $answer নম্বরটি চেষ্টা করি!\nচলুন আপেলগুলো মনোযোগ দিয়ে দেখি。';
  }

  @override
  String get whatsTheAnswer => 'উত্তর কী?';

  @override
  String get analyzing => 'বিশ্লেষণ করা হচ্ছে...';

  @override
  String get snap => 'স্ন্যাপ';

  @override
  String get lineUpYourAnswerHere => 'এখানে আপনার উত্তরটি সারিবদ্ধ করুন!';

  @override
  String get youDidIt => 'আপনি পেরেছেন!';

  @override
  String get greatJobSolvingPuzzle => 'ধাঁধাটি সমাধান করার জন্য খুব ভালো!';

  @override
  String get nextPuzzle => 'পরবর্তী ধাঁধা →';

  @override
  String firstWeHave(Object num) {
    return 'প্রথমে, আমাদের কাছে আছে $num।';
  }

  @override
  String thenWeTakeAway(Object num) {
    return 'তারপর আমরা $num সরিয়ে নেব।';
  }

  @override
  String thenWeAdd(Object num) {
    return 'তারপর আমরা $num যোগ করব।';
  }

  @override
  String get letsCountCapsOneMoreTime => 'চলুন ক্যাপগুলো আরেকবার গুনি!';
}
