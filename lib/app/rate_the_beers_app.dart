import 'package:flutter/material.dart';
import 'package:rate_the_beers/l10n/app_localizations.g.dart';

class RateTheBeersApp extends StatelessWidget {
  const RateTheBeersApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,
      home: const Scaffold(
        body: Center(
          child: Text('HelloWorld'),
        ),
      ),
    );
  }
}
