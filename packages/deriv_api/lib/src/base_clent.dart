import 'package:web_socket_channel/web_socket_channel.dart';

WebSocketChannel getSocketChannel(String appId) => WebSocketChannel.connect(
      Uri.parse('wss://ws.binaryws.com/websockets/v3?app_id=$appId'),
    );
