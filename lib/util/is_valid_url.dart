bool isValidUrl(String text) => Uri.tryParse(text)?.isAbsolute ?? false;
