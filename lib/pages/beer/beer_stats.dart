import 'package:flutter/material.dart';
import 'package:rate_the_beers/l10n/app_localizations.g.dart';
import 'package:rate_the_beers/l10n/localization_util.dart';
import 'package:rate_the_beers/model/beer.dart';
import 'package:rate_the_beers/theme/app_theme.dart';

class BeerStats extends StatelessWidget {
  final Beer beer;

  const BeerStats({required this.beer, super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final ibu = beer.ibu;
    return Wrap(
      spacing: 32,
      runSpacing: 32,
      children: [
        _buildStat(
          title: localizations.abvLabel,
          value: '${LocalizationUtil.decimal(
            localizations: localizations,
            amount: beer.abv,
            decimalDigits: 1,
          )}%',
        ),
        if (ibu != null) ...[
          _buildStat(
            title: localizations.ibuLabel,
            value: LocalizationUtil.decimal(
              localizations: localizations,
              amount: ibu,
              decimalDigits: 1,
            ),
          ),
        ]
      ],
    );
  }

  Widget _buildStat({required String title, required String value}) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              color: kAppColor,
              fontSize: 32,
              height: 1,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      );
}
