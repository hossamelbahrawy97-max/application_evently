import 'package:application_evently/l10n/app_localizations.dart';
import 'package:application_evently/provider/language_provider.dart';
import 'package:application_evently/ui/homa_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(ChangeNotifierProvider(child: MyApp(),
      create:(context) => LanguageProvider(),
  )

  );
}
class MyApp extends StatelessWidget {

  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<LanguageProvider>(context);

  return MaterialApp(
    debugShowCheckedModeBanner: false,
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    locale: Locale(languageProvider.appLanguage),
     home: HomaScreen(),
  );

  }
}
