


import 'package:flutter/cupertino.dart';
import 'package:meem/features/home/widgets/product_card.dart';
import 'package:meem/features/home/widgets/section_title.dart';

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
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SectionTitle(
            title: "Popular Products",
            press: () {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: products.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200, // Maximum width for each child
              childAspectRatio: 0.585, // Maintain aspect ratio
              crossAxisSpacing: 16, // Spacing between grid items
              mainAxisSpacing: 16, // Spacing between rows
            ),
            itemBuilder: (context, index) {
              final product = products[index];
              return ProductCard(
                product: Product(
                  id: product['id'],
                  title: product['name'],
                  images: [product['image']],
                  price: product['price'].toDouble(),
                  isFavourite: product['in_favorites'],
                  discount: product['discount'],
                  colors: [], // Assuming this is empty for now
                  rating: 0.0, // Default value for rating
                  isPopular: false, // Default value for popularity
                ),
                onPress: () {
                  // Navigate to product details or perform another action
                },
                onFavoriteToggle: () {
                  // Toggle favorite status and update UI
                  setState(() {
                    product['in_favorites'] = !product['in_favorites'];
                  });
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

