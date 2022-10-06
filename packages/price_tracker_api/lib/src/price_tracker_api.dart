import 'package:deriv_api/deriv_api.dart';

abstract class PriceTrackerApi {
  Stream<List<Market>> getMarketSymbol();

  void cancelMarketSubscription();

  void cancelPriceSubscription();

  Stream<Price> getPrice({required String marketSymbol});
}
