import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:store_survey/features/data/models/store_survey_model.dart';

class StoreSurveyState {
  final StoreSurveyModel? survey;
  final bool isLoading;
  final int currentQuestionIndex;
  final List<List<String>> selectedAnswers;
  final int? mark;

  StoreSurveyState({
    this.survey,
    this.isLoading = true,
    this.currentQuestionIndex = 0,
    this.selectedAnswers = const [],
    this.mark,
  });

  StoreSurveyState copyWith({
    StoreSurveyModel? survey,
    bool? isLoading,
    int? currentQuestionIndex,
    List<List<String>>? selectedAnswers,
    int? mark,
  }) {
    return StoreSurveyState(
      survey: survey ?? this.survey,
      isLoading: isLoading ?? this.isLoading,
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
      selectedAnswers: selectedAnswers ?? this.selectedAnswers,
      mark: mark ?? this.mark,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'survey': survey?.toMap(),
      'isLoading': isLoading,
      'currentQuestionIndex': currentQuestionIndex,
      'selectedAnswers': selectedAnswers,
      'mark': mark,
    };
  }

  factory StoreSurveyState.fromMap(Map<String, dynamic> map) {
    return StoreSurveyState(
      survey: map['survey'] != null
          ? StoreSurveyModel.fromMap(map['survey'] as Map<String, dynamic>)
          : null,
      isLoading: map['isLoading'] as bool,
      currentQuestionIndex: map['currentQuestionIndex'] as int,
      selectedAnswers: List<List<String>>.from(
        (map['selectedAnswers'] as List<dynamic>).map<List<String>>(
          (x) => List<String>.from(x as List<dynamic>),
        ),
      ),
      mark: map['mark'] != null ? map['mark'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory StoreSurveyState.fromJson(String source) =>
      StoreSurveyState.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'StoreSurveyState(survey: $survey, isLoading: $isLoading, currentQuestionIndex: $currentQuestionIndex, selectedAnswers: $selectedAnswers, mark: $mark)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is StoreSurveyState &&
        other.survey == survey &&
        other.isLoading == isLoading &&
        other.currentQuestionIndex == currentQuestionIndex &&
        listEquals(other.selectedAnswers, selectedAnswers) &&
        other.mark == mark;
  }

  @override
  int get hashCode {
    return survey.hashCode ^
        isLoading.hashCode ^
        currentQuestionIndex.hashCode ^
        selectedAnswers.hashCode ^
        mark.hashCode;
  }
}
