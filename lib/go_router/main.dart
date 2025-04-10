import 'package:flutter/material.dart';
import 'package:flutter_practical/go_router/router_config.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // routeInformationParser: MyAppRouter().router.routeInformationParser,
      // routerDelegate: MyAppRouter().router.routerDelegate,
      // routeInformationProvider: MyAppRouter().router.routeInformationProvider,
      routerConfig: MyAppRouter().router,
    );
  }
}
