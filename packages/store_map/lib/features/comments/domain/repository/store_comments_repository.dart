import 'package:store_map/features/comments/data/models/store_comment_model.dart';
import 'package:store_map/features/comments/data/remote_datasource/store_comments_remote_datasource.dart';

abstract class StoreCommentsRepository {
  Future<List<StoreCommentModel>> getComments(String storeId);

  Future<bool> addComment({
    required String storeId,
    required String text,
    required int rating,
  });
}

class StoreCommentsRepositoryImpl extends StoreCommentsRepository {
  final StoreCommentsRemoteDatasource _remoteDatasource;

  StoreCommentsRepositoryImpl({
    required StoreCommentsRemoteDatasource remoteDatasource,
  }) : _remoteDatasource = remoteDatasource;

  @override
  Future<List<StoreCommentModel>> getComments(String storeId) async {
    final result = await _remoteDatasource.getComments(storeId);
    return result.data!;
  }

  @override
  Future<bool> addComment({
    required String storeId,
    required String text,
    required int rating,
  }) async {
    final result = await _remoteDatasource.addComment(
      storeId: storeId,
      text: text,
      rating: rating,
    );
    return result.data!;
  }
}
