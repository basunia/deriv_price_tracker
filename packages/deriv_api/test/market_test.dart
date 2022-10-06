import 'package:flutter_test/flutter_test.dart';

import 'package:deriv_api/deriv_api.dart';

void main() {
  group('Market', () {
    group('fromJson', () {
      test('returns correct Market object', () {
        expect(
          Market.fromJson(
            <String, dynamic>{
              'display_name': 'Nasdac',
              'market': 'crypto_currency',
              'symbol': 'symbol',
            },
          ),
          isA<Market>()
              .having((w) => w.displayName, 'display_name', 'Nasdac')
              .having((w) => w.market, 'market', 'crypto_currency')
              .having((w) => w.symbol, 'symbol', 'symbolar'),
        );
      });
    });
  });
}
