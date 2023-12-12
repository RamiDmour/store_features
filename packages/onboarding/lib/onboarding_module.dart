library onboarding;

import 'package:flutter/material.dart';
import 'package:onboarding/features/onboarding/data/local_datasource/models/test.dart';
import 'package:onboarding/features/onboarding/presentation/screens/onboarding_tab_screen.dart';
import 'package:onboarding/features/onboarding/presentation/screens/onboarding_webview_screen.dart';
import 'package:onboarding/onboarding_routes.dart';
import 'package:store_core/store_core.dart';

export 'package:onboarding/features/onboarding/domain/use_cases/get_tests_use_case.dart';

enum OnboardingScreenType {
  tab,
  webview,
}

class OnboardingModule extends StoreModule {
  final OnboardingScreenType screenType;

  OnboardingModule({required this.screenType});
  @override
  List<CollectionSchema> getIsarCollections() => [TestSchema];

  @override
  List<StatefulShellBranch> getShellBranches() => [];

  @override
  List<GoRoute> getRoutes() => [
        GoRoute(
          path: OnboardingRoutes.onboarding,
          pageBuilder: (_, __) => MaterialPage(
            child: screenType == OnboardingScreenType.tab
                ? const OnbardingTabScreen()
                : const OnboardingWebviewScreen(),
          ),
        )
      ];
}
