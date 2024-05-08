import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rate_the_beers/model/fermentation.dart';
import 'package:rate_the_beers/model/mash_temperature.dart';

part 'brewing_method.freezed.dart';
part 'brewing_method.g.dart';

@freezed
class BrewingMethod with _$BrewingMethod {
  const factory BrewingMethod({
    @JsonKey(name: 'mash_temp') required List<MashTemperature> mashTemperature,
    required Fermentation fermentation,
    required String? twist,
  }) = _BrewingMethod;

  factory BrewingMethod.fromJson(Map<String, dynamic> json) =>
      _$BrewingMethodFromJson(json);
}
