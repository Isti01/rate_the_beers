import 'dart:convert';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:http/http.dart' as http;
import 'package:retry/retry.dart';

final _kApiCacheManager = CacheManager(Config(
  'beer_app_api_cache',
  stalePeriod: const Duration(days: 7),
  maxNrOfCacheObjects: 100,
));

Future<String> getCachedWithRetry(Uri uri) async {
  final url = uri.toString();
  final cachedResponse = await _kApiCacheManager.getFileFromCache(url);
  if (cachedResponse != null) {
    return cachedResponse.file.readAsBytes().then(utf8.decode);
  }

  final result = await retry(() => http.get(uri).then((res) => res.body));
  await _kApiCacheManager.putFile(url, utf8.encode(result));
  return result;
}
