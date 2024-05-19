import 'package:flutter/material.dart';
import 'package:rate_the_beers/model/beer.dart';
import 'package:rate_the_beers/theme/app_theme.dart';
import 'package:rate_the_beers/util/cached_image_provider.dart';
import 'package:rate_the_beers/util/rewrite_image_url.dart';

class BeerPageAppBar extends StatelessWidget {
  final Beer beer;

  const BeerPageAppBar({required this.beer, super.key});

  @override
  Widget build(BuildContext context) {
    // without IntrinsicHeight, the image doesn't align properly
    return IntrinsicHeight(
      child: Stack(
        children: [
          _buildTitleContainer(context),
          Align(
            alignment: Alignment.bottomCenter,
            child: Image(
              height: 260,
              image: CachedImageProvider(
                url: beer.imageUrl,
                transformUrl: rewriteImageUrl,
              ).provider,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTitleContainer(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Material(
            color: kAppColor,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 36,
                right: 36,
                top: 36,
                bottom: 24,
              ),
              child: SafeArea(
                bottom: false,
                child: _buildTitle(context),
              ),
            ),
          ),
          const SizedBox(height: 100),
        ],
      );

  Widget _buildTitle(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 12),
          IconButton(
            onPressed: () => Navigator.of(context).maybePop(),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            visualDensity: VisualDensity.compact,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 4,
                horizontal: 24,
              ),
              child: Text(
                beer.name,
                textAlign: TextAlign.center,
                softWrap: true,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                  height: 1.475,
                ),
              ),
            ),
          ),
          const SizedBox(height: 160),
        ],
      );
}
