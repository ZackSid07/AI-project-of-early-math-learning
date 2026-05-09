import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:math_buddy/l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'providers/course_provider.dart';
import 'providers/settings_provider.dart';
import 'screens/home_screen.dart';

List<CameraDescription> cameras = [];

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    cameras = await availableCameras();
  } on CameraException catch (e) {
    debugPrint('Error initializing cameras: $e');
  }
  runApp(const MathBuddyApp());
}

class MathBuddyApp extends StatelessWidget {
  const MathBuddyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CourseProvider()),
        ChangeNotifierProvider(
            create: (_) => SettingsProvider()..loadSettings()),
      ],
      child: Consumer<SettingsProvider>(
        builder: (context, settings, child) {
          return MaterialApp(
            title: 'Bottle Cap Math',
            theme: ThemeData(
              textTheme: GoogleFonts.nunitoTextTheme(),
              colorScheme: ColorScheme.fromSeed(
                seedColor: const Color(0xFF448AFF),
                primary: const Color(0xFF448AFF),
                secondary: const Color(0xFFFF5252),
                surface: Colors.white,
              ),
              useMaterial3: true,
            ),
            locale: settings.currentLocale,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
