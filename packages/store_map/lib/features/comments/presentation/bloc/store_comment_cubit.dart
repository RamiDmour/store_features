import 'package:store_core/store_core.dart';
import 'package:store_map/features/comments/domain/use_cases/add_comment_use_case.dart';
import 'package:store_map/features/comments/domain/use_cases/get_comments_use_case.dart';
import 'package:store_map/features/comments/presentation/bloc/store_comment_state.dart';

class StoreCommentCubit extends Cubit<StoreCommentState> {
  final GetCommentsUseCase _getCommentsUseCase;
  final AddCommentUseCase _addCommentUseCase;
  StoreCommentCubit({
    required GetCommentsUseCase getCommentsUseCase,
    required AddCommentUseCase addCommentUseCase,
  })  : _addCommentUseCase = addCommentUseCase,
        _getCommentsUseCase = getCommentsUseCase,
        super(StoreCommentState());

  void getComments(String storeId) async {
    emit(state.copyWith(isLoading: true));

    final comments = await _getCommentsUseCase(storeId);

    emit(state.copyWith(comments: comments, isLoading: false));
  }

  void addComment({
    required String storeId,
    required String text,
    required int rating,
    required Function() onSuccess,
  }) async {
    final result = await _addCommentUseCase(
      storeId: storeId,
      text: text,
      rating: rating,
    );

    if (result) {
      onSuccess();
    }
  }
}
