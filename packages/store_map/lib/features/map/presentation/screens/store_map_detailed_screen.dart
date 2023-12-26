import 'package:flutter/material.dart';
import 'package:store_core/store_core.dart';
import 'package:store_map/features/comments/presentation/bloc/store_comment_cubit.dart';
import 'package:store_map/features/comments/presentation/bloc/store_comment_state.dart';
import 'package:store_map/features/map/data/models/store_map_model.dart';
import 'package:store_map/features/map/presentation/widgets/store_map_background_text.dart';
import 'package:store_map/features/map/presentation/widgets/store_map_detailed_view.dart';
import 'package:store_map/features/map/presentation/widgets/toast_message.dart';
import 'package:store_map/store_map_routes.dart';

class StoreMapDetailedScreenExtra {
  final StoreMapModel store;

  StoreMapDetailedScreenExtra({required this.store});
}

class StoreMapDetailedScreen extends StatelessWidget {
  final Color primaryColor;
  final Color secondaryColor;
  final StoreMapBackgroundTextStyle backgroundTextStyle;
  const StoreMapDetailedScreen({
    super.key,
    required this.primaryColor,
    required this.secondaryColor,
    required this.backgroundTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    final extra =
        GoRouterState.of(context).extra as StoreMapDetailedScreenExtra;
    final store = extra.store;

    return BlocProvider(
      create: (context) => StoreCommentCubit(
        getCommentsUseCase: storeDI(),
        addCommentUseCase: storeDI(),
      )..getComments(store.id),
      child: BlocBuilder<StoreCommentCubit, StoreCommentState>(
        builder: (context, state) => StoreMapDetailedView(
          store: store,
          comments: state.comments,
          primaryColor: primaryColor,
          secondaryColor: secondaryColor,
          backgroundTextStyle: backgroundTextStyle,
          isLoading: state.isLoading,
          onCommentAdded: (String text, int rating) =>
              context.read<StoreCommentCubit>().addComment(
                    storeId: store.id,
                    text: text,
                    rating: rating,
                    onSuccess: () {
                      final router = storeDI.get<StoreCore>().router;
                      router.pop();
                      router.pop();
                      showToast(
                        context,
                        "Благодарим за отзыв 😊 мы опубликуем его сразу после модерации",
                      );
                    },
                  ),
        ),
      ),
    );
  }
}
