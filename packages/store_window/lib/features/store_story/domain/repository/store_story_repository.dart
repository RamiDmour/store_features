import 'package:store_window/features/store_story/data/models/store_story_model.dart';
import 'package:store_window/features/store_story/data/remote_datasource/store_story_remote_datasource.dart';
import 'package:store_window/features/store_story/domain/entity/store_story_entity.dart';
import 'package:store_window/features/store_story/domain/mappers/store_story_mapper.dart';

abstract class StoreStoryRepository {
  Future<List<StoreStoryEntity>> getStories();
  Future<void> likeStory(String id);
  Future<void> dislikeStory(String id);
  Future<void> actStory(String id);
}

class StoreStoryRepositoryImpl extends StoreStoryRepository {
  final StoreStoryRemoteDatasource _remoteDatasource;
  StoreStoryRepositoryImpl({
    required StoreStoryRemoteDatasource remoteDatasource,
  }) : _remoteDatasource = remoteDatasource;

  @override
  Future<void> actStory(String id) {
    // TODO: implement actStory
    throw UnimplementedError();
  }

  @override
  Future<void> dislikeStory(String id) {
    // TODO: implement dislikeStory
    throw UnimplementedError();
  }

  @override
  Future<List<StoreStoryEntity>> getStories() async {
    final result = await _remoteDatasource.getStories();
    return result.data!.map(StoreStoryMapper.entityFromModel).toList();
  }

  @override
  Future<void> likeStory(String id) {
    // TODO: implement likeStory
    throw UnimplementedError();
  }
}
