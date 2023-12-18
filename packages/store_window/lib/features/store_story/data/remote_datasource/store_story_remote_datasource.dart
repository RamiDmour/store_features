import 'package:store_core/store_core.dart';
import 'package:store_window/features/store_story/data/models/store_story_model.dart';

abstract class StoreStoryRemoteDatasource {
  Future<ApiResult<List<StoreStoryModel>>> getStories();

  Future<void> likeStory(String id);

  Future<void> dislikeStory(String id);

  Future<void> actStory(String id);
}

class StoreStoryRemoteDatasourceImpl extends StoreStoryRemoteDatasource {
  @override
  Future<ApiResult<List<StoreStoryModel>>> getStories() async {
    await Future.delayed(const Duration(seconds: 2));
    return ApiResult.success(data: [
      StoreStoryModel(
        id: "1",
        name: "Название истории 1",
        actionText: "Подробнее",
        imageUrl:
            "https://img.freepik.com/free-photo/painting-mountain-lake-with-mountain-background_188544-9126.jpg",
      ),
      StoreStoryModel(
        id: "2",
        name: "Название истории 2",
        actionText: "Подробнее",
        imageUrl:
            "https://img.freepik.com/free-photo/painting-mountain-lake-with-mountain-background_188544-9126.jpg",
      ),
      StoreStoryModel(
        id: "3",
        name: "Название истории 3",
        actionText: "Подробнее",
        imageUrl:
            "https://img.freepik.com/free-photo/painting-mountain-lake-with-mountain-background_188544-9126.jpg",
      ),
      StoreStoryModel(
        id: "4",
        name: "Название истории 4",
        actionText: "Подробнее",
        imageUrl:
            "https://img.freepik.com/free-photo/painting-mountain-lake-with-mountain-background_188544-9126.jpg",
      ),
      StoreStoryModel(
        id: "5",
        name: "Название истории 5",
        actionText: "Подробнее",
        imageUrl:
            "https://img.freepik.com/free-photo/painting-mountain-lake-with-mountain-background_188544-9126.jpg",
      ),
      StoreStoryModel(
        id: "6",
        name: "Название истории 6",
        actionText: "Подробнее",
        imageUrl:
            "https://img.freepik.com/free-photo/painting-mountain-lake-with-mountain-background_188544-9126.jpg",
      ),
    ]);
  }

  @override
  Future<void> likeStory(String id) {
    // TODO: implement likeStory
    throw UnimplementedError();
  }

  @override
  Future<void> dislikeStory(String id) {
    // TODO: implement dislikeStory
    throw UnimplementedError();
  }

  @override
  Future<void> actStory(String id) {
    // TODO: implement actStory
    throw UnimplementedError();
  }
}
