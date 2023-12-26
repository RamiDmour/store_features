import 'package:store_core/store_core.dart';
import 'package:store_map/features/map/data/models/store_map_model.dart';
import 'package:store_map/features/map/domain/use_cases/get_map_stores_use_case.dart';
import 'package:store_map/features/map/domain/use_cases/toggle_notification_use_case.dart';
import 'package:store_map/features/map/presentation/bloc/store_map_state.dart';
import 'package:store_map/features/map/presentation/extensions/point_lat_long_mapper.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class StoreMapCubit extends Cubit<StoreMapState> {
  late YandexMapController yandexMapController;
  final GetMapStoresUseCase _getMapStoresUseCase;
  final ToggleNotificationUseCase _toggleNotificationUseCase;
  StoreMapCubit({
    required GetMapStoresUseCase getMapStoresUseCase,
    required ToggleNotificationUseCase toggleNotificationUseCase,
  })  : _getMapStoresUseCase = getMapStoresUseCase,
        _toggleNotificationUseCase = toggleNotificationUseCase,
        super(const StoreMapState());

  void setYandexMapController(YandexMapController controller) =>
      yandexMapController = controller;

  void zoomIn() => yandexMapController.moveCamera(CameraUpdate.zoomIn());

  void zoomOut() => yandexMapController.moveCamera(CameraUpdate.zoomOut());

  void onClusterTap(
      ClusterizedPlacemarkCollection self, Cluster cluster) async {
    yandexMapController.moveCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: cluster.appearance.point,
          zoom: (await yandexMapController.getCameraPosition()).zoom + 2.0,
          tilt: 1,
        ),
      ),
      animation: const MapAnimation(duration: 1),
    );
  }

  void selectStore(StoreMapModel? store) {
    emit(state.copyWith(selectedStore: store));
  }

  Future<void> getStores() async {
    emit(state.copyWith(isLoading: true));

    final visibleRegion = await yandexMapController.getVisibleRegion();
    final stores = await _getMapStoresUseCase(
      topLeft: visibleRegion.topLeft.toLatLong(),
      bottomRight: visibleRegion.bottomRight.toLatLong(),
    );

    emit(state.copyWith(
      isLoading: false,
      stores: stores,
    ));
  }

  Future<void> toggleNotification(StoreMapModel store) async {
    await _toggleNotificationUseCase(store.id);

    final stores = state.stores
        .map((e) => e.id == store.id
            ? e.copyWith(isNotificationEnabled: !store.isNotificationEnabled)
            : e)
        .toList();

    emit(state.copyWith(stores: stores));
    selectStore(null);
  }
}
