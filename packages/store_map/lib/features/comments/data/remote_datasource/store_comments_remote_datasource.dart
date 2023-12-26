import 'dart:math';

import 'package:store_core/store_core.dart';
import 'package:store_map/features/comments/data/models/store_comment_model.dart';

abstract class StoreCommentsRemoteDatasource {
  Future<ApiResult<List<StoreCommentModel>>> getComments(String storeId);

  Future<ApiResult<bool>> addComment({
    required String storeId,
    required String text,
    required int rating,
  });
}

class StoreCommentsRemoteDatasourceImpl
    implements StoreCommentsRemoteDatasource {
  final ApiClient _apiClient;

  StoreCommentsRemoteDatasourceImpl({required ApiClient apiClient})
      : _apiClient = apiClient;

  @override
  Future<ApiResult<List<StoreCommentModel>>> getComments(String storeId) async {
    await Future.delayed(const Duration(seconds: 2));

    final comments = List<StoreCommentModel>.generate(
      Random().nextInt(30),
      (index) => StoreCommentModel(
        id: "$index",
        text: "Текст комментария $index",
        rating: Random().nextInt(6) + 1,
        createdAt: DateTime.now(),
        authorName: "Автор комментария $index",
      ),
    );

    return ApiResult.success(data: comments);
  }

  @override
  Future<ApiResult<bool>> addComment({
    required String storeId,
    required String text,
    required int rating,
  }) async {
    return ApiResult.success(data: true);
  }
}
