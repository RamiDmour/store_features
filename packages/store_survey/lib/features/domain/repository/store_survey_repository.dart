import 'package:store_survey/features/data/models/store_survey_model.dart';
import 'package:store_survey/features/data/remote_datasource/store_survey_remote_datasource.dart';

abstract class StoreSurveyRepository {
  Future<StoreSurveyModel> getSurvey(String id);

  Future<void> finishSurvey(List<List<String>> answers);
}

class StoreSurveyRepositoryImpl extends StoreSurveyRepository {
  final StoreSurveyRemoteDatasource _remoteDatasource;

  StoreSurveyRepositoryImpl({
    required StoreSurveyRemoteDatasource remoteDatasource,
  }) : _remoteDatasource = remoteDatasource;

  @override
  Future<StoreSurveyModel> getSurvey(String id) async {
    final result = await _remoteDatasource.getSurvey(id);

    if (result.exception != null) {
      throw result.exception!;
    }

    return result.data!;
  }

  @override
  Future<void> finishSurvey(List<List<String>> answers) async {
    await _remoteDatasource.finishSurvey(answers);
  }
}
