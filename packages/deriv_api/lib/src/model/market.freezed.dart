// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'market.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Market _$MarketFromJson(Map<String, dynamic> json) {
  return _Market.fromJson(json);
}

/// @nodoc
mixin _$Market {
// ignore: invalid_annotation_target
  @JsonKey(name: 'display_name')
  String get displayName => throw _privateConstructorUsedError;
  String get market => throw _privateConstructorUsedError;
  String get symbol => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MarketCopyWith<Market> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarketCopyWith<$Res> {
  factory $MarketCopyWith(Market value, $Res Function(Market) then) =
      _$MarketCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'display_name') String displayName,
      String market,
      String symbol});
}

/// @nodoc
class _$MarketCopyWithImpl<$Res> implements $MarketCopyWith<$Res> {
  _$MarketCopyWithImpl(this._value, this._then);

  final Market _value;
  // ignore: unused_field
  final $Res Function(Market) _then;

  @override
  $Res call({
    Object? displayName = freezed,
    Object? market = freezed,
    Object? symbol = freezed,
  }) {
    return _then(_value.copyWith(
      displayName: displayName == freezed
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      market: market == freezed
          ? _value.market
          : market // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: symbol == freezed
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_MarketCopyWith<$Res> implements $MarketCopyWith<$Res> {
  factory _$$_MarketCopyWith(_$_Market value, $Res Function(_$_Market) then) =
      __$$_MarketCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'display_name') String displayName,
      String market,
      String symbol});
}

/// @nodoc
class __$$_MarketCopyWithImpl<$Res> extends _$MarketCopyWithImpl<$Res>
    implements _$$_MarketCopyWith<$Res> {
  __$$_MarketCopyWithImpl(_$_Market _value, $Res Function(_$_Market) _then)
      : super(_value, (v) => _then(v as _$_Market));

  @override
  _$_Market get _value => super._value as _$_Market;

  @override
  $Res call({
    Object? displayName = freezed,
    Object? market = freezed,
    Object? symbol = freezed,
  }) {
    return _then(_$_Market(
      displayName: displayName == freezed
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      market: market == freezed
          ? _value.market
          : market // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: symbol == freezed
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Market with DiagnosticableTreeMixin implements _Market {
  const _$_Market(
      {@JsonKey(name: 'display_name') required this.displayName,
      required this.market,
      required this.symbol});

  factory _$_Market.fromJson(Map<String, dynamic> json) =>
      _$$_MarketFromJson(json);

// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'display_name')
  final String displayName;
  @override
  final String market;
  @override
  final String symbol;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Market(displayName: $displayName, market: $market, symbol: $symbol)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Market'))
      ..add(DiagnosticsProperty('displayName', displayName))
      ..add(DiagnosticsProperty('market', market))
      ..add(DiagnosticsProperty('symbol', symbol));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Market &&
            const DeepCollectionEquality()
                .equals(other.displayName, displayName) &&
            const DeepCollectionEquality().equals(other.market, market) &&
            const DeepCollectionEquality().equals(other.symbol, symbol));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(displayName),
      const DeepCollectionEquality().hash(market),
      const DeepCollectionEquality().hash(symbol));

  @JsonKey(ignore: true)
  @override
  _$$_MarketCopyWith<_$_Market> get copyWith =>
      __$$_MarketCopyWithImpl<_$_Market>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MarketToJson(
      this,
    );
  }
}

abstract class _Market implements Market {
  const factory _Market(
      {@JsonKey(name: 'display_name') required final String displayName,
      required final String market,
      required final String symbol}) = _$_Market;

  factory _Market.fromJson(Map<String, dynamic> json) = _$_Market.fromJson;

  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'display_name')
  String get displayName;
  @override
  String get market;
  @override
  String get symbol;
  @override
  @JsonKey(ignore: true)
  _$$_MarketCopyWith<_$_Market> get copyWith =>
      throw _privateConstructorUsedError;
}
