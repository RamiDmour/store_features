import 'package:flutter/material.dart';
import 'package:store_survey/store_survey_module.dart';
import 'package:store_core/store_core.dart';
import 'package:store_survey/store_survey_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await runStoreApp(
    routerBuilder: (routes) => GoRouter(
      routes: routes,
      initialLocation: StoreSurveyRoutes.survey,
    ),
    app: const MainApp(),
    modules: [
      StoreSurveyModule(),
    ],
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = storeDI.get<StoreCore>().router;

    return MaterialApp.router(
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}
