import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store_core/store_core.dart';
import 'package:store_window/features/shop_window/presentation/widgets/store_banner.dart';
import 'package:store_window/features/shop_window/presentation/widgets/store_story.dart';
import 'package:store_window/gen/assets.gen.dart';

class StoreWindowScreen extends StatelessWidget {
  const StoreWindowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(14.r),
                      bottomRight: Radius.circular(14.r),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: StoreColors.grey[300]!,
                        blurRadius: 8.r,
                        offset: const Offset(0, 2),
                      ),
                    ]),
                margin: EdgeInsets.only(bottom: 16.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Калуга, Академическая ул., 15",
                      style: TextStyle(
                        color: StoreColors.grey[900],
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        color: StoreColors.grey[500]!,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: [
                    // STORIES
                    SizedBox(
                      height: 144.h,
                      child: ListView.builder(
                        itemBuilder: (_, __) => Padding(
                          padding: EdgeInsets.only(right: 8.w),
                          child: StoreStory(
                            onTap: () {},
                            imageUrl:
                                "https://img.freepik.com/free-photo/painting-mountain-lake-with-mountain-background_188544-9126.jpg",
                            text: "Название истории баннера",
                          ),
                        ),
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        primary: false,
                      ),
                    ),
                    // STORIES
                    // SEARCH
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      child: Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 52.h,
                              child: CupertinoSearchTextField(
                                placeholder: "Поиск товаров",
                                backgroundColor: StoreColors.grey[200],
                                placeholderStyle: TextStyle(
                                  fontSize: 16.sp,
                                  color: StoreColors.grey[500],
                                ),
                                prefixIcon: Padding(
                                  padding: EdgeInsets.only(left: 10.w),
                                  child: Icon(
                                    Icons.search,
                                    size: 24.r,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 8.w),
                          InkWell(
                            child: Container(
                              width: 52.w,
                              height: 52.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.r),
                                color: StoreColors.grey[200],
                              ),
                              child: const Icon(
                                Icons.qr_code_2,
                                size: 24,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    // SEARCH
                    // CATEGORIES
                    SizedBox(
                      child: Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: StoreBanner(
                              onTap: () {},
                              text: "Любимые товары",
                              image: Assets.images.favoriteProductsBanner
                                  .image(package: "store_window"),
                              textStyle: TextStyle(
                                color: StoreColors.purple[600]!,
                                fontWeight: FontWeight.bold,
                                fontSize: 13.sp,
                              ),
                              color: StoreColors.purple[200]!,
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Expanded(
                            flex: 8,
                            child: StoreBanner(
                              onTap: () {},
                              text: "Молочные продукты, яйца",
                              image: Assets.images.milkBanner
                                  .image(package: "store_window"),
                              textStyle: TextStyle(
                                color: const Color(0xFF42689D),
                                fontWeight: FontWeight.bold,
                                fontSize: 13.sp,
                              ),
                              color: const Color(0xFFD1E4FF),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      child: Row(
                        children: [
                          Expanded(
                            child: StoreBanner(
                              onTap: () {},
                              text: "Мясо, рыба, птица и колбасные изделия",
                              image: Assets.images.meatBanner
                                  .image(package: "store_window"),
                              textStyle: TextStyle(
                                color: const Color(0xFFB35454),
                                fontWeight: FontWeight.bold,
                                fontSize: 13.sp,
                              ),
                              color: const Color(0xFFFFD4D4),
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Expanded(
                            child: StoreBanner(
                              onTap: () {},
                              text: "Хлеб и хлебобулочные изделия",
                              image: Assets.images.breadBanner
                                  .image(package: "store_window"),
                              textStyle: TextStyle(
                                color: const Color(0xFF996131),
                                fontWeight: FontWeight.bold,
                                fontSize: 13.sp,
                              ),
                              color: const Color(0xFFFFE6CF),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 7,
                            child: StoreBanner(
                              onTap: () {},
                              text:
                                  "Шоколад, конфеты, печение и другие сладости",
                              image: Assets.images.chocolateBanner
                                  .image(package: "store_window"),
                              textStyle: TextStyle(
                                color: const Color(0xFF84552C),
                                fontWeight: FontWeight.bold,
                                fontSize: 13.sp,
                              ),
                              color: const Color(0xFFFFE0C5),
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Expanded(
                            flex: 3,
                            child: StoreBanner(
                              onTap: () {},
                              text: "Овощи, фрукты, ягоды",
                              image: Assets.images.vegetablesBanner
                                  .image(package: "store_window"),
                              textStyle: TextStyle(
                                color: const Color(0xFF3D7F32),
                                fontWeight: FontWeight.bold,
                                fontSize: 13.sp,
                              ),
                              color: const Color(0xFFB6FAAB),
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: StoreBanner(
                            onTap: () {},
                            text: "Бакалея",
                            image: Image.asset(""),
                            textStyle: TextStyle(
                              color: const Color(0xFFA2489F),
                              fontWeight: FontWeight.bold,
                              fontSize: 13.sp,
                            ),
                            color: const Color(0xFFFFE0FE),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Expanded(
                          child: StoreBanner(
                            onTap: () {},
                            text: "Автотовары",
                            image: Image.asset(""),
                            textStyle: TextStyle(
                              color: const Color(0xFF7B7225),
                              fontWeight: FontWeight.bold,
                              fontSize: 13.sp,
                            ),
                            color: const Color(0xFFF9F4C8),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Expanded(
                          child: StoreBanner(
                            onTap: () {},
                            text: "Спорт",
                            image: Image.asset(""),
                            textStyle: TextStyle(
                              color: const Color(0xFF308070),
                              fontWeight: FontWeight.bold,
                              fontSize: 13.sp,
                            ),
                            color: const Color(0xFFC7F7EE),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
