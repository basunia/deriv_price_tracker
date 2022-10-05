import 'package:deriv_api/deriv_api.dart';

abstract class PriceTrackerApi {
  Stream<List<Market>> getMarketSymbol();

  Stream<Price> getPrice({required String marketSymbol});
}
