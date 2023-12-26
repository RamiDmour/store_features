import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:store_core/store_core.dart';
import 'package:store_map/features/comments/data/models/store_comment_model.dart';
import 'package:store_map/features/comments/presentation/widgets/store_stars.dart';

class StoreComment extends StatelessWidget {
  final StoreCommentModel comment;
  const StoreComment({
    super.key,
    required this.comment,
  });

  @override
  Widget build(BuildContext context) {
    final date = DateFormat('yyyy-MM-dd').format(comment.createdAt);

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 16.h,
        horizontal: 16.w,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: StoreColors.grey[100],
      ),
      margin: EdgeInsets.only(bottom: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                date,
                style: TextStyle(
                  color: StoreColors.grey[900]!,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              StoreStars(
                maximumStars: 5,
                starSize: 20,
                rating: comment.rating,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 12.h, bottom: 7.h),
            child: Text(
              comment.authorName,
              style: TextStyle(
                color: StoreColors.grey[900],
                fontWeight: FontWeight.w800,
                fontSize: 16.sp,
              ),
            ),
          ),
          Text(
            comment.text,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
              color: StoreColors.grey[800],
            ),
          )
        ],
      ),
    );
  }
}
