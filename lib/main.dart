import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:price_tracker/apI_service.dart';
import 'package:price_tracker/app.dart';
import 'package:price_tracker/service_locator.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:deriv_api/deriv_api.dart';

void main() {
  // final api = DerivApiClient(socketChannel: webSocketChannel);
  // // api.getMarketSymbol();

  // api.getPrice(marketSymbol: 'frxAUDCAD');

  final service = ServiceLocator();

  runApp(PriceTrackerApp(
    repostory: service.repository,
  ));
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController();
  // final _channel = WebSocketChannel.connect(
  //   Uri.parse('wss://echo.websocket.events'),
  // );
  late WebSocketChannel _channel;
  @override
  void initState() {
    super.initState();
    _channel = serviceApi;

    _channel.stream.listen((event) {
      debugPrint('response $event');
    }, onError: (err) {
      debugPrint(err);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Form(
              child: TextFormField(
                controller: _controller,
                decoration: const InputDecoration(labelText: 'Send a message'),
              ),
            ),
            const SizedBox(height: 24),
            const Text('derive'),
            // StreamBuilder(
            //   stream: _channel.stream,
            //   builder: (context, snapshot) {
            //     return Text(snapshot.hasData ? '${snapshot.data}' : '');
            //   },
            // )
            TextButton(
                onPressed: _cancelSubscription,
                child: const Text('Cancel Subscrition'))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: subscribeToPrice,
        tooltip: 'Send message',
        child: const Icon(Icons.send),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _cancelSubscription() {
    debugPrint('unsubscrib');
    _channel.sink.add(jsonEncode({"forget_all": "ticks"}));
  }

  void _sendMessage() {
    // if (_controller.text.isNotEmpty) {
    //   _channel.sink.add(_controller.text);
    // }
    debugPrint('Sending');
    _channel.sink
        .add(jsonEncode({"active_symbols": "brief", "product_type": "basic"}));
  }

  void subscribeToPrice() {
    debugPrint('subscribing');
    _channel.sink.add(jsonEncode({"ticks": "frxAUDCAD", "subscribe": 1}));
  }

  @override
  void dispose() {
    _channel.sink.close();
    _controller.dispose();
    super.dispose();
  }
}
