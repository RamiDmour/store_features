library shop_window;

import 'package:flutter/material.dart';
import 'package:store_core/store_core.dart';
import 'package:store_window/features/store_story/data/remote_datasource/store_story_remote_datasource.dart';
import 'package:store_window/features/store_story/domain/repository/store_story_repository.dart';
import 'package:store_window/features/store_story/domain/use_cases/get_store_stories_use_case.dart';
import 'package:store_window/features/store_window/presentation/screens/main_screen.dart';
import 'package:store_window/features/store_window/presentation/screens/personal_account_screen.dart';
import 'package:store_window/features/store_window/presentation/screens/second_main_screen.dart';
import 'package:store_window/features/store_window/presentation/screens/store_window_screen.dart';
import 'package:store_window/store_window_routes.dart';

class StoreWindowModule extends StoreModule {
  StoreWindowModule() {
    storeDI.registerLazySingleton<StoreStoryRemoteDatasource>(
        () => StoreStoryRemoteDatasourceImpl());
    storeDI.registerLazySingleton<StoreStoryRepository>(
        () => StoreStoryRepositoryImpl(remoteDatasource: storeDI()));
    storeDI.registerLazySingleton<GetStoreStoriesUseCase>(
        () => GetStoreStoriesUseCase(repository: storeDI()));
  }
  @override
  List<CollectionSchema> getIsarCollections() => [];

  @override
  List<StatefulShellBranch> getShellBranches() => [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: StoreWindowRoutes.shopWindow,
              builder: (context, state) => const StoreWindowScreen(),
            ),
          ],
        ),
      ];

  @override
  List<RouteBase> getRoutes() => [];
}

class MainModule extends StoreModule {
  @override
  List<CollectionSchema> getIsarCollections() => [];

  @override
  List<RouteBase> getRoutes() => [];

  @override
  List<StatefulShellBranch> getShellBranches() => [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: StoreWindowRoutes.main,
              pageBuilder: (context, state) => const MaterialPage(
                child: MainScreen(),
              ),
            ),
            GoRoute(
              path: StoreWindowRoutes.secondMain,
              pageBuilder: (context, state) => const MaterialPage(
                child: SecondMainScreen(),
              ),
            ),
          ],
        ),
      ];
}

class PersonalAccountModule extends StoreModule {
  @override
  List<CollectionSchema> getIsarCollections() => [];

  @override
  List<StatefulShellBranch> getShellBranches() => [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: StoreWindowRoutes.personalAccount,
              builder: (context, state) => const PersonalAccountScreen(),
            ),
          ],
        )
      ];

  @override
  List<RouteBase> getRoutes() => [];
}
