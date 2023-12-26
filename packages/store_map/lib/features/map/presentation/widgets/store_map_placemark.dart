import 'package:store_map/features/map/data/models/store_map_model.dart';
import 'package:store_map/features/map/presentation/extensions/point_lat_long_mapper.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class StoreMapPlacemark extends PlacemarkMapObject {
  StoreMapPlacemark({
    required String inactiveClosedImage,
    required String inactiveOpenedImage,
    required String activeOpenedImage,
    required String activeClosedImage,
    required Function(StoreMapModel store) onStoreTap,
    required StoreMapModel store,
    MapObjectId? mapObjectId,
    Point? point,
    required bool isActive,
  }) : super(
          mapId: mapObjectId ?? MapObjectId(store.id),
          point: point ?? store.latLong.toPoint(),
          onTap: (_, __) => onStoreTap(store),
          opacity: 1,
          icon: PlacemarkIcon.single(
            PlacemarkIconStyle(
              zIndex: 1,
              scale: 0.9,
              image: BitmapDescriptor.fromAssetImage(
                store.openingAnnouncement == null
                    ? isActive
                        ? activeOpenedImage
                        : inactiveOpenedImage
                    : isActive
                        ? activeClosedImage
                        : inactiveClosedImage,
              ),
            ),
          ),
        );
}
