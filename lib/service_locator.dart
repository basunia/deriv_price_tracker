import 'package:deriv_api/deriv_api.dart';
import 'package:deriv_repository/deriv_repository.dart';
import 'package:price_tracker_api/price_tracker_api.dart';

class ServiceLocator {
  DerivApiClient? _derivApiClient;

  PriceTrackerRepostory? _repostory;

  PriceTrackerRepostory get repository {
    return _repostory ?? PriceTrackerRepostory(priceTrackerApi: derivApiClient);
  }

  PriceTrackerApi get derivApiClient {
    return _derivApiClient ?? DerivApiClient();
  }
}
