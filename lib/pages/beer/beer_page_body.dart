import 'package:flutter/material.dart';
import 'package:rate_the_beers/model/beer.dart';
import 'package:rate_the_beers/pages/beer/beer_ingredients.dart';
import 'package:rate_the_beers/pages/beer/beer_stats.dart';

class BeerPageBody extends StatelessWidget {
  final Beer beer;

  const BeerPageBody({required this.beer, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          beer.tagline,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        const SizedBox(height: 4),
        Text(
          beer.description,
          style: const TextStyle(fontSize: 16, height: 1.5),
        ),
        const SizedBox(height: 8),
        BeerStats(beer: beer),
        const SizedBox(height: 8),
        BeerIngredients(beer: beer),
      ],
    );
  }
}
