// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class StoreStoryEntity {
  final String id;
  final String imageUrl;
  final String actionText;
  final String name;
  StoreStoryEntity({
    required this.id,
    required this.imageUrl,
    required this.actionText,
    required this.name,
  });

  StoreStoryEntity copyWith({
    String? id,
    String? imageUrl,
    String? actionText,
    String? name,
  }) {
    return StoreStoryEntity(
      id: id ?? this.id,
      imageUrl: imageUrl ?? this.imageUrl,
      actionText: actionText ?? this.actionText,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'imageUrl': imageUrl,
      'actionText': actionText,
      'name': name,
    };
  }

  factory StoreStoryEntity.fromMap(Map<String, dynamic> map) {
    return StoreStoryEntity(
      id: map['id'] as String,
      imageUrl: map['imageUrl'] as String,
      actionText: map['actionText'] as String,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory StoreStoryEntity.fromJson(String source) =>
      StoreStoryEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'StoreStoryEntity(id: $id, imageUrl: $imageUrl, actionText: $actionText, name: $name)';
  }

  @override
  bool operator ==(covariant StoreStoryEntity other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.imageUrl == imageUrl &&
        other.actionText == actionText &&
        other.name == name;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        imageUrl.hashCode ^
        actionText.hashCode ^
        name.hashCode;
  }
}
