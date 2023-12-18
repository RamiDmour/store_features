import 'package:store_window/features/store_story/domain/entity/store_story_entity.dart';

sealed class StoreStoryState {}

class StoreStoryLoading extends StoreStoryState {}

class StoreStoryReady extends StoreStoryState {
  final List<StoreStoryEntity> stories;
  StoreStoryReady({
    required this.stories,
  });
}
