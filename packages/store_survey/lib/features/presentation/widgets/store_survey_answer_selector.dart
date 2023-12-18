import 'package:flutter/material.dart';
import 'package:store_core/store_core.dart';
import 'package:store_survey/features/data/models/store_survey_answer_model.dart';
import 'package:store_survey/features/data/models/store_survey_question_model.dart';
import 'package:store_survey/features/presentation/widgets/store_survey_answer_item.dart';
import 'package:store_survey/features/presentation/widgets/store_survey_image_answer_item.dart';

class StoreSurveyAnswerSelector extends StatefulWidget {
  final List<StoreSurveyAnswerModel> answers;
  final StoreSurveyAnswersType type;
  final Function(List<StoreSurveyAnswerModel> selectedAnswers) onAnswerSelect;

  const StoreSurveyAnswerSelector({
    super.key,
    required this.answers,
    required this.type,
    required this.onAnswerSelect,
  });

  @override
  State<StoreSurveyAnswerSelector> createState() =>
      _StoreSurveyAnswerSelectorState();
}

class _StoreSurveyAnswerSelectorState extends State<StoreSurveyAnswerSelector> {
  final List<StoreSurveyAnswerModel> selectedAnswers = [];

  @override
  void didUpdateWidget(covariant StoreSurveyAnswerSelector oldWidget) {
    if (oldWidget.answers != widget.answers) {
      setState(() => selectedAnswers.clear());
    }
    super.didUpdateWidget(oldWidget);
  }

  void _onAnswerSelect(StoreSurveyAnswerModel answer) {
    setState(() {
      switch (widget.type) {
        case StoreSurveyAnswersType.multiple:
          if (selectedAnswers.contains(answer)) {
            selectedAnswers.remove(answer);
          } else {
            selectedAnswers.add(answer);
          }
          break;
        case StoreSurveyAnswersType.single:
          if (selectedAnswers.isEmpty) {
            selectedAnswers.add(answer);
          } else {
            selectedAnswers[0] = answer;
          }
      }
      widget.onAnswerSelect(selectedAnswers);
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.answers.first) {
      case StoreSurveyTextAnswerModel():
        return ListView.builder(
          itemBuilder: (_, i) => Padding(
            padding: EdgeInsets.only(bottom: 8.h),
            child: StoreSurveyTextAnswerItem(
              answer: widget.answers[i],
              isActive: selectedAnswers.contains(widget.answers[i]),
              type: widget.type,
              onAnswerSelect: _onAnswerSelect,
              groupValue:
                  selectedAnswers.isNotEmpty ? selectedAnswers[0] : null,
            ),
          ),
          itemCount: widget.answers.length,
        );
      case StoreSurveyImageAnswerModel():
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12.w,
            crossAxisSpacing: 12.h,
          ),
          itemBuilder: (_, i) => InkWell(
            onTap: () => _onAnswerSelect(widget.answers[i]),
            child: StoreSurveyImageAnswerItem(
              imageUrl:
                  (widget.answers[i] as StoreSurveyImageAnswerModel).imageUrl,
              isActive: selectedAnswers.contains(widget.answers[i]),
            ),
          ),
          itemCount: widget.answers.length,
        );
    }
  }
}
