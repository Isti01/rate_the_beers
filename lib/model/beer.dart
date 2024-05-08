import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rate_the_beers/model/brewing_method.dart';
import 'package:rate_the_beers/model/ingredient.dart';
import 'package:rate_the_beers/model/volume.dart';

part 'beer.freezed.dart';
part 'beer.g.dart';

@freezed
class Beer with _$Beer {
  const factory Beer({
    required int id,
    required String name,
    required String tagline,
    @JsonKey(name: 'first_brewed') required String firstBrewed,
    required String description,
    @JsonKey(name: 'image_url') required String? imageUrl,
    required double abv,
    required double? ibu,
    @JsonKey(name: 'target_fg') required double? targetFg,
    @JsonKey(name: 'target_og') required double? targetOg,
    required double? ebc,
    required double? srm,
    required double? ph,
    @JsonKey(name: 'attenuation_level') required double? attenuationLevel,
    required Volume volume,
    @JsonKey(name: 'boil_volume') required Volume boilVolume,
    required BrewingMethod method,
    required Ingredient ingredients,
    @JsonKey(name: 'food_pairing') required List<String> foodPairing,
    @JsonKey(name: 'brewers_tips') required String brewersTips,
    @JsonKey(name: 'contributed_by') required String contributedBy,
  }) = _Beer;

  factory Beer.fromJson(Map<String, dynamic> json) => _$BeerFromJson(json);
}
