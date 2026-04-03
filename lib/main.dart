import 'package:application_evently/l10n/app_localizations.dart';
import 'package:application_evently/provider/language_provider.dart';
import 'package:application_evently/provider/theme_provider.dart';
import 'package:application_evently/ui/homa_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main(){
  runApp(MultiProvider(providers: [
        ChangeNotifierProvider(create: (context) => LanguageProvider(),),
        ChangeNotifierProvider(create: (context) => ThemeProvider(),)
    ],child: MyApp(),
  )
  );
}
class MyApp extends StatelessWidget {
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<LanguageProvider>(context);
    var themeProvider =Provider.of<ThemeProvider>(context) ;
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    locale: Locale(languageProvider.appLanguage),
     home: HomaScreen(),
    themeMode:themeProvider.appTheme,

  );

  }
}
