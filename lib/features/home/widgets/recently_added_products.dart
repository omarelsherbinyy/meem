
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meem/features/home/widgets/product_card.dart';
import 'package:meem/features/home/widgets/section_title.dart';

class RecentlyAddedProducts extends StatefulWidget {
  const RecentlyAddedProducts({super.key});

  @override
  _RecentlyAddedProductsState createState() => _RecentlyAddedProductsState();
}

class _RecentlyAddedProductsState extends State<RecentlyAddedProducts> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SectionTitle(
            title: "Recently Added",
            press: () {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SizedBox(
            height: 280.h
            , // Set a fixed height for the horizontal list
            child: ListView.builder(

              scrollDirection: Axis.horizontal, // Enable horizontal scrolling
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Container(
                  width: 160, // Set a width for each product card
                  margin: const EdgeInsets.only(right: 16), // Space between cards
                  child: ProductCard(
                    product: Product(
                      id: product['id'],
                      title: product['name'],
                      images: [product['image']],
                      price: product['price'].toDouble(),
                      isFavourite: product['in_favorites'],
                      discount: product['discount'], // Include discount here
                      colors: [],
                      rating: 0.0,
                      isPopular: false, // Default popular status
                    ),
                    onPress: () {
                      // Action when a product card is tapped
                    },
                    onFavoriteToggle: () {
                      // Toggle favorite status and update UI
                      setState(() {
                        product['in_favorites'] = !product['in_favorites'];
                      });
                    },
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}