import 'package:application_evently/l10n/app_localizations.dart';
import 'package:application_evently/utils/app_assets.dart';
import 'package:application_evently/utils/app_styles.dart';
import 'package:application_evently/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/language_provider.dart';
import '../provider/theme_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<LanguageProvider>(context);
var themeProvider =Provider.of<ThemeProvider>(context) ;
    return Scaffold(

    body:
    Text('Home Screen',
    style: AppStyles.semi20Black,
    textAlign: TextAlign.end,),

    );
  }
}
