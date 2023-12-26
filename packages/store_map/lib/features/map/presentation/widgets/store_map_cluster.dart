import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:store_map/features/map/data/models/store_map_model.dart';
import 'package:store_map/features/map/presentation/widgets/store_map_placemark.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

Future<Uint8List> _buildClusterAppearance({
  required String clusterItemsCount,
  required Color placemarkBackgroundColor,
  required Color placemarkTextColor,
}) async {
  final recorder = PictureRecorder();

  final canvas = Canvas(recorder);
  const size = Size(200, 200);

  final fillPaint = Paint()
    ..color = placemarkBackgroundColor
    ..style = PaintingStyle.fill;

  final strokePaint = Paint()
    ..color = Colors.white
    ..style = PaintingStyle.stroke
    ..strokeWidth = 10;
  const radius = 60.0;

  final textPainter = TextPainter(
    text: TextSpan(
      text: clusterItemsCount,
      style: TextStyle(
        color: placemarkTextColor,
        fontSize: 50,
        fontWeight: FontWeight.w800,
      ),
    ),
    textDirection: TextDirection.ltr,
  );

  textPainter.layout(minWidth: 0, maxWidth: size.width);

  final textOffset = Offset((size.width - textPainter.width) / 2,
      (size.height - textPainter.height) / 2);
  final circleOffset = Offset(size.height / 2, size.width / 2);

  canvas.drawCircle(circleOffset, radius, fillPaint);
  canvas.drawCircle(circleOffset, radius, strokePaint);
  textPainter.paint(canvas, textOffset);

  final image = await recorder.endRecording().toImage(
        size.width.toInt(),
        size.height.toInt(),
      );
  final pngBytes = await image.toByteData(format: ImageByteFormat.png);

  return pngBytes!.buffer.asUint8List();
}

Future<Cluster?> _onClusterAdded(
  ClusterizedPlacemarkCollection self,
  Cluster cluster,
  Color placemarkBackgroundColor,
  Color placemarkTextColor,
) async =>
    cluster.copyWith(
      appearance: cluster.appearance.copyWith(
        opacity: 1,
        icon: PlacemarkIcon.single(
          PlacemarkIconStyle(
            image: BitmapDescriptor.fromBytes(
              await _buildClusterAppearance(
                clusterItemsCount: cluster.size.toString(),
                placemarkBackgroundColor: placemarkBackgroundColor,
                placemarkTextColor: placemarkTextColor,
              ),
            ),
            scale: 1,
          ),
        ),
      ),
    );

class StoreMapCluster extends ClusterizedPlacemarkCollection {
  StoreMapCluster({
    required String inactiveClosedImage,
    required String inactiveOpenedImage,
    required String activeOpenedImage,
    required String activeClosedImage,
    required Color placemarkBackgroundColor,
    required Color placemarkTextColor,
    required List<StoreMapModel> stores,
    required Function(StoreMapModel) onStoreTap,
    super.mapId = const MapObjectId("cluster"),
    super.radius = 60,
    super.minZoom = 15,
    super.onClusterTap,
    StoreMapModel? selectedStore,
  }) : super(
          placemarks: stores
              .map(
                (store) => StoreMapPlacemark(
                  store: store,
                  onStoreTap: onStoreTap,
                  inactiveOpenedImage: inactiveOpenedImage,
                  inactiveClosedImage: inactiveClosedImage,
                  activeOpenedImage: activeOpenedImage,
                  activeClosedImage: activeClosedImage,
                  isActive: store == selectedStore,
                ),
              )
              .toList(),
          onClusterAdded: (self, cluster) => _onClusterAdded(
            self,
            cluster,
            placemarkBackgroundColor,
            placemarkTextColor,
          ),
        );
}
