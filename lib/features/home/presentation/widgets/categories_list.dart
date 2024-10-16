import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meem/config/router/routes.dart';
import 'package:meem/core/utils/colors.dart';
import 'package:meem/core/utils/string.dart';
import 'package:meem/features/Products/presentation/cubits/category_cubit/category_cubit.dart';
import 'package:shimmer/shimmer.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      child: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          if (state is GetCategorySuccess) {
            return Container(
              height: 120.h, // Height is scaled using ScreenUtil
              padding: EdgeInsets.symmetric(
                  horizontal: 8.w), // Use w for width and h for height
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.categories.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.categoriesView,
                          arguments: state.categories[index].name);
                      BlocProvider.of<CategoryCubit>(context)
                          .getCategoryProducts(
                              id: state.categories[index].id.toString());
                    },
                    child: Padding(
                      padding: EdgeInsets.all(
                          8.sp), // Adjust padding to be responsive
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundImage:
                                NetworkImage(state.categories[index].image!),
                            radius: 34.r, // Use ScreenUtil for radius
                          ),
                          SizedBox(
                              height: 8.h), // SizedBox with responsive height
                          Text(
                            state.categories[index].name!.toUpperCase(),
                            style: TextStyle(
                              fontFamily: StringManager.fontFamily,
                              color: ColorsManager.textBlue,
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          } else if (state is GetCategoryFail) {
            return Padding(
              padding: EdgeInsets.only(top: 110.h),
              child: Center(
                child: Text(
                  state.errorMessage,
                  style: const TextStyle(
                      fontSize: 20, color: Color.fromARGB(255, 255, 17, 0)),
                ),
              ),
            );
          } else {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 6, // Example skeleton count
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(8.sp),
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.grey[300],
                            radius: 34.r,
                          ),
                          SizedBox(height: 8.h),
                          Container(
                            height: 14.sp,
                            width: 60.sp,
                            color: Colors.grey[300],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
