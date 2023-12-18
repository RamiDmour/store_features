import 'package:store_core/store_core.dart';
import 'package:store_survey/features/data/models/store_survey_answer_model.dart';
import 'package:store_survey/features/domain/use_cases/finish_survey_use_case.dart';
import 'package:store_survey/features/domain/use_cases/get_survey_use_case.dart';
import 'package:store_survey/features/presentation/bloc/store_survey_state.dart';

class StoreSurveyCubit extends Cubit<StoreSurveyState> {
  final GetSurveyUseCase _getSurveyUseCase;
  final FinishSurveryUseCase _finishSurveryUseCase;

  StoreSurveyCubit({
    required GetSurveyUseCase getSurveyUseCase,
    required FinishSurveryUseCase finishSurveryUseCase,
  })  : _finishSurveryUseCase = finishSurveryUseCase,
        _getSurveyUseCase = getSurveyUseCase,
        super(StoreSurveyState());

  void fetchSurvey(String id) async {
    emit(state.copyWith(isLoading: true));

    final result = await _getSurveyUseCase(id);
    emit(state.copyWith(
      survey: result,
      selectedAnswers: List.generate(
        result.questions.length,
        (_) => [],
      ),
      isLoading: false,
    ));
  }

  void nextQuestion() {
    if (state.currentQuestionIndex == state.survey!.questions.length - 1) {
      finishSurvey();
    } else {
      emit(
        state.copyWith(currentQuestionIndex: state.currentQuestionIndex + 1),
      );
    }
  }

  void selectAnswers(List<StoreSurveyAnswerModel> selectedAnswers) {
    final selectedAnswersIds =
        selectedAnswers.map((answer) => answer.id).toList();
    state.selectedAnswers[state.currentQuestionIndex] = selectedAnswersIds;
    final stateCopy = state.copyWith();
    emit(stateCopy.copyWith(selectedAnswers: []));
    emit(stateCopy);
  }

  void finishSurvey() async {
    emit(state.copyWith(isLoading: true));
    await _finishSurveryUseCase(state.selectedAnswers);
  }
}
