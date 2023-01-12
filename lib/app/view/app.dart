import 'package:crms/bottomNavigation/bottom_navigation.dart';
import 'package:crms/l10n/l10n.dart';
import 'package:crms/loginScreen/login_screen.dart';
import 'package:crms/splashScreen/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
            colorScheme: ColorScheme.fromSwatch(
              accentColor: const Color(0xFF13B9FF),
            ),
          ),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: LottieSplah(),
          routes: {'login': (context) => BottomNaivgation()},
        );
      },
    );
  }
}
