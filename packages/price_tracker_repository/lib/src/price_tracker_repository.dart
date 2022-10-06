import 'package:price_tracker_api/price_tracker_api.dart';
import 'package:deriv_api/deriv_api.dart';

class PriceTrackerRepostory {
  PriceTrackerRepostory({required PriceTrackerApi priceTrackerApi})
      : _priceTrackerApi = priceTrackerApi;

  final PriceTrackerApi _priceTrackerApi;

  Stream<List<Market>> getMarketSymbol() {
    final result = _priceTrackerApi.getMarketSymbol();

    return result;
  }

  void cancelMarketSubscription() =>
      _priceTrackerApi.cancelMarketSubscription();
  void cancelPriceSubscription() => _priceTrackerApi.cancelPriceSubscription();

  Stream<Price> getPrice({required String marketSymbol}) =>
      _priceTrackerApi.getPrice(marketSymbol: marketSymbol);
}
