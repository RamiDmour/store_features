import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:store_core/store_core.dart';
import 'package:store_window/features/store_story/domain/entity/store_story_entity.dart';
import 'package:store_window/features/store_story/presentation/widgets/store_story.dart';

const _shimmerGradient = LinearGradient(
  colors: [
    Color(0xFFEBEBF4),
    Color(0xFFF4F4F4),
    Color(0xFFEBEBF4),
  ],
  stops: [
    0.1,
    0.3,
    0.4,
  ],
  begin: Alignment(-1.0, -0.3),
  end: Alignment(1.0, 0.3),
  tileMode: TileMode.clamp,
);

class StoreStoryList extends StatelessWidget {
  final List<StoreStoryEntity>? stories;
  final Function(StoreStoryEntity) onStoryTap;
  final bool isLoading;
  const StoreStoryList({
    super.key,
    required this.stories,
    required this.onStoryTap,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    if (stories?.isEmpty == true) {
      return const SizedBox();
    }
    final itemCount = isLoading ? 10 : stories!.length;

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (_, index) => Padding(
        padding: EdgeInsets.only(right: 6.w),
        child: isLoading
            ? Shimmer(
                gradient: _shimmerGradient,
                direction: ShimmerDirection.ttb,
                period: const Duration(milliseconds: 1000),
                child: Container(
                  width: 120.w,
                  height: 136.h,
                  padding: EdgeInsets.only(right: 24.w),
                  decoration: BoxDecoration(
                    color: StoreColors.red,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
              )
            : StoreStory(
                imageUrl: stories![index].imageUrl,
                text: stories![index].name,
                onTap: () => onStoryTap(stories![index]),
              ),
      ),
      itemCount: itemCount,
    );
  }
}
