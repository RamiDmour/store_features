import 'package:store_map/features/map/data/models/lat_long.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

extension PointToLatLongModel on Point {
  LatLong toLatLong() {
    return LatLong(
      latitude,
      longitude,
    );
  }
}

extension LatLongToPointModel on LatLong {
  Point toPoint() {
    return Point(
      latitude: latitude,
      longitude: longitude,
    );
  }
}
