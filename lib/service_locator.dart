import 'package:deriv_api/deriv_api.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:price_tracker_repository/price_tracker_repository.dart';
import 'package:price_tracker_api/price_tracker_api.dart';

class ServiceLocator {
  DerivApiClient? _derivApiClient;

  PriceTrackerRepostory? _repostory;

  PriceTrackerRepostory get repository {
    return _repostory ?? PriceTrackerRepostory(priceTrackerApi: derivApiClient);
  }

  PriceTrackerApi get derivApiClient {
    final appId = dotenv.env['DERIV_APP_ID'];
    return _derivApiClient ??
        DerivApiClient(socketChannel: getSocketChannel(appId!));
  }
}
