import 'package:flutter/material.dart';

import 'package:store_core/store_core.dart';
import 'package:store_window/store_window_module.dart';
import 'package:store_window/store_window_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runStoreApp(
    routerBuilder: (List<RouteBase> routes) => GoRouter(
      routes: routes,
      initialLocation: StoreWindowRoutes.main,
    ),
    modules: [
      MainModule(),
      StoreWindowModule(),
      PersonalAccountModule(),
    ],
    app: const MainApp(),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = storeDI.get<StoreCore>().router;

    return MaterialApp.router(
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}
