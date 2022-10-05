import 'dart:async';
import 'dart:convert';

import 'package:deriv_api/src/base_clent.dart';
import 'package:deriv_api/src/model/price.dart';
import 'package:flutter/widgets.dart';
import 'package:price_tracker_api/price_tracker_api.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'model/market.dart';

/// Exception thrown when domain fetch fails.
class DomainRequestFailure implements Exception {
  @override
  String toString() => '$runtimeType';
}

/// Exception thrown when the provided domain list is not found.
class DomainNotFoundFailure implements Exception {
  @override
  String toString() => '$runtimeType';
}

class DerivApiClient implements PriceTrackerApi {
  DerivApiClient({WebSocketChannel? socketChannel})
      : _socketChannel = socketChannel ?? webSocketChannel;

  final WebSocketChannel _socketChannel;

  @override
  Stream<List<Market>> getMarketSymbol() {
    debugPrint('onGetMarketSymbol');
    try {
      final marketStreamController = StreamController<List<Market>>();
      _socketChannel.sink.add(
          jsonEncode({"active_symbols": "brief", "product_type": "basic"}));

      _socketChannel.stream.listen((event) {
        List<Market> marketList = jsonDecode(event)['active_symbols']
            .map<Market>((e) => Market.fromJson(e))
            .toList();

        marketStreamController.add(marketList);

        debugPrint(
            'size===================> ${marketList.length}, ${marketList.first.displayName}');
      });
      return marketStreamController.stream;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  @override
  Stream<Price> getPrice({required String marketSymbol}) {
    debugPrint('ongetPrice');
    try {
      final priceStreamController = StreamController<Price>();
      _socketChannel.sink
          .add(jsonEncode({"ticks": marketSymbol, "subscribe": 1}));

      _socketChannel.stream.listen((event) {
        Price price = Price.fromJson(jsonDecode(event)['tick']);

        priceStreamController.add(price);

        debugPrint('price===================> $price, ${price.symbol}');

        //TODO: error handling
        // _socketChannel.sink.add(jsonEncode({"forget_all": "ticks"}));
      });
      return priceStreamController.stream;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
