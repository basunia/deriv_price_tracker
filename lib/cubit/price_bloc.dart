import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:deriv_api/deriv_api.dart';
import 'package:deriv_repository/deriv_repository.dart';
import 'package:price_tracker/cubit/price_event.dart';

part 'price_state.dart';

class PriceCubit extends Bloc<PriceEvent, PriceState> {
  PriceCubit({required PriceTrackerRepostory repostory})
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
      // if (state.priceStatus.isInitial) {
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
      // }
      // _repository.getMarketSymbol();
    } catch (e) {
      print(e.toString());
    }
  }

  void onPriceSubscritionRequested(
      PriceFetched event, Emitter<PriceState> emit) async {
    emit(state.copyWith(
        status: PriceStatus.loading, fetchType: FetchType.priceFetch));
    try {
      // if (state.priceStatus.isInitial) {
      await emit.forEach(_repository.getPrice(marketSymbol: event.marketSymbol),
          onData: (Price price) => state.copyWith(
              status: PriceStatus.success,
              price: price,
              fetchType: FetchType.priceFetch),
          onError: (ob, st) => state.copyWith(
              status: PriceStatus.failure, fetchType: FetchType.priceFetch));
      // }
      // _repository.getMarketSymbol();
    } catch (e) {
      print(e.toString());
    }
  }
}
