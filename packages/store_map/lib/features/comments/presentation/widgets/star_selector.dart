import 'package:flutter/material.dart';
import 'package:store_core/store_core.dart';
import 'package:store_map/features/comments/presentation/widgets/store_stars.dart';

class StarSelector extends StatefulWidget {
  final Function(int rating) onRatingChanged;
  final int rating;
  const StarSelector({
    super.key,
    required this.onRatingChanged,
    required this.rating,
  });

  @override
  State<StarSelector> createState() => _StarSelectorState();
}

class _StarSelectorState extends State<StarSelector> {
  int _rating = 0;

  @override
  void initState() {
    _rating = widget.rating;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 11.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: StoreColors.grey[100],
      ),
      child: StoreStars(
        maximumStars: 5,
        starSize: 32,
        rating: _rating,
        starSpacing: 12.w,
        onRatingChanged: (star) {
          setState(() => _rating = star);
          widget.onRatingChanged(star);
        },
      ),
    );
  }
}
