import 'package:store_map/features/map/data/models/lat_long.dart';
import 'package:store_map/features/map/data/models/store_map_model.dart';
import 'package:store_map/features/map/data/remote_datasource/store_map_remote_datasource.dart';

abstract class StoreMapRepository {
  Future<List<StoreMapModel>> getStores({
    required LatLong topLeft,
    required LatLong bottomRight,
  });

  Future<void> toggleNotification(String storeId);
}

class StoreMapRepositoryImpl extends StoreMapRepository {
  final StoreMapRemoteDatasource _remoteDatasource;

  StoreMapRepositoryImpl({required StoreMapRemoteDatasource remoteDatasource})
      : _remoteDatasource = remoteDatasource;

  @override
  Future<List<StoreMapModel>> getStores({
    required LatLong topLeft,
    required LatLong bottomRight,
  }) async {
    final result = await _remoteDatasource.getStores(
      topLeft: topLeft,
      bottomRight: bottomRight,
    );
    return result.data!;
  }

  @override
  Future<void> toggleNotification(String storeId) async {
    await _remoteDatasource.toggleNotification(storeId);
  }
}
