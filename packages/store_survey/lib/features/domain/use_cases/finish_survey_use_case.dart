import 'package:store_survey/features/domain/repository/store_survey_repository.dart';

class FinishSurveryUseCase {
  final StoreSurveyRepository _repository;

  FinishSurveryUseCase({
    required StoreSurveyRepository repository,
  }) : _repository = repository;
  Future<void> call(List<List<String>> answers) async {
    await _repository.finishSurvey(answers);
  }
}
