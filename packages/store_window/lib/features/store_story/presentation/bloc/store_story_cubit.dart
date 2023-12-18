import 'package:store_core/store_core.dart';
import 'package:store_window/features/store_story/domain/use_cases/get_store_stories_use_case.dart';
import 'package:store_window/features/store_story/presentation/bloc/store_story_state.dart';

class StoreStoryCubit extends Cubit<StoreStoryState> {
  final GetStoreStoriesUseCase _getStoriesUseCase;
  StoreStoryCubit({required GetStoreStoriesUseCase getStoriesUseCase})
      : _getStoriesUseCase = getStoriesUseCase,
        super(StoreStoryLoading());

  Future<void> fetchStories() async {
    emit(StoreStoryLoading());
    final stories = await _getStoriesUseCase();
    emit(StoreStoryReady(stories: stories));
  }
}
