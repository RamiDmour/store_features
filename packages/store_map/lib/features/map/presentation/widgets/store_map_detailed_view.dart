import 'package:flutter/material.dart';
import 'package:store_core/store_core.dart';
import 'package:store_map/features/comments/data/models/store_comment_model.dart';
import 'package:store_map/features/comments/presentation/widgets/add_comment_bottom_sheet.dart';
import 'package:store_map/features/comments/presentation/widgets/store_comment.dart';
import 'package:store_map/features/map/data/models/store_map_model.dart';
import 'package:store_map/features/map/presentation/widgets/store_map_background_text.dart';
import 'package:store_map/features/map/presentation/widgets/store_map_carousel.dart';
import 'package:store_map/features/comments/presentation/widgets/star_selector.dart';

class StoreMapDetailedView extends StatelessWidget {
  final StoreMapModel store;
  final List<StoreCommentModel> comments;
  final Color primaryColor;
  final Color secondaryColor;
  final StoreMapBackgroundTextStyle backgroundTextStyle;
  final bool isLoading;
  final Function(String text, int rating) onCommentAdded;

  const StoreMapDetailedView({
    super.key,
    required this.store,
    required this.comments,
    required this.primaryColor,
    required this.secondaryColor,
    required this.backgroundTextStyle,
    required this.isLoading,
    required this.onCommentAdded,
  });

  @override
  Widget build(BuildContext context) {
    final imageUrls = store.imageUrls;
    final averageRating =
        comments.fold(0.0, (sum, comment) => sum + comment.rating) /
            comments.length;
    final topSafePadding = MediaQuery.of(context).padding.top;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              StoreMapCarousel(imageUrls: imageUrls),
              Positioned(
                top: 8.h + topSafePadding,
                left: 16.w,
                child: SizedBox(
                  width: 36.w,
                  height: 36.h,
                  child: MaterialButton(
                    onPressed: storeDI.get<StoreCore>().router.pop,
                    color: Colors.black.withOpacity(0.4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
              if (comments.isNotEmpty)
                Positioned(
                  top: 8.h + topSafePadding,
                  right: 16.w,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 10.h,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: StoreColors.yellow[500],
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          averageRating.toStringAsPrecision(2),
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 16.sp,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
            ],
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(
                left: 20.w,
                right: 20.w,
                top: 20.h,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
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
                  SizedBox(
                    width: double.infinity,
                    height: 54.h,
                    child: MaterialButton(
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      color: primaryColor,
                      child: Text(
                        store.phoneNumber,
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: secondaryColor,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 25.h, bottom: 12.h),
                    child: Row(
                      children: [
                        Text(
                          "Отзывы",
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                            color: StoreColors.grey[900],
                          ),
                        ),
                        SizedBox(width: 4.w),
                        StoreMapBackgroundText(
                          style: backgroundTextStyle,
                          text: comments.length.toString(),
                        )
                      ],
                    ),
                  ),
                  StarSelector(
                    onRatingChanged: (star) => showAddCommentBottomSheet(
                      context,
                      address: store.address,
                      name: store.name,
                      rating: star,
                      primaryColor: primaryColor,
                      onCommentAdded: onCommentAdded,
                    ),
                    rating: 0,
                  ),
                  SizedBox(height: 8.h),
                  Expanded(
                    child: isLoading
                        ? Center(
                            child: CircularProgressIndicator(
                            color: primaryColor,
                          ))
                        : ListView.builder(
                            itemCount: comments.length,
                            itemBuilder: (_, i) =>
                                StoreComment(comment: comments[i]),
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                          ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
