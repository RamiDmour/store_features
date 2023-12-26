import 'package:flash/flash.dart';
import 'package:flash/flash_helper.dart';
import 'package:flutter/material.dart';
import 'package:store_core/store_core.dart';

void showToast(
  BuildContext context,
  String message,
) {
  context.showFlash(
    duration: const Duration(seconds: 3),
    builder: (context, controller) => Flash(
      controller: controller,
      child: FlashBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        margin: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 12.h + MediaQuery.of(context).padding.top,
        ),
        useSafeArea: false,
        position: FlashPosition.top,
        controller: controller,
        content: Text(
          message,
          style: TextStyle(
            color: StoreColors.grey[900]!,
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    ),
  );
}
