import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rate_the_beers/model/amount.dart';

part 'hops.freezed.dart';
part 'hops.g.dart';

@freezed
class Hops with _$Hops {
  const factory Hops({
    required String name,
    required Amount amount,
    required String add,
    required String attribute,
  }) = _Hops;

  factory Hops.fromJson(Map<String, dynamic> json) => _$HopsFromJson(json);
}
