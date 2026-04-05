import 'package:application_evently/l10n/app_localizations.dart';
import 'package:application_evently/provider/language_provider.dart';
import 'package:application_evently/provider/theme_provider.dart';
import 'package:application_evently/ui/home_screen.dart';
import 'package:application_evently/ui/onboarding/onboarding_screen.dart';
import 'package:application_evently/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



import 'cache/cache_helper.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized() ;
  await CacheHelper.init() ;
  bool isOnboardingDone  = CacheHelper.getData(key: 'isOnboardingDone')
      ?? false ;

  runApp(MultiProvider(providers: [
        ChangeNotifierProvider(create: (context) => LanguageProvider(),),
        ChangeNotifierProvider(create: (context) => ThemeProvider(),)
    ],child: MyApp(
    isOnboardingDone: isOnboardingDone,
  ),
  )
  );
}
class MyApp extends StatelessWidget {
  final bool isOnboardingDone ;
  const MyApp({super.key,
    required this.isOnboardingDone,
  });
  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<LanguageProvider>(context);
    var themeProvider =Provider.of<ThemeProvider>(context) ;
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    locale: Locale(languageProvider.appLanguage),
     home: isOnboardingDone ? HomeScreen() :  OnboardingScreen(),
    themeMode:themeProvider.appTheme,
    routes: {
      AppRoutes.onboardingRouteName: (context) => const OnboardingScreen(),
AppRoutes.homeRouteName: (context) => const HomeScreen(),
    },

  );

  }
}
