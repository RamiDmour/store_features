import 'package:flutter/material.dart';
import 'package:store_core/store_core.dart';

class StoreSurveyProgressBar extends StatelessWidget {
  final int currentQuestionIndex;
  final int totalQuestions;
  const StoreSurveyProgressBar({
    super.key,
    required this.currentQuestionIndex,
    required this.totalQuestions,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
        children: List.generate(
      totalQuestions,
      (index) => Expanded(
        child: Container(
          height: 4.h,
          margin: EdgeInsets.only(right: 4.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.r),
            color: index < currentQuestionIndex
                ? StoreColors.grey[900]
                : StoreColors.grey[300],
          ),
        ),
      ),
    ));
  }
}
