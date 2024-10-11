import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meem/core/utils/colors.dart';



class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onPress;
  final VoidCallback onFavoriteToggle; // Callback for favorite toggle

  const ProductCard({
    super.key,
    required this.product,
    required this.onPress,
    required this.onFavoriteToggle, // Receive favorite toggle callback
  });

  @override
  Widget build(BuildContext context) {
    double discountedPrice = product.price;

    // Calculate discounted price if discount exists
    if (product.discount > 0) {
      discountedPrice = product.price - (product.price * product.discount / 100);
    }

    return Padding(
      padding: const EdgeInsets.all(4),
      child: GestureDetector(
        onTap: onPress,
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
                            borderRadius: BorderRadius.vertical(top: Radius.circular(15.r)),
                            child: Image.network(
                              product.images[0],
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
                  if (product.discount > 0)
                    Positioned(
                      top: 10,
                      left: 10,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          '-${product.discount.toString()}%',
                          style:const TextStyle(
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
                      product.title,
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
                            product.isFavourite ? Icons.favorite : Icons.favorite_border,
                            color: product.isFavourite ? Colors.redAccent : Colors.grey,size: 24.sp,
                          ),
                        ),
                      ],
                    ),
                    if (product.discount > 0) ...[
                      Text(
                        'EGP ${product.price.toStringAsFixed(2)}',
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


class Product {
  final int id;
  final String title;
  final List<String> images;
  final double price;
  final bool isFavourite;
  final int discount;
  final List<Color> colors;
  final double rating;
  final bool isPopular;

  Product({
    required this.id,
    required this.title,
    required this.images,
    required this.price,
    required this.isFavourite,
    required this.discount,
    required this.colors,
    required this.rating,
    required this.isPopular,
  });
}
final List<Map<String, dynamic>> products = [
  {
    "id": 52,
    "price": 25000,
    "old_price": 25000,
    "discount": 0,
    "image":
    "https://student.valuxapps.com/storage/uploads/products/1615440322npwmU.71DVgBTdyLL._SL1500_.jpg",
    "name": "Apple iPhone 12 Pro Max 256GB 6 GB RAM, Pacific Blue",
    "description": "DISPLAY\r\nSize: 6.7 inches...",
    "in_favorites": false,
    "in_cart": true
  },
  {
    "id": 55,
    "price": 44500,
    "old_price": 44500,
    "discount": 0,
    "image":
    "https://student.valuxapps.com/storage/uploads/products/1615442168bVx52.item_XXL_36581132_143760083.jpeg",
    "name": "Apple MacBook Pro",
    "description":
    "Bring home the Apple MacBook Pro and experience computing like never before...",
    "in_favorites": true,
    "in_cart": true
  },
  {
    "id": 53,
    "price": 5599,
    "old_price": 10230,
    "discount": 45,
    "image":
    "https://student.valuxapps.com/storage/uploads/products/1615440689wYMHV.item_XXL_36330138_142814934.jpeg",
    "name":
    "JBL Xtreme 2 Portable Waterproof Bluetooth Speaker - Blue JBLXTREME2BLUAM",
    "description": "GENERAL SPECIFICATIONS\r\nMusic playing time: 15 hours...",
    "in_favorites": true,
    "in_cart": true
  },
  {
    "id": 54,
    "price": 11499,
    "old_price": 12499,
    "discount": 8,
    "image":
    "https://student.valuxapps.com/storage/uploads/products/1615441020ydvqD.item_XXL_51889566_32a329591e022.jpeg",
    "name": "Samsung 65 Inch Smart TV 4K Ultra HD Curved - UA65RU7300RXUM",
    "description": "Brand: Samsung\r\nColor: black\r\nModel: UA65RU7300...",
    "in_favorites": false,
    "in_cart": false
  },
];