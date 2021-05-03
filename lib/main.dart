import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:band_names/providers/socket_provider.dart';
import 'package:band_names/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => SocketService(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: '/home',
        routes: getApplicationRoutes(),
      ),
    );
  }
}
