import 'dart:convert';

sealed class StoreSurveyAnswerModel {
  final String id;

  const StoreSurveyAnswerModel({required this.id});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
    };
  }

  factory StoreSurveyAnswerModel.fromMap(Map<String, dynamic> map) {
    throw UnimplementedError();
  }

  String toJson() => json.encode(toMap());

  factory StoreSurveyAnswerModel.fromJson(String source) =>
      StoreSurveyAnswerModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'StoreSurveyAnswerModel(id: $id)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is StoreSurveyAnswerModel && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  StoreSurveyAnswerModel copyWith({
    String? id,
  }) {
    throw UnimplementedError();
  }
}

class StoreSurveyTextAnswerModel extends StoreSurveyAnswerModel {
  final String text;

  const StoreSurveyTextAnswerModel({required super.id, required this.text});

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'text': text,
    };
  }

  factory StoreSurveyTextAnswerModel.fromMap(Map<String, dynamic> map) {
    return StoreSurveyTextAnswerModel(
      id: map['id'] as String,
      text: map['text'] as String,
    );
  }

  @override
  String toJson() => json.encode(toMap());

  factory StoreSurveyTextAnswerModel.fromJson(String source) =>
      StoreSurveyTextAnswerModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'StoreSurveyTextAnswerModel(id: $id, text: $text)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is StoreSurveyTextAnswerModel &&
        other.id == id &&
        other.text == text;
  }

  @override
  int get hashCode => id.hashCode ^ text.hashCode;

  @override
  StoreSurveyAnswerModel copyWith({String? id, String? text}) {
    return StoreSurveyTextAnswerModel(
      id: id ?? this.id,
      text: text ?? this.text,
    );
  }
}

class StoreSurveyImageAnswerModel extends StoreSurveyAnswerModel {
  final String imageUrl;

  const StoreSurveyImageAnswerModel(
      {required super.id, required this.imageUrl});

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'imageUrl': imageUrl,
    };
  }

  factory StoreSurveyImageAnswerModel.fromMap(Map<String, dynamic> map) {
    return StoreSurveyImageAnswerModel(
      id: map['id'] as String,
      imageUrl: map['imageUrl'] as String,
    );
  }

  @override
  String toJson() => json.encode(toMap());

  factory StoreSurveyImageAnswerModel.fromJson(String source) =>
      StoreSurveyImageAnswerModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'StoreSurveyImageAnswerModel(id: $id, imageUrl: $imageUrl)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is StoreSurveyImageAnswerModel &&
        other.id == id &&
        other.imageUrl == imageUrl;
  }

  @override
  int get hashCode => id.hashCode ^ imageUrl.hashCode;

  @override
  StoreSurveyAnswerModel copyWith({String? id, String? imageUrl}) {
    return StoreSurveyImageAnswerModel(
      id: id ?? this.id,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}
