import 'package:flutter/material.dart';
import 'package:rate_the_beers/asset_keys.dart';
import 'package:rate_the_beers/l10n/app_localizations.g.dart';
import 'package:rate_the_beers/theme/app_theme.dart';

class BeerListAppBar extends StatelessWidget {
  const BeerListAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Material(
      color: kAppColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
      ),
      elevation: 8,
      child: SizedBox(
        width: double.infinity,
        height: 164,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 36,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  localizations.listTitle,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w800,
                    height: 1.475,
                  ),
                ),
                const SizedBox(width: 5),
                SizedBox.square(dimension: 32, child: Image.asset(kBeerIcon))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
