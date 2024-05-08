import 'package:flutter/material.dart';
import 'package:rate_the_beers/components/beer_app_filled_button.dart';
import 'package:rate_the_beers/l10n/app_localizations.g.dart';
import 'package:rate_the_beers/l10n/localization_util.dart';
import 'package:rate_the_beers/model/beer.dart';
import 'package:rate_the_beers/pages/beer/beer_page.dart';
import 'package:rate_the_beers/theme/app_theme.dart';
import 'package:rate_the_beers/util/cached_Image_provider.dart';

class BeerListTile extends StatelessWidget {
  final Beer beer;

  const BeerListTile({
    required this.beer,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildThumbnail(),
        const SizedBox(width: 24),
        Expanded(child: _buildTileBody(localizations, context)),
      ],
    );
  }

  Widget _buildThumbnail() => Material(
        color: kAppColor,
        shape: kAppBorderRadius,
        child: SizedBox(
          width: 112,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Image(
              height: 100,
              image: CachedImageProvider(url: beer.imageUrl).provider,
            ),
          ),
        ),
      );

  Widget _buildTileBody(AppLocalizations localizations, BuildContext context) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            beer.name,
            softWrap: true,
            style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontSize: 20,
                height: 1),
          ),
          const SizedBox(height: 4),
          Text(
            beer.tagline,
            softWrap: true,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              height: 1,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '${LocalizationUtil.decimal(
              localizations: localizations,
              amount: beer.abv,
              decimalDigits: 1,
            )}%',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: kColoredFontColor,
              fontSize: 20,
              height: 1,
            ),
          ),
          const SizedBox(height: 8),
          BeerAppFilledButton(
            color: Colors.black,
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => BeerPage(beer: beer),
              ),
            ),
            child: Text(
              localizations.moreInfoCallToAction,
              style: const TextStyle(color: Colors.white),
            ),
          )
        ],
      );
}
