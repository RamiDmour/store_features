import 'package:flutter/material.dart';
import 'package:store_core/store_core.dart';
import 'package:store_survey/features/data/models/store_survey_model.dart';
import 'package:store_survey/features/presentation/bloc/store_survey_cubit.dart';
import 'package:store_survey/features/presentation/bloc/store_survey_state.dart';
import 'package:store_survey/features/presentation/widgets/primary_button.dart';
import 'package:store_survey/features/presentation/widgets/store_survey_answer_selector.dart';
import 'package:store_survey/features/presentation/widgets/store_survey_progress_bar.dart';

class StoreSurveyScreen extends StatelessWidget {
  const StoreSurveyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => StoreSurveyCubit(
        getSurveyUseCase: storeDI(),
        finishSurveryUseCase: storeDI(),
      )..fetchSurvey("3123"),
      child: BlocBuilder<StoreSurveyCubit, StoreSurveyState>(
        builder: (context, state) => StoreSurveyView(
          isLoading: state.isLoading,
          survey: state.survey,
          currentQuestionIndex: state.currentQuestionIndex,
          selectedAnswers: state.selectedAnswers,
        ),
      ),
    );
  }
}

class StoreSurveyView extends StatelessWidget {
  final bool isLoading;
  final StoreSurveyModel? survey;
  final int currentQuestionIndex;
  final List<List<String>> selectedAnswers;
  const StoreSurveyView({
    super.key,
    required this.isLoading,
    this.survey,
    required this.currentQuestionIndex,
    required this.selectedAnswers,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading || survey == null) {
      return const Scaffold(
          body: Center(
        child: CircularProgressIndicator(),
      ));
    }

    final currentQuestionNumber = currentQuestionIndex + 1;
    final totalQuestionCount = survey!.questions.length;
    final currentQuestion = survey!.questions[currentQuestionIndex];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: 15.w,
            right: 15.w,
            top: 30.h,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StoreSurveyProgressBar(
                totalQuestions: totalQuestionCount,
                currentQuestionIndex: currentQuestionNumber,
              ),
              Padding(
                padding: EdgeInsets.only(top: 12.h),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: CircleAvatar(
                      radius: 20.r,
                      backgroundColor: StoreColors.grey[200],
                      child: IconButton(
                        icon: Icon(
                          Icons.close,
                          size: 20.r,
                          color: StoreColors.grey[500],
                        ),
                        onPressed: () => storeDI.get<StoreCore>().router.pop(),
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 4.h, bottom: 8.h),
                child: Text(
                  "$currentQuestionNumber/$totalQuestionCount ${currentQuestion.name}",
                  style: TextStyle(
                    color: StoreColors.grey[900],
                    fontWeight: FontWeight.w800,
                    fontSize: 20.sp,
                  ),
                ),
              ),
              Text(
                currentQuestion.text,
                style: TextStyle(
                  color: StoreColors.grey[900],
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                ),
              ),
              if (currentQuestion.imageUrl != null)
                Padding(
                  padding: EdgeInsets.only(top: 32.h),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: Image.network(
                      currentQuestion.imageUrl!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 180.h,
                    ),
                  ),
                ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 32.h),
                  child: StoreSurveyAnswerSelector(
                    answers: currentQuestion.answers,
                    type: currentQuestion.type,
                    onAnswerSelect: (selectedAnswers) => context
                        .read<StoreSurveyCubit>()
                        .selectAnswers(selectedAnswers),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 54.h,
                child: PrimaryButton(
                  onTap: selectedAnswers[currentQuestionIndex].isNotEmpty
                      ? context.read<StoreSurveyCubit>().nextQuestion
                      : null,
                  child: Text(
                    currentQuestionNumber == survey!.questions.length
                        ? "Завершить опрос"
                        : "Следующий вопрос",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
