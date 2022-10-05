import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'market.freezed.dart';
part 'market.g.dart';

@freezed
class Market with _$Market {
  const factory Market({
    // ignore: invalid_annotation_target
    @JsonKey(name: 'display_name') required String displayName,
    required String market,
    required String symbol,
  }) = _Market;

  factory Market.fromJson(Map<String, dynamic> json) => _$MarketFromJson(json);
}
