import 'package:web_socket_channel/web_socket_channel.dart';

const String appId = '33022';
WebSocketChannel get webSocketChannel => WebSocketChannel.connect(
      Uri.parse('wss://ws.binaryws.com/websockets/v3?app_id=$appId'),
    );
