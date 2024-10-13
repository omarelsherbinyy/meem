
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Category {
  final int id;
  final String name;
  final String imageUrl;

  Category({required this.id, required this.name, required this.imageUrl});
}

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Updated sample categories data
    List<Category> categories = [
      Category(
        id: 44,
        name: "electronic devices",
        imageUrl: "https://student.valuxapps.com/storage/uploads/categories/16893929290QVM1.modern-devices-isometric-icons-collection-with-sixteen-isolated-images-computers-periphereals-variou.jpeg",
      ),
      Category(
        id: 43,
        name: "Prevent Corona",
        imageUrl: "https://student.valuxapps.com/storage/uploads/categories/1630142480dvQxx.3658058.jpg",
      ),
      Category(
        id: 42,
        name: "sports",
        imageUrl: "https://student.valuxapps.com/storage/uploads/categories/16445270619najK.6242655.jpg",
      ),
      Category(
        id: 40,
        name: "Lighting",
        imageUrl: "https://student.valuxapps.com/storage/uploads/categories/16445230161CiW8.Light bulb-amico.png",
      ),
      Category(
        id: 46,
        name: "Clothes",
        imageUrl: "https://student.valuxapps.com/storage/uploads/categories/1644527120pTGA7.clothes.png",
      ),
      Category(
        id: 47,
        name: "Groceries",
        imageUrl: "https://student.valuxapps.com/storage/uploads/categories/1722697946gR5Og.Grocery-shop-basket-med.jpg",
      ),
    ];

    final rnd = Random();
    List<int> extents = List<int>.generate(
      categories.length,
          (index) => rnd.nextInt(3) + 2,
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Categories'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: MasonryGridView.count(
        padding: const EdgeInsets.only(
          top: 120,
          left: 4.0,
          right: 4.0,
        ),
        crossAxisCount: 3,
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final height = extents[index] * 100;
          final category = categories[index];
          return InkWell(
            onTap: () {
              // Action on tap (not implemented)
            },
            child: Hero(
              tag: category.id,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Stack(
                  children: [
                    Container(
                      height: height.toDouble(),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(category.imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      height: height.toDouble(),
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 10,
                      child: Text(
                        category.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              blurRadius: 10.0,
                              color: Colors.black,
                              offset: Offset(0.0, 0.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
