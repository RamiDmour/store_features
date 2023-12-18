import 'package:store_survey/features/data/models/store_survey_model.dart';
import 'package:store_survey/features/domain/repository/store_survey_repository.dart';

class GetSurveyUseCase {
  final StoreSurveyRepository _repository;

  GetSurveyUseCase({
    required StoreSurveyRepository repository,
  }) : _repository = repository;

  Future<StoreSurveyModel> call(String id) async {
    return _repository.getSurvey(id);
  }
}
