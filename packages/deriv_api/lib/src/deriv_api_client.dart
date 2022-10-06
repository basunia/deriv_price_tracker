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
  DerivApiClient({required WebSocketChannel socketChannel})
      : _socketChannel = socketChannel {
    _broadCastStream = _socketChannel.stream.asBroadcastStream();
  }

  final WebSocketChannel _socketChannel;
  Stream? _broadCastStream;
  StreamSubscription? _marketSubscription;
  StreamSubscription? _priceSubscription;

  @override
  void cancelMarketSubscription() {
    _socketChannel.sink.add(jsonEncode({"forget_all": "ticks"}));
    _marketSubscription?.cancel();
  }

  @override
  void cancelPriceSubscription() {
    _socketChannel.sink.add(jsonEncode({"forget_all": "ticks"}));
    _priceSubscription?.cancel();
  }

  @override
  Stream<List<Market>> getMarketSymbol() {
    debugPrint('onGetMarketSymbol');
    final marketStreamController = StreamController<List<Market>>();
    try {
      _socketChannel.sink.add(
          jsonEncode({"active_symbols": "brief", "product_type": "basic"}));

      _marketSubscription = _broadCastStream?.listen((event) {
        List<Market> marketList = jsonDecode(event)['active_symbols']
            .map<Market>((e) => Market.fromJson(e))
            .toList();

        marketStreamController.add(marketList);

        debugPrint(
            'size===================> ${marketList.length}, ${marketList.first.displayName}');
      }, onError: (err) {
        print('On market error ${err.toString()}');
      });

      return marketStreamController.stream;
    } catch (e) {
      debugPrint(e.toString());
      // rethrow;
      return marketStreamController.stream;
    }
  }

  @override
  Stream<Price> getPrice({required String marketSymbol}) {
    debugPrint('ongetPrice');
    try {
      final priceStreamController = StreamController<Price>();
      _socketChannel.sink
          .add(jsonEncode({"ticks": marketSymbol, "subscribe": 1}));

      _priceSubscription = _broadCastStream?.listen((event) {
        Price price = Price.fromJson(jsonDecode(event)['tick']);

        priceStreamController.add(price);

        debugPrint('price===================> $price, ${price.symbol}');
      }, onError: (err) {
        print('On price error ${err.toString()}');
      });
      return priceStreamController.stream;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
