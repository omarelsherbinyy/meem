import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meem/core/utils/colors.dart';
import 'package:meem/core/utils/string.dart';
import 'package:meem/features/home/presentation/widgets/banners.dart';
import 'package:meem/features/home/presentation/widgets/categories_list.dart';
import 'package:meem/features/home/presentation/widgets/populer_products_state.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          floating: true,
          pinned: false,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/cart logo.png', height: 40.h),
              Text(
                "meem",
                style: TextStyle(
                  fontSize: 26.sp,
                  fontFamily: StringManager.fontFamily,
                  fontWeight: FontWeight.bold,
                  color: ColorsManager.mainBlue,
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.account_circle_outlined,
                  color: Colors.black),
              onPressed: () {},
            ),
          ],
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              // const CustomSearchBar(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: Text(
                  "All Featured",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontFamily: StringManager.fontFamily,
                    fontWeight: FontWeight.w600,
                    color: ColorsManager.textBlue,
                  ),
                ),
              ),
              const CategoriesList(),

              buildBannerSlider(),
              const PopularProducts(),
            ],
          ),
        ),
      ],
    );
  }
}
