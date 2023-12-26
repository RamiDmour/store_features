import 'dart:math';

import 'package:store_core/store_core.dart';
import 'package:store_map/features/map/data/models/lat_long.dart';
import 'package:store_map/features/map/data/models/store_map_model.dart';

abstract class StoreMapRemoteDatasource {
  Future<ApiResult<List<StoreMapModel>>> getStores({
    required LatLong topLeft,
    required LatLong bottomRight,
  });

  Future<ApiResult<void>> toggleNotification(String storeId);
}

class StoreMapRemoteDatasourceImpl extends StoreMapRemoteDatasource {
  final ApiClient _apiClient;

  StoreMapRemoteDatasourceImpl({
    required ApiClient apiClient,
  }) : _apiClient = apiClient;

  @override
  Future<ApiResult<List<StoreMapModel>>> getStores({
    required LatLong topLeft,
    required LatLong bottomRight,
  }) async {
    await Future.delayed(const Duration(seconds: 1));

    final random = Random();

    final stores = List<StoreMapModel>.generate(
      50,
      (index) => StoreMapModel(
        id: 'id$index',
        name: 'address$index',
        workingSchedule: 'workingSchedule$index',
        latLong: LatLong(
          random.nextDouble() * (topLeft.latitude - bottomRight.latitude) +
              bottomRight.latitude,
          random.nextDouble() * (topLeft.longitude - bottomRight.longitude) +
              bottomRight.longitude,
        ),
        imageUrls: [
          'https://img.freepik.com/free-photo/painting-mountain-lake-with-mountain-background_188544-9126.jpg',
          'https://img.freepik.com/free-photo/painting-mountain-lake-with-mountain-background_188544-9126.jpg',
          'https://img.freepik.com/free-photo/painting-mountain-lake-with-mountain-background_188544-9126.jpg',
          'https://img.freepik.com/free-photo/painting-mountain-lake-with-mountain-background_188544-9126.jpg',
          'https://img.freepik.com/free-photo/painting-mountain-lake-with-mountain-background_188544-9126.jpg',
          'https://img.freepik.com/free-photo/painting-mountain-lake-with-mountain-background_188544-9126.jpg',
          'https://img.freepik.com/free-photo/painting-mountain-lake-with-mountain-background_188544-9126.jpg',
          'https://img.freepik.com/free-photo/painting-mountain-lake-with-mountain-background_188544-9126.jpg',
          'https://img.freepik.com/free-photo/painting-mountain-lake-with-mountain-background_188544-9126.jpg',
        ],
        openingAnnouncement:
            random.nextBool() ? 'openingAnnouncement$index' : null,
        isNotificationEnabled: false,
        phoneNumber: "+7 981 917 12 13",
        address: 'address$index',
      ),
    );

    return ApiResult.success(data: stores);
  }

  @override
  Future<ApiResult<void>> toggleNotification(String storeId) async {
    return ApiResult.success(data: null);
  }
}
