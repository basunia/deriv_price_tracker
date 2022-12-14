part of 'price_bloc.dart';

enum PriceStatus {
  initial,
  loading,
  success,
  failure,
  failureOnPagination,
  noConnection
}

enum FetchType { priceFetch, marketFetch }

extension FetchTypeX on FetchType {
  bool get isPriceFetch => this == FetchType.priceFetch;
  bool get isMarketFetch => this == FetchType.marketFetch;
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
      {this.priceStatus = PriceStatus.initial,
      this.fetchType = FetchType.marketFetch,
      this.markets = const [],
      this.price});

  final PriceStatus priceStatus;
  final FetchType fetchType;
  final List<Market> markets;
  final Price? price;

  PriceState copyWith({
    PriceStatus? status,
    FetchType? fetchType,
    List<Market>? markets,
    Price? price,
  }) {
    return PriceState(
        priceStatus: status ?? priceStatus,
        fetchType: fetchType ?? this.fetchType,
        markets: markets ?? this.markets,
        price: price ?? this.price);
  }

  @override
  List<Object?> get props => [priceStatus, markets, price];
}
