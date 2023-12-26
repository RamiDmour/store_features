import 'package:flutter/material.dart';
import 'package:store_core/store_core.dart';

class StoreMapImages extends StatelessWidget {
  final List<String> imageUrls;
  const StoreMapImages({
    super.key,
    required this.imageUrls,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      height: 160.h,
      child: ListView.builder(
        itemBuilder: (_, i) => Padding(
          padding: EdgeInsets.only(right: 8.w),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Image.network(
              imageUrls[i],
              width: screenWidth * 0.8,
              fit: BoxFit.cover,
            ),
          ),
        ),
        itemCount: imageUrls.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
