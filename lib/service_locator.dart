import 'package:deriv_api/deriv_api.dart';
import 'package:deriv_repository/deriv_repository.dart';

class ServiceLocator {
  DerivApiClient? _derivApiClient;

  PriceTrackerRepostory? _repostory;

  PriceTrackerRepostory get repository {
    return _repostory ?? PriceTrackerRepostory(priceTrackerApi: derivApiClient);
  }

  DerivApiClient get derivApiClient {
    return _derivApiClient ?? DerivApiClient();
  }
}
