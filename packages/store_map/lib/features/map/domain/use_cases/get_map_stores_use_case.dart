import 'package:store_map/features/map/data/models/lat_long.dart';
import 'package:store_map/features/map/data/models/store_map_model.dart';
import 'package:store_map/features/map/domain/repository/store_map_repository.dart';

class GetMapStoresUseCase {
  final StoreMapRepository _repository;

  GetMapStoresUseCase({required StoreMapRepository repository})
      : _repository = repository;

  Future<List<StoreMapModel>> call({
    required LatLong topLeft,
    required LatLong bottomRight,
  }) {
    return _repository.getStores(
      topLeft: topLeft,
      bottomRight: bottomRight,
    );
  }
}
