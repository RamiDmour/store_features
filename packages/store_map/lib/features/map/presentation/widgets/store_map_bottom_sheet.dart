import 'package:flutter/material.dart';
import 'package:store_core/store_core.dart';
import 'package:store_map/features/map/data/models/store_map_model.dart';
import 'package:store_map/features/map/presentation/bloc/store_map_cubit.dart';
import 'package:store_map/features/map/presentation/screens/store_map_detailed_screen.dart';
import 'package:store_map/features/map/presentation/widgets/store_map_background_text.dart';
import 'package:store_map/features/map/presentation/widgets/store_map_images.dart';
import 'package:store_map/features/map/presentation/widgets/toast_message.dart';
import 'package:store_map/gen/assets.gen.dart';
import 'package:store_map/store_map_routes.dart';

void showStoreMapBottomSheet(
  BuildContext context, {
  required StoreMapModel store,
  required StoreMapBackgroundTextStyle style,
}) {
  Scaffold.of(context).showBottomSheet(
    (context) => StoreMapBottomSheetView(
      store: store,
      style: style,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(16.r),
      ),
    ),
  );
}

class StoreMapBottomSheetView extends StatelessWidget {
  final StoreMapModel store;
  final StoreMapBackgroundTextStyle style;
  const StoreMapBottomSheetView({
    super.key,
    required this.store,
    required this.style,
  });

  Widget _buildButton({
    required String text,
    required Function() onTap,
  }) =>
      MaterialButton(
        elevation: 0,
        onPressed: onTap,
        color: StoreColors.grey[100],
        padding: EdgeInsets.symmetric(vertical: 16.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: StoreColors.grey[900]!,
            fontWeight: FontWeight.w700,
            fontSize: 16.sp,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 20.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (store.openingAnnouncement != null)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StoreMapImages(imageUrls: store.imageUrls),
                Padding(
                    padding: EdgeInsets.only(bottom: 8.h, top: 16.h),
                    child: StoreMapBackgroundText(
                      style: style,
                      text: store.openingAnnouncement!,
                    ))
              ],
            ),
          Text(
            store.name,
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: StoreColors.grey[900],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 8.h,
              bottom: 20.h,
            ),
            child: Text(
              store.workingSchedule,
              style: TextStyle(
                fontSize: 16.sp,
                color: StoreColors.grey[900],
              ),
            ),
          ),
          if (store.openingAnnouncement == null)
            Row(
              children: [
                Expanded(
                    child: _buildButton(
                  text: "Подробнее",
                  onTap: () => storeDI.get<StoreCore>().router.push(
                        StoreMapRoutes.storeMapDetailed,
                        extra: StoreMapDetailedScreenExtra(store: store),
                      ),
                )),
                SizedBox(width: 12.w),
                SizedBox(
                  width: 54.w,
                  height: 54.h,
                  child: MaterialButton(
                    elevation: 0,
                    onPressed: () {},
                    color: StoreColors.grey[100],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Assets.images.route.image(package: "store_map"),
                  ),
                ),
              ],
            )
          else
            SizedBox(
              width: double.infinity,
              child: _buildButton(
                text: store.isNotificationEnabled
                    ? "Не уведомлять об открытии"
                    : "Уведомить об открытии",
                onTap: () {
                  context.read<StoreMapCubit>().toggleNotification(store);
                  showToast(
                    context,
                    "Спасибо ❤️ мы уведомим вас SMS об открытии магазина",
                  );
                  Navigator.of(context).pop();
                },
              ),
            ),
          SizedBox(height: 8.h),
        ],
      ),
    );
  }
}
