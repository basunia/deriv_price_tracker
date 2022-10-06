import 'package:flutter_test/flutter_test.dart';

import 'package:deriv_api/deriv_api.dart';

void main() {
  group('Price', () {
    group('fromJson', () {
      test('returns correct Price object', () {
        expect(
          Price.fromJson(
            <String, dynamic>{
              'ask': 40.1,
              'bid': 40.2,
              'epoch': 40.3,
              'qoute': 40.5,
              'id': 'id',
              'symbol': 'symbol',
            },
          ),
          isA<Price>()
              .having((w) => w.ask, 'ask', 40.1)
              .having((w) => w.bid, 'bid', 40.2)
              .having((w) => w.epoch, 'epoch', 40.3)
              .having((w) => w.quote, 'quote', 40.5)
              .having((w) => w.id, 'id', 'id')
              .having((w) => w.symbol, 'symbol', 'symbolar'),
        );
      });
    });
  });
}
