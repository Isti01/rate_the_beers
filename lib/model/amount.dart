import 'package:freezed_annotation/freezed_annotation.dart';

part 'amount.freezed.dart';
part 'amount.g.dart';

@freezed
class Amount with _$Amount {
  const factory Amount({
    required double value,
    required String unit,
  }) = _Amount;

  factory Amount.fromJson(Map<String, dynamic> json) => _$AmountFromJson(json);
}
