import 'package:flutter/material.dart';
import 'package:store_core/store_core.dart';

class StoreStars extends StatelessWidget {
  final int maximumStars;
  final int rating;
  final double starSize;
  final Function(int rating)? onRatingChanged;
  final double starSpacing;
  const StoreStars({
    super.key,
    required this.maximumStars,
    this.rating = 32,
    required this.starSize,
    this.onRatingChanged,
    this.starSpacing = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        maximumStars,
        (i) => InkWell(
          onTap: () => onRatingChanged?.call(i + 1),
          child: Padding(
            padding: EdgeInsets.only(right: starSpacing),
            child: Icon(
              Icons.star,
              color:
                  i < rating ? StoreColors.yellow[500] : StoreColors.grey[300],
              size: starSize,
            ),
          ),
        ),
      ),
    );
  }
}
