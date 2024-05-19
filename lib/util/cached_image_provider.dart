import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:rate_the_beers/asset_keys.dart';
import 'package:rate_the_beers/util/is_valid_url.dart';

final _kImageCacheManager = CacheManager(Config(
  'beer_app_image_cache',
  stalePeriod: const Duration(days: 30),
  maxNrOfCacheObjects: 250,
));

class CachedImageProvider {
  final String? url;
  final bool canUseDebugFallback;
  final String Function(String url)? transformUrl;

  const CachedImageProvider({
    required this.url,
    this.transformUrl,
    this.canUseDebugFallback = true,
  });

  ImageProvider get provider {
    final url = this.url;
    if (url == null) {
      if (kDebugMode && canUseDebugFallback) {
        return const AssetImage(kDebugPlaceholder);
      } else {
        return const AssetImage(kTransparentPlaceholder);
      }
    }
    if (isValidUrl(url)) {
      return CachedNetworkImageProvider(
        transformUrl?.call(url) ?? url,
        cacheManager: _kImageCacheManager,
      );
    }
    return AssetImage(url);
  }
}
