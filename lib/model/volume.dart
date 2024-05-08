import 'package:freezed_annotation/freezed_annotation.dart';

part 'volume.freezed.dart';
part 'volume.g.dart';

@freezed
class Volume with _$Volume {
  const factory Volume({
    required int value,
    required String unit,
  }) = _Volume;

  factory Volume.fromJson(Map<String, dynamic> json) => _$VolumeFromJson(json);
}
