import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rate_the_beers/model/temperature.dart';

part 'fermentation.freezed.dart';
part 'fermentation.g.dart';

@freezed
class Fermentation with _$Fermentation {
  const factory Fermentation({
    @JsonKey(name: 'temp') required Temperature temperature,
  }) = _Fermentation;

  factory Fermentation.fromJson(Map<String, dynamic> json) =>
      _$FermentationFromJson(json);
}
