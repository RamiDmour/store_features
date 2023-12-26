import 'package:flutter/material.dart';
import 'package:store_core/store_core.dart';

class StoreMapButton extends StatelessWidget {
  const StoreMapButton({
    super.key,
    required this.onTap,
    required this.child,
    this.padding = EdgeInsets.zero,
  });
  final Function() onTap;
  final Widget child;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: StoreColors.grey[200]!,
              blurRadius: 1,
            ),
          ],
        ),
        child: Center(child: child),
      ),
    );
  }
}
