import 'package:store_window/features/store_story/domain/entity/store_story_entity.dart';
import 'package:store_window/features/store_story/domain/repository/store_story_repository.dart';

class GetStoreStoriesUseCase {
  final StoreStoryRepository _repository;

  GetStoreStoriesUseCase({required StoreStoryRepository repository})
      : _repository = repository;

  Future<List<StoreStoryEntity>> call() async {
    return _repository.getStories();
  }
}
