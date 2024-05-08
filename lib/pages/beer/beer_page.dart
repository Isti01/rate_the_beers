import 'package:flutter/material.dart';
import 'package:rate_the_beers/model/beer.dart';
import 'package:rate_the_beers/pages/beer/beer_page_app_bar.dart';
import 'package:rate_the_beers/pages/beer/beer_page_body.dart';

class BeerPage extends StatelessWidget {
  final Beer beer;

  const BeerPage({required this.beer, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            BeerPageAppBar(beer: beer),
            Padding(
              padding: const EdgeInsets.only(
                left: 40,
                bottom: 40,
                top: 16,
                right: 40,
              ),
              child: BeerPageBody(beer: beer),
            )
          ],
        ),
      ),
    );
  }
}
