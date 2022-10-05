// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'price.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Price _$PriceFromJson(Map<String, dynamic> json) {
  return _Price.fromJson(json);
}

/// @nodoc
mixin _$Price {
  double get ask => throw _privateConstructorUsedError;
  double get bid => throw _privateConstructorUsedError;
  double get epoch => throw _privateConstructorUsedError;
  double get quote => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get symbol => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PriceCopyWith<Price> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceCopyWith<$Res> {
  factory $PriceCopyWith(Price value, $Res Function(Price) then) =
      _$PriceCopyWithImpl<$Res>;
  $Res call(
      {double ask,
      double bid,
      double epoch,
      double quote,
      String id,
      String symbol});
}

/// @nodoc
class _$PriceCopyWithImpl<$Res> implements $PriceCopyWith<$Res> {
  _$PriceCopyWithImpl(this._value, this._then);

  final Price _value;
  // ignore: unused_field
  final $Res Function(Price) _then;

  @override
  $Res call({
    Object? ask = freezed,
    Object? bid = freezed,
    Object? epoch = freezed,
    Object? quote = freezed,
    Object? id = freezed,
    Object? symbol = freezed,
  }) {
    return _then(_value.copyWith(
      ask: ask == freezed
          ? _value.ask
          : ask // ignore: cast_nullable_to_non_nullable
              as double,
      bid: bid == freezed
          ? _value.bid
          : bid // ignore: cast_nullable_to_non_nullable
              as double,
      epoch: epoch == freezed
          ? _value.epoch
          : epoch // ignore: cast_nullable_to_non_nullable
              as double,
      quote: quote == freezed
          ? _value.quote
          : quote // ignore: cast_nullable_to_non_nullable
              as double,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: symbol == freezed
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_PriceCopyWith<$Res> implements $PriceCopyWith<$Res> {
  factory _$$_PriceCopyWith(_$_Price value, $Res Function(_$_Price) then) =
      __$$_PriceCopyWithImpl<$Res>;
  @override
  $Res call(
      {double ask,
      double bid,
      double epoch,
      double quote,
      String id,
      String symbol});
}

/// @nodoc
class __$$_PriceCopyWithImpl<$Res> extends _$PriceCopyWithImpl<$Res>
    implements _$$_PriceCopyWith<$Res> {
  __$$_PriceCopyWithImpl(_$_Price _value, $Res Function(_$_Price) _then)
      : super(_value, (v) => _then(v as _$_Price));

  @override
  _$_Price get _value => super._value as _$_Price;

  @override
  $Res call({
    Object? ask = freezed,
    Object? bid = freezed,
    Object? epoch = freezed,
    Object? quote = freezed,
    Object? id = freezed,
    Object? symbol = freezed,
  }) {
    return _then(_$_Price(
      ask: ask == freezed
          ? _value.ask
          : ask // ignore: cast_nullable_to_non_nullable
              as double,
      bid: bid == freezed
          ? _value.bid
          : bid // ignore: cast_nullable_to_non_nullable
              as double,
      epoch: epoch == freezed
          ? _value.epoch
          : epoch // ignore: cast_nullable_to_non_nullable
              as double,
      quote: quote == freezed
          ? _value.quote
          : quote // ignore: cast_nullable_to_non_nullable
              as double,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
class _$_Price implements _Price {
  const _$_Price(
      {required this.ask,
      required this.bid,
      required this.epoch,
      required this.quote,
      required this.id,
      required this.symbol});

  factory _$_Price.fromJson(Map<String, dynamic> json) =>
      _$$_PriceFromJson(json);

  @override
  final double ask;
  @override
  final double bid;
  @override
  final double epoch;
  @override
  final double quote;
  @override
  final String id;
  @override
  final String symbol;

  @override
  String toString() {
    return 'Price(ask: $ask, bid: $bid, epoch: $epoch, quote: $quote, id: $id, symbol: $symbol)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Price &&
            const DeepCollectionEquality().equals(other.ask, ask) &&
            const DeepCollectionEquality().equals(other.bid, bid) &&
            const DeepCollectionEquality().equals(other.epoch, epoch) &&
            const DeepCollectionEquality().equals(other.quote, quote) &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.symbol, symbol));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(ask),
      const DeepCollectionEquality().hash(bid),
      const DeepCollectionEquality().hash(epoch),
      const DeepCollectionEquality().hash(quote),
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(symbol));

  @JsonKey(ignore: true)
  @override
  _$$_PriceCopyWith<_$_Price> get copyWith =>
      __$$_PriceCopyWithImpl<_$_Price>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PriceToJson(
      this,
    );
  }
}

abstract class _Price implements Price {
  const factory _Price(
      {required final double ask,
      required final double bid,
      required final double epoch,
      required final double quote,
      required final String id,
      required final String symbol}) = _$_Price;

  factory _Price.fromJson(Map<String, dynamic> json) = _$_Price.fromJson;

  @override
  double get ask;
  @override
  double get bid;
  @override
  double get epoch;
  @override
  double get quote;
  @override
  String get id;
  @override
  String get symbol;
  @override
  @JsonKey(ignore: true)
  _$$_PriceCopyWith<_$_Price> get copyWith =>
      throw _privateConstructorUsedError;
}
