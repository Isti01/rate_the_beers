import 'package:flutter/material.dart';
import 'package:rate_the_beers/l10n/app_localizations.g.dart';
import 'package:rate_the_beers/l10n/localization_util.dart';
import 'package:rate_the_beers/model/beer.dart';
import 'package:rate_the_beers/model/hops.dart';
import 'package:rate_the_beers/model/malt.dart';

class BeerIngredients extends StatelessWidget {
  final Beer beer;

  const BeerIngredients({required this.beer, super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          localizations.ingredientsHeading,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        Text(
          _getIngredientList(localizations),
          style: const TextStyle(fontSize: 16, height: 1.5),
        )
      ],
    );
  }

  String _getIngredientList(AppLocalizations localizations) {
    final malt = beer.ingredients.malt;
    final hops = beer.ingredients.hops;
    final deDuplicatedHops = hops.indexed
        .where((hopsWithIndex) => hops
            .take(hopsWithIndex.$1)
            .every((hops) => hops.name != hopsWithIndex.$2.name))
        .map((hopsWithIndex) => hopsWithIndex.$2);
    return [
      ...malt.map((malt) => _maltToString(malt, localizations)),
      ...deDuplicatedHops.map((hops) => _hopsToString(hops, localizations)),
      if (beer.ingredients.yeast != null) localizations.yeastIngredient
    ].join(', ');
  }

  String _maltToString(Malt malt, AppLocalizations localizations) =>
      '${malt.name} (${LocalizationUtil.decimal(localizations: localizations, amount: malt.amount.value)} ${malt.amount.unit})';

  String _hopsToString(Hops hops, AppLocalizations localizations) =>
      '${hops.name} (${LocalizationUtil.decimal(localizations: localizations, amount: hops.amount.value)} ${hops.amount.unit})';
}
