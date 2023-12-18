import 'package:flutter/material.dart';

import 'package:store_core/store_core.dart';

class StoreSurveyImageAnswerItem extends StatelessWidget {
  final String imageUrl;
  final bool isActive;
  const StoreSurveyImageAnswerItem({
    super.key,
    required this.imageUrl,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: isActive ? StoreColors.purple[800]! : Colors.transparent,
            width: 4,
          ),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.r),
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
