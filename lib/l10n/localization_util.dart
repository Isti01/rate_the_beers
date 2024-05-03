import 'package:intl/intl.dart';
import 'package:rate_the_beers/l10n/app_localizations.g.dart';

abstract class LocalizationUtil {
  static String currency({
    required AppLocalizations localizations,
    required String currencySymbol,
    required num amount,
    int decimalDigits = 2,
  }) =>
      NumberFormat.currency(
        locale: localizations.localeName,
        symbol: currencySymbol,
        decimalDigits: decimalDigits,
      ).format(amount);

  static String decimal({
    required AppLocalizations localizations,
    required num amount,
    int decimalDigits = 2,
  }) =>
      NumberFormat.decimalPatternDigits(
        locale: localizations.localeName,
        decimalDigits: decimalDigits,
      ).format(amount);
}
