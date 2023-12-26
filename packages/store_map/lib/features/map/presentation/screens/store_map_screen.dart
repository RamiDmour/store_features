import 'package:flutter/material.dart';
import 'package:store_core/store_core.dart';
import 'package:store_map/features/map/presentation/bloc/store_map_cubit.dart';
import 'package:store_map/features/map/presentation/bloc/store_map_state.dart';
import 'package:store_map/features/map/presentation/widgets/toast_message.dart';
import 'package:store_map/features/map/presentation/widgets/store_map_background_text.dart';
import 'package:store_map/features/map/presentation/widgets/store_map_view.dart';

class StoreMapScreen extends StatelessWidget {
  final Color primaryColor;
  final Color secondaryColor;
  final String inactiveOpenedImage;
  final String inactiveClosedImage;
  final String activeOpenedImage;
  final String activeClosedImage;
  final StoreMapBackgroundTextStyle backgroundTextStyle;

  const StoreMapScreen({
    super.key,
    required this.primaryColor,
    required this.inactiveOpenedImage,
    required this.inactiveClosedImage,
    required this.activeOpenedImage,
    required this.activeClosedImage,
    required this.backgroundTextStyle,
    required this.secondaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => StoreMapCubit(
        getMapStoresUseCase: storeDI(),
        toggleNotificationUseCase: storeDI(),
      ),
      child: Builder(
        builder: (context) {
          return BlocBuilder<StoreMapCubit, StoreMapState>(
            builder: (_, state) {
              final cubit = context.read<StoreMapCubit>();

              return StoreMapView(
                stores: state.stores,
                isLoading: state.isLoading,
                onZoomIn: cubit.zoomIn,
                onZoomOut: cubit.zoomOut,
                onStoreTap: cubit.selectStore,
                onMapCreated: cubit.setYandexMapController,
                onCameraPositionChanged: (_, __, finished) {
                  if (finished) {
                    cubit.getStores();
                  }
                },
                onClusterTap: cubit.onClusterTap,
                primaryColor: primaryColor,
                secondaryColor: secondaryColor,
                inactiveOpenedImage: inactiveOpenedImage,
                inactiveClosedImage: inactiveClosedImage,
                activeOpenedImage: activeOpenedImage,
                activeClosedImage: activeClosedImage,
                selectedStore: state.selectedStore,
                backgroundTextStyle: backgroundTextStyle,
              );
            },
          );
        },
      ),
    );
  }
}
