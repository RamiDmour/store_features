import 'package:flutter/material.dart';
import 'package:store_core/store_core.dart';

class StoreMapBackgroundTextStyle {
  final TextStyle textStyle;
  final Color backgroundColor;

  StoreMapBackgroundTextStyle({
    required this.textStyle,
    required this.backgroundColor,
  });
}

class StoreMapBackgroundText extends StatelessWidget {
  final StoreMapBackgroundTextStyle style;
  final String text;
  const StoreMapBackgroundText({
    super.key,
    required this.style,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10.h,
        vertical: 3.h,
      ),
      decoration: BoxDecoration(
        color: style.backgroundColor,
        borderRadius: BorderRadius.circular(13.r),
      ),
      child: Text(
        text,
        style: style.textStyle,
      ),
    );
  }
}
