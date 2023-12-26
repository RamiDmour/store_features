import 'package:example/gen/assets.gen.dart';
import 'package:flutter/material.dart';

import 'package:store_core/store_core.dart';
import 'package:store_map/features/map/presentation/widgets/store_map_background_text.dart';
import 'package:store_map/store_map_module.dart';
import 'package:store_map/store_map_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runStoreApp(
    routerBuilder: (routes) => GoRouter(
      routes: routes,
      initialLocation: StoreMapRoutes.storeMap,
    ),
    app: const MainApp(),
    modules: [
      StoreMapModule(
        inactiveOpenedImage: Assets.chesnokOpened.path,
        inactiveClosedImage: Assets.chesnokClosed.path,
        activeOpenedImage: Assets.chesnokOpenedActive.path,
        activeClosedImage: Assets.chesnokClosedActive.path,
        primaryColor: StoreColors.purple[500]!,
        secondaryColor: Colors.white,
        backgroundTextStyle: StoreMapBackgroundTextStyle(
          textStyle: TextStyle(
            color: StoreColors.purple[500]!,
            fontWeight: FontWeight.w800,
            fontSize: 12,
          ),
          backgroundColor: StoreColors.purple[50]!,
        ),
      )
    ],
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
