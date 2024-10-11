import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meem/core/utils/colors.dart';

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

class SearchField extends StatelessWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: TextFormField(
        onChanged: (value) {},
        decoration: InputDecoration(
          filled: true,
          hintStyle: const TextStyle(color: Color(0xFF757575)),
          fillColor: const Color(0xFF979797).withOpacity(0.1),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide.none,
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide.none,
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide.none,
          ),
          hintText: "Search product",
          prefixIcon: const Icon(Icons.search),
        ),
      ),
    );
  }
}

class IconBtnWithCounter extends StatelessWidget {
  const IconBtnWithCounter({
    Key? key,
    required this.iconData, // Changed from svgSrc to iconData
    this.numOfitem = 0,
    required this.press,
  }) : super(key: key);

  final IconData iconData; // Use IconData instead of svgSrc
  final int numOfitem;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: press,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            height: 46,
            width: 46,
            decoration: BoxDecoration(
              color: const Color(0xFF979797).withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(iconData, color: Colors.black), // Replace SVG with Icon
          ),
          if (numOfitem != 0)
            Positioned(
              top: -3,
              right: 0,
              child: Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  color: const Color(0xFFFF4848),
                  shape: BoxShape.circle,
                  border: Border.all(width: 1.5, color: Colors.white),
                ),
                child: Center(
                  child: Text(
                    "$numOfitem",
                    style: const TextStyle(
                      fontSize: 12,
                      height: 1,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF4A3298),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Text.rich(
        TextSpan(
          style: TextStyle(color: Colors.white),
          children: [
            TextSpan(text: "A Summer Surprise\n"),
            TextSpan(
              text: "Cashback 20%",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key? key,
    required this.title,
    required this.press,
  }) : super(key: key);

  final String title;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        TextButton(
          onPressed: press,
          style: TextButton.styleFrom(foregroundColor: Colors.grey),
          child: const Text("See more"),
        ),
      ],
    );
  }
}

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
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 20,
              childAspectRatio: 0.7,
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
            height: 250, // Set a fixed height for the horizontal list
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
              // Product Image with Favorite Icon on the Left
              Stack(
                children: [
                  Center(
                    child: SizedBox(
                      height: 120.h,
                      child: AspectRatio(
                        aspectRatio: 1.0,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                          child: Image.network(
                            product.images[0],
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return const Center(child: Icon(Icons.error)); // Handle image loading errors
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Favorite Icon Positioned on the Left Under the Image
                  Positioned(


                    right: 10, // Adjust as needed
                    bottom: -5, // Adjust as needed to position it under the image
                    child: IconButton(
                      color: Colors.redAccent,
                      onPressed: onFavoriteToggle,
                      icon: Icon(
                        product.isFavourite ? Icons.favorite : Icons.favorite_border,
                        color: product.isFavourite ?  Colors.redAccent :  ColorsManager.lightGray,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(10.0.sp),
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

                    const SizedBox(height: 5),
                    Column(
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
                        if (product.discount > 0) ...[
                          const SizedBox(width: 8),
                          // Old Price display
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
  final int discount; // Added discount property
  final List<Color> colors;
  final double rating;
  final bool isPopular;

  Product({
    required this.id,
    required this.title,
    required this.images,
    required this.price,
    required this.isFavourite,
    required this.discount, // Added discount property
    required this.colors,
    required this.rating,
    required this.isPopular,
  });
}
