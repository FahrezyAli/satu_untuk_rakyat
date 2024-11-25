import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:satu_untuk_rakyat/src/views/general/camera_page.dart';
import 'package:satu_untuk_rakyat/src/views/general/landing_page.dart';
import 'package:satu_untuk_rakyat/src/views/general/start_page.dart';
import 'package:satu_untuk_rakyat/src/views/general/status_page.dart';
import 'package:satu_untuk_rakyat/src/views/health/health_form_page.dart';
import 'package:satu_untuk_rakyat/src/views/sim/sim_form_page.dart';
import 'package:satu_untuk_rakyat/src/utils/colors.dart';

/// The Widget that configures your application.
class SuratApp extends StatelessWidget {
  const SuratApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Providing a restorationScopeId allows the Navigator built by the
      // MaterialApp to restore the navigation stack when a user leaves and
      // returns to the app after it has been killed while running in the
      // background.
      restorationScopeId: 'SURAT',

      // Provide the generated AppLocalizations to the MaterialApp. This
      // allows descendant Widgets to display the correct translations
      // depending on the user's locale.
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      // Supported locales
      supportedLocales: const [
        Locale('en'), // English, no country code
        Locale('id'), // Indonesian, no country code
      ],

      title: "Satu Untuk Rakyat",

      // Define theme
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: suratBlue,
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: suratBlue),
        scaffoldBackgroundColor: Colors.white,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: suratBlue,
          ),
        ),
        fontFamily: "Inter",
        appBarTheme: AppBarTheme(
          backgroundColor: suratBlue,
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w800,
            fontSize: 20,
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: suratBlue),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(
            color: Colors.grey,
            fontFamily: "Rubik",
            fontSize: 14,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          isDense: true,
        ),
      ),

      // Define a function to handle named routes in order to support
      // Flutter web url navigation and deep linking.
      onGenerateRoute: (RouteSettings routeSettings) {
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) {
            switch (routeSettings.name) {
              case '/':
                return const StartPage();
              case '/landing':
                return const LandingPage();
              case '/camera':
                return const CameraPage();
              case '/sim-extension-form':
                return const SimFormPage();
              case '/health-form':
                return const HealthFormPage();
              case '/status':
                return const StatusPage();
              default:
                return Scaffold(
                  body: Center(
                    child: Text('No route defined for ${routeSettings.name}'),
                  ),
                );
            }
          },
        );
      },
    );
  }
}
