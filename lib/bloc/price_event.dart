import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

@immutable
abstract class PriceEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class MarketFetched extends PriceEvent {}

class PriceFetched extends PriceEvent {
  final String marketSymbol;

  PriceFetched(this.marketSymbol);
}
