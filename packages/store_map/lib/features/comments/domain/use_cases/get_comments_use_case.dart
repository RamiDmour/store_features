import 'package:store_map/features/comments/data/models/store_comment_model.dart';
import 'package:store_map/features/comments/domain/repository/store_comments_repository.dart';

class GetCommentsUseCase {
  final StoreCommentsRepository _commentsRepository;
  GetCommentsUseCase(this._commentsRepository);

  Future<List<StoreCommentModel>> call(String storeId) {
    return _commentsRepository.getComments(storeId);
  }
}
