// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:store_survey/features/data/models/store_survey_answer_model.dart';

enum StoreSurveyAnswersType {
  multiple,
  single;

  static StoreSurveyAnswersType fromString(String value) => values.firstWhere(
        (element) => element.toString() == value,
        orElse: () => multiple,
      );
}

class StoreSurveyQuestionModel {
  final String id;
  final String name;
  final String text;
  final String? imageUrl;
  final StoreSurveyAnswersType type;
  final List<StoreSurveyAnswerModel> answers;

  const StoreSurveyQuestionModel({
    required this.id,
    required this.name,
    required this.text,
    this.imageUrl,
    required this.type,
    required this.answers,
  });

  StoreSurveyQuestionModel copyWith({
    String? id,
    String? name,
    String? text,
    String? imageUrl,
    StoreSurveyAnswersType? type,
    List<StoreSurveyAnswerModel>? answers,
  }) {
    return StoreSurveyQuestionModel(
      id: id ?? this.id,
      name: name ?? this.name,
      text: text ?? this.text,
      imageUrl: imageUrl ?? this.imageUrl,
      type: type ?? this.type,
      answers: answers ?? this.answers,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'text': text,
      'imageUrl': imageUrl,
      'type': type.toString(),
      'answers': answers.map((x) => x.toMap()).toList(),
    };
  }

  factory StoreSurveyQuestionModel.fromMap(Map<String, dynamic> map) {
    return StoreSurveyQuestionModel(
      id: map['id'] as String,
      name: map['name'] as String,
      text: map['text'] as String,
      imageUrl: map['imageUrl'] != null ? map['imageUrl'] as String : null,
      type: StoreSurveyAnswersType.fromString(map['type'] as String),
      answers: List<StoreSurveyAnswerModel>.from(
        (map['answers'] as List<int>).map<StoreSurveyAnswerModel>(
          (x) => StoreSurveyAnswerModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory StoreSurveyQuestionModel.fromJson(String source) =>
      StoreSurveyQuestionModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'StoreSurveyQuestionModel(id: $id, name: $name, text: $text, imageUrl: $imageUrl, type: $type, answers: $answers)';
  }

  @override
  bool operator ==(covariant StoreSurveyQuestionModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.text == text &&
        other.imageUrl == imageUrl &&
        other.type == type &&
        listEquals(other.answers, answers);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        text.hashCode ^
        imageUrl.hashCode ^
        type.hashCode ^
        answers.hashCode;
  }
}
