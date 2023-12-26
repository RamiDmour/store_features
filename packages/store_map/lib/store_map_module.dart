library store_map;

import 'package:flutter/material.dart';
import 'package:store_core/store_core.dart';
import 'package:store_map/features/comments/data/remote_datasource/store_comments_remote_datasource.dart';
import 'package:store_map/features/comments/domain/repository/store_comments_repository.dart';
import 'package:store_map/features/comments/domain/use_cases/add_comment_use_case.dart';
import 'package:store_map/features/comments/domain/use_cases/get_comments_use_case.dart';
import 'package:store_map/features/map/data/remote_datasource/store_map_remote_datasource.dart';
import 'package:store_map/features/map/domain/repository/store_map_repository.dart';
import 'package:store_map/features/map/domain/use_cases/get_map_stores_use_case.dart';
import 'package:store_map/features/map/domain/use_cases/toggle_notification_use_case.dart';
import 'package:store_map/features/map/presentation/screens/store_map_detailed_screen.dart';
import 'package:store_map/features/map/presentation/screens/store_map_screen.dart';
import 'package:store_map/features/map/presentation/widgets/store_map_background_text.dart';

import 'package:store_map/store_map_routes.dart';

class StoreMapModule extends StoreModule {
  final String inactiveOpenedImage;
  final String activeOpenedImage;
  final String activeClosedImage;
  final String inactiveClosedImage;
  final Color primaryColor;
  final Color secondaryColor;
  final StoreMapBackgroundTextStyle backgroundTextStyle;

  StoreMapModule({
    required this.primaryColor,
    required this.inactiveOpenedImage,
    required this.inactiveClosedImage,
    required this.activeOpenedImage,
    required this.activeClosedImage,
    required this.secondaryColor,
    required this.backgroundTextStyle,
  }) {
    storeDI.registerLazySingleton<StoreMapRemoteDatasource>(
      () => StoreMapRemoteDatasourceImpl(
        apiClient: storeDI.get<StoreCore>().apiClient,
      ),
    );
    storeDI.registerLazySingleton<StoreCommentsRemoteDatasource>(
      () => StoreCommentsRemoteDatasourceImpl(
        apiClient: storeDI.get<StoreCore>().apiClient,
      ),
    );

    storeDI.registerLazySingleton<StoreMapRepository>(
      () => StoreMapRepositoryImpl(
        remoteDatasource: storeDI(),
      ),
    );

    storeDI.registerLazySingleton<StoreCommentsRepository>(
      () => StoreCommentsRepositoryImpl(
        remoteDatasource: storeDI(),
      ),
    );

    storeDI.registerLazySingleton<GetMapStoresUseCase>(
      () => GetMapStoresUseCase(
        repository: storeDI(),
      ),
    );

    storeDI.registerLazySingleton<GetCommentsUseCase>(
      () => GetCommentsUseCase(
        storeDI(),
      ),
    );

    storeDI.registerLazySingleton<ToggleNotificationUseCase>(
      () => ToggleNotificationUseCase(
        storeDI(),
      ),
    );

    storeDI.registerLazySingleton<AddCommentUseCase>(
      () => AddCommentUseCase(
        storeDI(),
      ),
    );
  }

  @override
  List<CollectionSchema> getIsarCollections() => [];

  @override
  List<GoRoute> getRoutes() => [
        GoRoute(
          path: StoreMapRoutes.storeMap,
          builder: (context, state) => StoreMapScreen(
            primaryColor: primaryColor,
            inactiveOpenedImage: inactiveOpenedImage,
            inactiveClosedImage: inactiveClosedImage,
            activeOpenedImage: activeOpenedImage,
            activeClosedImage: activeClosedImage,
            backgroundTextStyle: backgroundTextStyle,
            secondaryColor: secondaryColor,
          ),
        ),
        GoRoute(
          path: StoreMapRoutes.storeMapDetailed,
          builder: (context, state) => StoreMapDetailedScreen(
            primaryColor: primaryColor,
            secondaryColor: secondaryColor,
            backgroundTextStyle: backgroundTextStyle,
          ),
        )
      ];
}
