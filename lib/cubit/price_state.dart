part of 'price_cubit.dart';

enum PriceStatus {
  initial,
  loading,
  success,
  failure,
  failureOnPagination,
  noConnection
}

extension PriceStatusX on PriceStatus {
  bool get isInitial => this == PriceStatus.initial;
  bool get isLoading => this == PriceStatus.loading;
  bool get isSuccess => this == PriceStatus.success;
  bool get isFailure => this == PriceStatus.failure;
  bool get isFailureOnPagination => this == PriceStatus.failureOnPagination;
  bool get isNoConnection => this == PriceStatus.noConnection;
}

class PriceState extends Equatable {
  const PriceState(
      {this.priceStatus = PriceStatus.initial, this.market, this.price});

  final PriceStatus priceStatus;
  final Market? market;
  final Price? price;

  @override
  List<Object?> get props => [priceStatus, market, price];
}
