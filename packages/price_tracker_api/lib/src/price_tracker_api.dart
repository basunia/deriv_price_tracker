import 'package:deriv_api/deriv_api.dart';

abstract class PriceTrackerApi {
  Stream<List<Market>> getMarketSymbol();

  void cancelMarketSubscription();

  Stream<Price> getPrice({required String marketSymbol});
}
