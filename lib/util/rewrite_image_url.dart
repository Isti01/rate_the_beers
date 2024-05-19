String rewriteImageUrl(String url) {
  final uri = Uri.parse(url);
  final transformed = uri.replace(
    path: uri.pathSegments.lastOrNull,
    host: 'punkapi-images.web.app',
  );

  return transformed.toString();
}
