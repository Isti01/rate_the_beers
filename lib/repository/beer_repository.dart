import 'dart:convert';

import 'package:rate_the_beers/model/beer.dart';
import 'package:rate_the_beers/util/get_cached_with_retry.dart';

const _kBeerApiRoot = 'localhost:3333'; // todo host it somewhere

abstract class BeerRepository {
  Future<List<Beer>> fetchBeers({int page = 1});
}

class BeerApiRepository implements BeerRepository {
  @override
  Future<List<Beer>> fetchBeers({int page = 1}) async {
    final responseBody = await getCachedWithRetry(
      Uri.http(_kBeerApiRoot, '/v2/beers', {'page': page.toString()}),
    );
    final beers = jsonDecode(responseBody) as List<dynamic>;
    return beers
        .map((json) => Beer.fromJson(Map<String, dynamic>.from(json)))
        .toList(growable: false);
  }
}
