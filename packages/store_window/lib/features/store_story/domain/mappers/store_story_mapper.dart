import 'package:store_window/features/store_story/data/models/store_story_model.dart';
import 'package:store_window/features/store_story/domain/entity/store_story_entity.dart';

class StoreStoryMapper {
  static StoreStoryEntity entityFromModel(StoreStoryModel model) {
    return StoreStoryEntity(
      id: model.id,
      imageUrl: model.imageUrl,
      actionText: model.actionText,
      name: model.name,
    );
  }

  static StoreStoryModel modelFromEntity(StoreStoryEntity entity) {
    return StoreStoryModel(
      id: entity.id,
      imageUrl: entity.imageUrl,
      actionText: entity.actionText,
      name: entity.name,
    );
  }
}
