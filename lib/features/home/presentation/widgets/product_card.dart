import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meem/config/router/routes.dart';
import 'package:meem/core/utils/colors.dart';
import 'package:meem/core/utils/models/product_model/product_model.dart';
import 'package:meem/features/Products/presentation/cubits/get_product_details_cubit/get_product_details_cubit.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  final VoidCallback onFavoriteToggle; // Callback for favorite toggle

  const ProductCard({
    super.key,
    required this.product,
    required this.onFavoriteToggle, // Receive favorite toggle callback
  });

  @override
  Widget build(BuildContext context) {
    double discountedPrice = product.price!.toDouble();

    // // Calculate discounted price if discount exists
    // if (product.discount > 0) {
    //   discountedPrice =
    //       product.price - (product.price * product.discount! / 100);
    // }

    return Padding(
      padding: const EdgeInsets.all(4),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, Routes.productDetailsPage);
         BlocProvider.of<GetProductDetailsCubit>(context)
             .getProductDetails(id: product.id.toString());
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: ColorsManager.lightGray,
                blurRadius: 4.r,
                spreadRadius: 0.2.r,
                offset: const Offset(0, 2), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image
              Stack(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: SizedBox(
                        height: 140.h, // Limit image height
                        child: AspectRatio(
                          aspectRatio: 1.7,
                          child: ClipRRect(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(15.r)),
                            child: Image.network(
                              product.images![0],
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return const Center(child: Icon(Icons.error));
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (product.discount != null && product.discount! > 0)
                    Positioned(
                      top: 10,
                      left: 10,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          '-${product.discount.toString()}%',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product title
                    Text(
                      product.name!,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      maxLines: 2, // Limit title to 2 lines
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 5.h), // Add space between title and price
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Discounted Price display
                        Text(
                          'EGP ${discountedPrice.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                        // Favorite icon positioned after price
                        IconButton(
                          color: Colors.redAccent,
                          onPressed: onFavoriteToggle,
                          icon: Icon(
                            product.inFavorites!
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: product.inFavorites!
                                ? Colors.redAccent
                                : Colors.grey,
                            size: 24.sp,
                          ),
                        ),
                      ],
                    ),
                    if (product.discount != null && product.discount! > 0) ...[
                      Text(
                        'EGP ${product.price!.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
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
