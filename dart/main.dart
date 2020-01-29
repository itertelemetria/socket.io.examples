import 'dart:io';
import 'package:socket_io_client/socket_io_client.dart' as IO;

void main() async {
  Map<String, String> envVars = Platform.environment;
  String endpoint = "https://${envVars['URL']}:${envVars['PORT']}";

  IO.Socket socket = IO.io(endpoint, <String, dynamic>{
    'transports': ['websocket'],
  });

  socket.on('connect', (_) {
    print('connect');
    socket.emit('psubscribe', envVars['REALTIME_CHANNEL']);
  });

  socket.on('event', (data) => print(data));
  
  socket.on('disconnect', (_) => print('disconnect'));
}
