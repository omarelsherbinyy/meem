import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meem/features/Search/presentation/cubit/get_searched_product_cubit/get_searched_product_cubit.dart';
import 'package:meem/features/home/presentation/widgets/product_card.dart';
import 'package:shimmer/shimmer.dart';

class SearchedProduct extends StatelessWidget {
  const SearchedProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetSearchedProductCubit, GetSearchedProductState>(
      builder: (context, state) {
        if (state is GetSearchedProductSuccess) {
          return SliverGrid.builder(
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
                },
              );
            },
          );
        } else if (state is GetSearchedProductFailure) {
          return SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: Text(
                state.errorMessage,
                style: const TextStyle(
                    fontSize: 20, color: Color.fromARGB(255, 255, 17, 0)),
              ),
            ),
          );
        } else if (state is GetSearchedProductInitial) {
          return const SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: Text(
                "Search for a Product",
                style: TextStyle(
                    fontSize: 16, color: Color.fromARGB(255, 0, 0, 0)),
              ),
            ),
          );
        } else {
          return SliverGrid.builder(
            itemCount: 10, // Example skeleton count
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
          );
        }
      },
    );
  }
}
