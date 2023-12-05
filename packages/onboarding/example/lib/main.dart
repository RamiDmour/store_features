import 'package:flutter/material.dart';
import 'package:onboarding/onboarding_module.dart';
import 'package:store_core/store_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDI(
    modules: [
      OnboardingModule(screenType: OnboardingScreenType.webview),
    ],
    routerBuilder: (routes) => GoRouter(
      routes: routes,
      initialLocation: '/onboarding',
    ),
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
