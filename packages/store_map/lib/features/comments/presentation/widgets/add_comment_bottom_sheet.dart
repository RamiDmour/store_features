import 'package:flutter/material.dart';
import 'package:store_core/store_core.dart';
import 'package:store_map/features/comments/presentation/widgets/star_selector.dart';

void showAddCommentBottomSheet(
  BuildContext context, {
  required String address,
  required String name,
  required int rating,
  required Color primaryColor,
  required Function(String text, int rating) onCommentAdded,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    builder: (_) => AddCommentBottomSheetView(
      address: address,
      name: name,
      rating: rating,
      primaryColor: primaryColor,
      onCommentAdded: onCommentAdded,
    ),
  );
}

class AddCommentBottomSheetView extends StatefulWidget {
  final String address;
  final String name;
  final int rating;
  final Color primaryColor;
  final Function(String text, int rating) onCommentAdded;
  const AddCommentBottomSheetView({
    super.key,
    required this.rating,
    required this.address,
    required this.name,
    required this.primaryColor,
    required this.onCommentAdded,
  });

  @override
  State<AddCommentBottomSheetView> createState() =>
      _AddCommentBottomSheetViewState();
}

class _AddCommentBottomSheetViewState extends State<AddCommentBottomSheetView> {
  final TextEditingController _controller = TextEditingController();
  int _rating = 0;

  @override
  void initState() {
    _rating = widget.rating;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: 16.w,
            right: 16.w,
            top: 80.h,
            bottom: 16.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.name,
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w800,
                  color: StoreColors.grey[900],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 24.h),
                child: Text(
                  widget.address,
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: StoreColors.grey[500],
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              StarSelector(
                rating: widget.rating,
                onRatingChanged: (rating) => setState(() => _rating = rating),
              ),
              SizedBox(height: 12.h),
              TextField(
                maxLines: 10,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  contentPadding: EdgeInsets.only(
                    left: 16.w,
                    right: 16.w,
                    top: 16.h,
                  ),
                  label: Text(
                    'Ваш отзыв',
                    style: TextStyle(
                      color: StoreColors.grey[500],
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: StoreColors.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: widget.primaryColor),
                  ),
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom + 16.h,
            ),
            child: SizedBox(
              height: 46.h,
              width: 200.w,
              child: MaterialButton(
                onPressed: () =>
                    widget.onCommentAdded(_controller.text, _rating),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                color: widget.primaryColor,
                child: Text(
                  "Отправить",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
