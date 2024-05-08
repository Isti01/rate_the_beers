import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rate_the_beers/model/hops.dart';
import 'package:rate_the_beers/model/malt.dart';

part 'ingredient.freezed.dart';
part 'ingredient.g.dart';

@freezed
class Ingredient with _$Ingredient {
  const factory Ingredient({
    required List<Malt> malt,
    required List<Hops> hops,
    required String? yeast,
  }) = _Ingredient;

  factory Ingredient.fromJson(Map<String, dynamic> json) =>
      _$IngredientFromJson(json);
}
