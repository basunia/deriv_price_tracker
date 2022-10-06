import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:deriv_api/deriv_api.dart';
import 'package:price_tracker_repository/price_tracker_repository.dart';
import 'package:price_tracker/bloc/price_event.dart';

import '../widget.dart/internet_checker.dart';

part 'price_state.dart';

class PriceBloc extends Bloc<PriceEvent, PriceState> {
  PriceBloc({required PriceTrackerRepostory repostory})
      : _repository = repostory,
        super(const PriceState()) {
    on<MarketFetched>(onMarketFetched);
    on<PriceFetched>(onPriceSubscritionRequested);
  }

  final PriceTrackerRepostory _repository;

  void onMarketFetched(MarketFetched event, Emitter<PriceState> emit) async {
    emit(state.copyWith(
        status: PriceStatus.loading, fetchType: FetchType.marketFetch));
    try {
      if (!(await isInternetAvailable)) {
        emit(state.copyWith(
            status: PriceStatus.noConnection,
            fetchType: FetchType.marketFetch));
      }
      await emit.forEach(_repository.getMarketSymbol(),
          onData: (List<Market> markets) {
        _repository.cancelMarketSubscription();
        return state.copyWith(
            status: PriceStatus.success,
            markets: markets,
            fetchType: FetchType.marketFetch);
      }, onError: (ob, st) {
        _repository.cancelMarketSubscription();
        return state.copyWith(
            status: PriceStatus.failure, fetchType: FetchType.marketFetch);
      });
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  void onPriceSubscritionRequested(
      PriceFetched event, Emitter<PriceState> emit) async {
    // cancel previous subscription if any
    _repository.cancelPriceSubscription();

    emit(state.copyWith(
        status: PriceStatus.loading, fetchType: FetchType.priceFetch));
    try {
      if (!(await isInternetAvailable)) {
        emit(state.copyWith(
            status: PriceStatus.noConnection,
            fetchType: FetchType.marketFetch));
      }
      await emit.forEach(_repository.getPrice(marketSymbol: event.marketSymbol),
          onData: (Price price) => state.copyWith(
              status: PriceStatus.success,
              price: price,
              fetchType: FetchType.priceFetch),
          onError: (ob, st) => state.copyWith(
              status: PriceStatus.failure, fetchType: FetchType.priceFetch));
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }
}
