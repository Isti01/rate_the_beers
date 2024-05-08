import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rate_the_beers/model/temperature.dart';

part 'mash_temperature.freezed.dart';
part 'mash_temperature.g.dart';

@freezed
class MashTemperature with _$MashTemperature {
  const factory MashTemperature({
    @JsonKey(name: "temp") required Temperature temp,
    required int? duration,
  }) = _MashTemperature;

  factory MashTemperature.fromJson(Map<String, dynamic> json) =>
      _$MashTemperatureFromJson(json);
}
