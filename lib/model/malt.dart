import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rate_the_beers/model/amount.dart';

part 'malt.freezed.dart';
part 'malt.g.dart';

@freezed
class Malt with _$Malt {
  const factory Malt({
    required String name,
    required Amount amount,
  }) = _Malt;

  factory Malt.fromJson(Map<String, dynamic> json) => _$MaltFromJson(json);
}
