library onboarding;

import 'package:onboarding/features/onboarding/presentation/screens/onboarding_tab_screen.dart';
import 'package:onboarding/features/onboarding/presentation/screens/onboarding_webview_screen.dart';
import 'package:store_core/store_core.dart';

enum OnboardingScreenType {
  tab,
  webview,
}

class OnboardingModule extends StoreModule {
  final OnboardingScreenType screenType;

  OnboardingModule({required this.screenType});
  @override
  List<CollectionSchema> getIsarCollections() => [];

  @override
  List<GoRoute> getRoutes() => [
        GoRoute(
          path: '/onboarding',
          builder: (context, state) => screenType == OnboardingScreenType.tab
              ? const OnbardingTabScreen()
              : const OnboardingWebviewScreen(),
        )
      ];
}
