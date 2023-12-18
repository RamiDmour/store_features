import 'package:flutter/material.dart';
import 'package:store_core/store_core.dart';

class PrimaryButton extends StatelessWidget {
  final Function()? onTap;
  final Widget child;
  const PrimaryButton({
    super.key,
    required this.onTap,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: StoreColors.purple[600],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        disabledBackgroundColor: StoreColors.purple[300],
        disabledForegroundColor: Colors.white,
      ),
      child: child,
    );
  }
}
