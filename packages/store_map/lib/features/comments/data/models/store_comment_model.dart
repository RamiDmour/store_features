// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class StoreCommentModel {
  final String id;
  final String text;
  final DateTime createdAt;
  final String authorName;
  final int rating;
  StoreCommentModel({
    required this.id,
    required this.text,
    required this.createdAt,
    required this.authorName,
    required this.rating,
  });

  StoreCommentModel copyWith({
    String? id,
    String? header,
    String? text,
    DateTime? createdAt,
    String? authorName,
    int? rating,
  }) {
    return StoreCommentModel(
      id: id ?? this.id,
      text: text ?? this.text,
      createdAt: createdAt ?? this.createdAt,
      authorName: authorName ?? this.authorName,
      rating: rating ?? this.rating,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'text': text,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'authorName': authorName,
      'rating': rating,
    };
  }

  factory StoreCommentModel.fromMap(Map<String, dynamic> map) {
    return StoreCommentModel(
      id: map['id'] as String,
      text: map['text'] as String,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
      authorName: map['authorName'] as String,
      rating: map['rating'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory StoreCommentModel.fromJson(String source) =>
      StoreCommentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'StoreCommentModel(id: $id, text: $text, createdAt: $createdAt, authorName: $authorName, rating: $rating)';
  }

  @override
  bool operator ==(covariant StoreCommentModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.text == text &&
        other.createdAt == createdAt &&
        other.authorName == authorName &&
        other.rating == rating;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        text.hashCode ^
        createdAt.hashCode ^
        authorName.hashCode ^
        rating.hashCode;
  }
}
