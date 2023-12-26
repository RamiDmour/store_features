import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:store_core/store_core.dart';

class StoreMapCarousel extends StatefulWidget {
  final List<String> imageUrls;
  const StoreMapCarousel({
    super.key,
    required this.imageUrls,
  });

  @override
  State<StoreMapCarousel> createState() => _StoreMapCarouselState();
}

class _StoreMapCarouselState extends State<StoreMapCarousel> {
  int _imageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final imageUrls = widget.imageUrls;
    return SizedBox(
      height: 280.h,
      child: Stack(
        children: [
          CarouselSlider.builder(
            itemCount: imageUrls.length,
            itemBuilder: (_, i, __) => Image.network(
              imageUrls[i],
              fit: BoxFit.cover,
            ),
            options: CarouselOptions(
              height: 280.h,
              onPageChanged: (index, _) => setState(() => _imageIndex = index),
              viewportFraction: 1,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: Colors.black.withOpacity(0.48),
              ),
              margin: EdgeInsets.only(bottom: 16.h),
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: imageUrls
                    .asMap()
                    .entries
                    .map((e) => Container(
                          width: 6.w,
                          height: 6.h,
                          margin: EdgeInsets.only(right: 4.w),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _imageIndex == e.key
                                ? StoreColors.yellow[500]
                                : Colors.white,
                          ),
                        ))
                    .toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
