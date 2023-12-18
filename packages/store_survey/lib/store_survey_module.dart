library store_survey;

import 'package:store_core/store_core.dart';
import 'package:store_survey/features/data/remote_datasource/store_survey_remote_datasource.dart';
import 'package:store_survey/features/domain/repository/store_survey_repository.dart';
import 'package:store_survey/features/domain/use_cases/finish_survey_use_case.dart';
import 'package:store_survey/features/domain/use_cases/get_survey_use_case.dart';
import 'package:store_survey/features/presentation/screens/store_survey_screen.dart';
import 'package:store_survey/store_survey_routes.dart';

class StoreSurveyModule extends StoreModule {
  StoreSurveyModule() {
    storeDI.registerLazySingleton<StoreSurveyRemoteDatasource>(
      () => StoreSurveyRemoteDatasourceImpl(
        apiClient: storeDI.get<StoreCore>().apiClient,
      ),
    );
    storeDI.registerLazySingleton<StoreSurveyRepository>(
      () => StoreSurveyRepositoryImpl(
        remoteDatasource: storeDI(),
      ),
    );
    storeDI.registerLazySingleton(
      () => GetSurveyUseCase(
        repository: storeDI(),
      ),
    );
    storeDI.registerLazySingleton(
      () => FinishSurveryUseCase(
        repository: storeDI(),
      ),
    );
  }

  @override
  List<CollectionSchema> getIsarCollections() => [];

  @override
  List<RouteBase> getRoutes() => [
        GoRoute(
          path: StoreSurveyRoutes.survey,
          builder: (_, __) => const StoreSurveyScreen(),
        ),
      ];
}
