import 'package:store_map/features/map/domain/repository/store_map_repository.dart';

class ToggleNotificationUseCase {
  final StoreMapRepository _repository;

  ToggleNotificationUseCase(this._repository);

  Future<void> call(String storeId) {
    return _repository.toggleNotification(storeId);
  }
}
