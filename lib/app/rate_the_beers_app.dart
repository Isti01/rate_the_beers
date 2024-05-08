import 'package:flutter/material.dart';
import 'package:rate_the_beers/app/app_bloc_providers.dart';
import 'package:rate_the_beers/app/app_repository_providers.dart';
import 'package:rate_the_beers/l10n/app_localizations.g.dart';
import 'package:rate_the_beers/pages/beer_list/beer_list_page.dart';

class RateTheBeersApp extends StatelessWidget {
  const RateTheBeersApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppRepositoryProviders(
      child: AppBlocProviders(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,
          home: const BeerListPage(),
        ),
      ),
    );
  }
}
