import 'package:application_evently/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/language_provider.dart';

class HomaScreen extends StatelessWidget {
  const HomaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<LanguageProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.title_1boarding),
        centerTitle: true,
      ),
    );
  }
}
