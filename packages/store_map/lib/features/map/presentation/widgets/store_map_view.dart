import 'package:flutter/material.dart';
import 'package:store_core/store_core.dart';
import 'package:store_map/features/map/data/models/store_map_model.dart';
import 'package:store_map/features/map/presentation/widgets/store_map_background_text.dart';
import 'package:store_map/features/map/presentation/widgets/store_map_bottom_sheet.dart';
import 'package:store_map/features/map/presentation/widgets/store_map_button.dart';
import 'package:store_map/features/map/presentation/widgets/store_map_cluster.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class StoreMapView extends StatelessWidget {
  final List<StoreMapModel> stores;
  final bool isLoading;
  final Function() onZoomIn;
  final Function() onZoomOut;
  final Function(StoreMapModel) onStoreTap;
  final Function(YandexMapController) onMapCreated;
  final Function(CameraPosition, CameraUpdateReason, bool)
      onCameraPositionChanged;
  final void Function(ClusterizedPlacemarkCollection, Cluster) onClusterTap;
  final Color primaryColor;
  final Color secondaryColor;
  final String inactiveOpenedImage;
  final String inactiveClosedImage;
  final String activeOpenedImage;
  final String activeClosedImage;
  final StoreMapModel? selectedStore;
  final StoreMapBackgroundTextStyle backgroundTextStyle;

  const StoreMapView({
    super.key,
    required this.stores,
    required this.isLoading,
    required this.onZoomIn,
    required this.onZoomOut,
    required this.onStoreTap,
    required this.onMapCreated,
    required this.onCameraPositionChanged,
    required this.onClusterTap,
    required this.primaryColor,
    required this.inactiveOpenedImage,
    required this.inactiveClosedImage,
    required this.selectedStore,
    required this.activeOpenedImage,
    required this.activeClosedImage,
    required this.backgroundTextStyle,
    required this.secondaryColor,
  });

  void _onStoreTap(
    BuildContext context,
    StoreMapModel store,
    StoreMapBackgroundTextStyle bottomSheetStyle,
  ) {
    onStoreTap(store);
    showStoreMapBottomSheet(
      context,
      store: store,
      style: bottomSheetStyle,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) => Stack(
          children: [
            YandexMap(
              onMapCreated: onMapCreated,
              onCameraPositionChanged: onCameraPositionChanged,
              mapObjects: [
                StoreMapCluster(
                  stores: stores,
                  onStoreTap: (store) => _onStoreTap(
                    context,
                    store,
                    backgroundTextStyle,
                  ),
                  onClusterTap: onClusterTap,
                  placemarkBackgroundColor: primaryColor,
                  placemarkTextColor: secondaryColor,
                  inactiveOpenedImage: inactiveOpenedImage,
                  inactiveClosedImage: inactiveClosedImage,
                  selectedStore: selectedStore,
                  activeOpenedImage: activeOpenedImage,
                  activeClosedImage: activeClosedImage,
                ),
              ],
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 16.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 48.w,
                      height: 48.h,
                      child: StoreMapButton(
                        onTap: onZoomIn,
                        child: const Icon(Icons.add),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    SizedBox(
                      width: 48.w,
                      height: 48.h,
                      child: StoreMapButton(
                        onTap: onZoomOut,
                        child: const Icon(Icons.remove),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
