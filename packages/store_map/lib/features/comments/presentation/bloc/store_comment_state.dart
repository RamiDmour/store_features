import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:store_map/features/comments/data/models/store_comment_model.dart';

class StoreCommentState {
  final List<StoreCommentModel> comments;
  final bool isLoading;
  StoreCommentState({
    this.comments = const [],
    this.isLoading = true,
  });

  StoreCommentState copyWith({
    List<StoreCommentModel>? comments,
    bool? isLoading,
  }) {
    return StoreCommentState(
      comments: comments ?? this.comments,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'comments': comments.map((x) => x.toMap()).toList(),
      'isLoading': isLoading,
    };
  }

  factory StoreCommentState.fromMap(Map<String, dynamic> map) {
    return StoreCommentState(
      comments: List<StoreCommentModel>.from(
        (map['comments'] as List<int>).map<StoreCommentModel>(
          (x) => StoreCommentModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      isLoading: map['isLoading'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory StoreCommentState.fromJson(String source) =>
      StoreCommentState.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'StoreCommentState(comments: $comments, isLoading: $isLoading)';

  @override
  bool operator ==(covariant StoreCommentState other) {
    return listEquals(other.comments, comments) && other.isLoading == isLoading;
  }

  @override
  int get hashCode => comments.hashCode ^ isLoading.hashCode;
}
