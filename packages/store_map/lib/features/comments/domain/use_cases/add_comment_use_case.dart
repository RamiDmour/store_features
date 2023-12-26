import 'package:store_map/features/comments/domain/repository/store_comments_repository.dart';

class AddCommentUseCase {
  final StoreCommentsRepository _commentsRepository;

  AddCommentUseCase(this._commentsRepository);

  Future<bool> call({
    required String storeId,
    required String text,
    required int rating,
  }) async {
    return await _commentsRepository.addComment(
      storeId: storeId,
      text: text,
      rating: rating,
    );
  }
}
