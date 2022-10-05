import 'package:deriv_api/deriv_api.dart';

class ServiceLocator {
  DerivApiClient? _derivApiClient;

  DerivApiClient get derivApiClient {
    return _derivApiClient ?? DerivApiClient();
  }
}
