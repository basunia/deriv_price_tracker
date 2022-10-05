import 'dart:async';
import 'dart:convert';

import 'package:deriv_api/src/base_clent.dart';
import 'package:flutter/widgets.dart';
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

class DerivApiClient {
  DerivApiClient({WebSocketChannel? socketChannel})
      : _socketChannel = socketChannel ?? webSocketChannel;

  final WebSocketChannel _socketChannel;

  Stream<List<Market>> getMarketSymbol() {
    debugPrint('onGetMarketSymbol');
    try {
      final streamController = StreamController<List<Market>>();
      _socketChannel.sink.add(
          jsonEncode({"active_symbols": "brief", "product_type": "basic"}));

      _socketChannel.stream.listen((event) {
        // debugPrint('result ===> ${event}');
        // debugPrint('result ===> ${jsonDecode(event)['active_symbols']}');
        List<Market> marketList = jsonDecode(event)['active_symbols']
            .map<Market>((e) => Market.fromJson(e))
            .toList();

        streamController.add(marketList);

        debugPrint(
            'size===================> ${marketList.length}, ${marketList.first.displayName}');
      });
      return streamController.stream;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
