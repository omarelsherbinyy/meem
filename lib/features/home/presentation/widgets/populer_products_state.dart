import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meem/features/Products/presentation/cubits/get_product_cubit/get_products_cubit.dart';
import 'package:meem/features/home/presentation/widgets/product_card.dart';
import 'package:meem/features/home/presentation/widgets/section_title.dart';
import 'package:shimmer/shimmer.dart';

class PopularProducts extends StatefulWidget {
  const PopularProducts({super.key});

  @override
  _PopularProductsState createState() => _PopularProductsState();
}

class _PopularProductsState extends State<PopularProducts> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 25, 20, 5),
          child: SectionTitle(
            title: "Popular Products",
            press: () {},
          ),
        ),
        BlocBuilder<GetProductsCubit, GetProductsState>(
          builder: (context, state) {
            if (state is GetProductsSuccess) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.products.length,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 210,
                    childAspectRatio: 0.5, // Maintain aspect ratio
                    crossAxisSpacing: 10, // Spacing between grid items
                    mainAxisSpacing: 10, // Spacing between rows
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
            } else if (state is GetProductsFail) {
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
        ),
      ],
    );
  }
}
