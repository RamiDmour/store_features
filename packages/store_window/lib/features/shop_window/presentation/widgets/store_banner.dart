import 'package:flutter/material.dart';
import 'package:store_core/store_core.dart';

class StoreBanner extends StatelessWidget {
  final double? width;
  final double? height;
  final String text;
  final TextStyle? textStyle;
  final Widget image;
  final Color color;
  final Function() onTap;

  const StoreBanner({
    super.key,
    this.width,
    this.height,
    required this.text,
    this.textStyle,
    required this.image,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 120.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: color,
        ),
        padding: EdgeInsets.only(
          left: 12.w,
          top: 12.h,
        ),
        child: Stack(
          children: [
            Text(
              text,
              style: textStyle,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(12.r),
                ),
                child: image,
              ),
            )
          ],
        ),
      ),
    );
  }
}
