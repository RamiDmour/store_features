import 'package:flutter/material.dart';
import 'package:store_core/store_core.dart';
import 'package:store_survey/features/data/models/store_survey_answer_model.dart';
import 'package:store_survey/features/data/models/store_survey_question_model.dart';

class StoreSurveyTextAnswerItem extends StatelessWidget {
  final StoreSurveyAnswerModel answer;
  final bool isActive;
  final StoreSurveyAnswersType type;
  final StoreSurveyAnswerModel? groupValue;
  final Function(StoreSurveyAnswerModel answer) onAnswerSelect;
  const StoreSurveyTextAnswerItem({
    super.key,
    required this.answer,
    required this.isActive,
    required this.type,
    required this.onAnswerSelect,
    this.groupValue,
  });
  Widget _buildAnswerItem() {
    return Row(
      children: [
        if (type == StoreSurveyAnswersType.multiple)
          Transform.scale(
            scale: 1.5,
            child: Checkbox(
              value: isActive,
              checkColor: Colors.white,
              activeColor: StoreColors.purple[500],
              onChanged: (value) => onAnswerSelect(answer),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.r),
                side: BorderSide(
                  color: StoreColors.grey[300]!,
                  width: 1,
                ),
              ),
            ),
          )
        else
          Radio(
            value: answer,
            groupValue: groupValue,
            activeColor: StoreColors.purple[500],
            onChanged: (value) => onAnswerSelect(answer),
          ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 12.w),
            padding: EdgeInsets.symmetric(
              vertical: 15.h,
              horizontal: 16.w,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: StoreColors.grey[100],
            ),
            child: Text((answer as StoreSurveyTextAnswerModel).text,
                style: TextStyle(
                  color: StoreColors.grey[900],
                  fontWeight: FontWeight.w700,
                  fontSize: 16.sp,
                )),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onAnswerSelect(answer),
      child: _buildAnswerItem(),
    );
  }
}
