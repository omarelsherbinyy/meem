import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meem/features/Products/presentation/cubits/category_cubit/category_cubit.dart';
import 'package:meem/features/home/presentation/widgets/product_card.dart';
import 'package:shimmer/shimmer.dart';

class CategoriesProducts extends StatefulWidget {
  const CategoriesProducts({super.key});

  @override
  _CategoriesProductsState createState() => _CategoriesProductsState();
}

class _CategoriesProductsState extends State<CategoriesProducts> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit,CategoryState >(
      builder: (context, state) {
        if (state is GetCategoryProductsSuccess) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.products.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200, // Maximum width for each child
                childAspectRatio: 0.585, // Maintain aspect ratio
                crossAxisSpacing: 16, // Spacing between grid items
                mainAxisSpacing: 16, // Spacing between rows
              ),
              itemBuilder: (context, index) {
                final product = state.products[index];
                return ProductCard(
                  product: product,
                  onFavoriteToggle: () {
                    // Toggle favorite status and update UI
                    setState(() {
                      product.inFavorites = !product.inFavorites!;
                    });
                  },
                );
              },
            ),
          );
        } else if (state is GetCategoryProductsFail) {
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
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 4, // Example skeleton count
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200, // Maximum width for each child
                childAspectRatio: 0.585, // Maintain aspect ratio
                crossAxisSpacing: 16, // Spacing between grid items
                mainAxisSpacing: 16, // Spacing between rows
              ),
              itemBuilder: (context, index) {
                return Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
