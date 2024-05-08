import 'package:freezed_annotation/freezed_annotation.dart';

part 'temperature.freezed.dart';
part 'temperature.g.dart';

@freezed
class Temperature with _$Temperature {
  const factory Temperature({
    required int? value,
    required String unit,
  }) = _Temperature;

  factory Temperature.fromJson(Map<String, dynamic> json) =>
      _$TemperatureFromJson(json);
}
