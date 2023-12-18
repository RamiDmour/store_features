import 'package:store_core/store_core.dart';
import 'package:store_survey/features/data/models/store_survey_answer_model.dart';
import 'package:store_survey/features/data/models/store_survey_model.dart';
import 'package:store_survey/features/data/models/store_survey_question_model.dart';

abstract class StoreSurveyRemoteDatasource {
  Future<ApiResult<StoreSurveyModel>> getSurvey(String id);

  Future<void> finishSurvey(List<List<String>> answers);
}

const _mockSurvey = StoreSurveyModel(
  id: "1",
  questions: [
    StoreSurveyQuestionModel(
      id: '1',
      name: 'Question 1',
      text: 'Question 1 Detailed',
      type: StoreSurveyAnswersType.multiple,
      answers: [
        StoreSurveyTextAnswerModel(id: '1', text: "Answer 1"),
        StoreSurveyTextAnswerModel(id: '2', text: "Answer 2"),
        StoreSurveyTextAnswerModel(id: '3', text: "Answer 3"),
        StoreSurveyTextAnswerModel(id: '4', text: "Answer 4"),
        StoreSurveyTextAnswerModel(id: '5', text: "Answer 5"),
      ],
      imageUrl:
          "https://img.freepik.com/free-photo/painting-mountain-lake-with-mountain-background_188544-9126.jpg",
    ),
    StoreSurveyQuestionModel(
      id: '2',
      name: 'Question 2',
      text: 'Question 2 Detailed',
      imageUrl: null,
      type: StoreSurveyAnswersType.multiple,
      answers: [
        StoreSurveyImageAnswerModel(
          id: '4',
          imageUrl:
              "https://img.freepik.com/free-photo/painting-mountain-lake-with-mountain-background_188544-9126.jpg",
        ),
        StoreSurveyImageAnswerModel(
          id: '5',
          imageUrl:
              "https://img.freepik.com/free-photo/painting-mountain-lake-with-mountain-background_188544-9126.jpg",
        ),
        StoreSurveyImageAnswerModel(
          id: '6',
          imageUrl:
              "https://img.freepik.com/free-photo/painting-mountain-lake-with-mountain-background_188544-9126.jpg",
        ),
        StoreSurveyImageAnswerModel(
          id: '7',
          imageUrl:
              "https://img.freepik.com/free-photo/painting-mountain-lake-with-mountain-background_188544-9126.jpg",
        ),
      ],
    ),
    StoreSurveyQuestionModel(
      id: '3',
      name: 'Question 3',
      text: 'Question 3 Detailed',
      imageUrl: null,
      type: StoreSurveyAnswersType.single,
      answers: [
        StoreSurveyImageAnswerModel(
          id: '5',
          imageUrl:
              "https://img.freepik.com/free-photo/painting-mountain-lake-with-mountain-background_188544-9126.jpg",
        ),
        StoreSurveyImageAnswerModel(
          id: '6',
          imageUrl:
              "https://img.freepik.com/free-photo/painting-mountain-lake-with-mountain-background_188544-9126.jpg",
        ),
        StoreSurveyImageAnswerModel(
          id: '7',
          imageUrl:
              "https://img.freepik.com/free-photo/painting-mountain-lake-with-mountain-background_188544-9126.jpg",
        ),
        StoreSurveyImageAnswerModel(
          id: '8',
          imageUrl:
              "https://img.freepik.com/free-photo/painting-mountain-lake-with-mountain-background_188544-9126.jpg",
        ),
      ],
    ),
    StoreSurveyQuestionModel(
      id: '4',
      name: 'Question 4',
      text: 'Question 4 Detailed',
      type: StoreSurveyAnswersType.single,
      answers: [
        StoreSurveyTextAnswerModel(id: '1', text: "Answer 1"),
        StoreSurveyTextAnswerModel(id: '2', text: "Answer 2"),
        StoreSurveyTextAnswerModel(id: '3', text: "Answer 3"),
        StoreSurveyTextAnswerModel(id: '4', text: "Answer 4"),
        StoreSurveyTextAnswerModel(id: '5', text: "Answer 5"),
      ],
    ),
  ],
);

class StoreSurveyRemoteDatasourceImpl extends StoreSurveyRemoteDatasource {
  final ApiClient _apiClient;

  StoreSurveyRemoteDatasourceImpl({required ApiClient apiClient})
      : _apiClient = apiClient;

  @override
  Future<ApiResult<StoreSurveyModel>> getSurvey(String id) async {
    await Future.delayed(const Duration(seconds: 2));

    return ApiResult.success(
      data: _mockSurvey,
    );
  }

  @override
  Future<void> finishSurvey(List<List<String>> answers) async {}
}
