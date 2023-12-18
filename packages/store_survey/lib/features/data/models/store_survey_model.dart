// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:store_survey/features/data/models/store_survey_question_model.dart';

class StoreSurveyModel {
  final String id;
  final List<StoreSurveyQuestionModel> questions;

  const StoreSurveyModel({
    required this.id,
    required this.questions,
  });

  StoreSurveyModel copyWith({
    String? id,
    List<StoreSurveyQuestionModel>? questions,
  }) {
    return StoreSurveyModel(
      id: id ?? this.id,
      questions: questions ?? this.questions,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'questions': questions.map((x) => x.toMap()).toList(),
    };
  }

  factory StoreSurveyModel.fromMap(Map<String, dynamic> map) {
    return StoreSurveyModel(
      id: map['id'] as String,
      questions: List<StoreSurveyQuestionModel>.from(
        (map['questions'] as List<int>).map<StoreSurveyQuestionModel>(
          (x) => StoreSurveyQuestionModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory StoreSurveyModel.fromJson(String source) =>
      StoreSurveyModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'StoreSurveyModel(id: $id, questions: $questions)';

  @override
  bool operator ==(covariant StoreSurveyModel other) {
    if (identical(this, other)) return true;

    return other.id == id && listEquals(other.questions, questions);
  }

  @override
  int get hashCode => id.hashCode ^ questions.hashCode;
}
