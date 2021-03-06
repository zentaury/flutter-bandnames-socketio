import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:band_names/providers/socket_provider.dart';

class StatusPage extends StatelessWidget {
  static final pageRoute = '/status';
  @override
  Widget build(BuildContext context) {
    final socketService = Provider.of<SocketService>(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('ServerStatus: ${socketService.serverStatus}'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.message),
        onPressed: () {
          socketService.emit('emitir-mensaje',
              {'nombre': 'Flutter', 'mensaje': 'Hola desde flutter'});
        },
      ),
    );
  }
}
