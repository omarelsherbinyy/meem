import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:meem/core/utils/colors.dart';
import 'package:meem/core/utils/string.dart';


class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {


    final rnd = Random();
    List<int> extents = List<int>.generate(
      categories.length,
          (index) => rnd.nextInt(3) + 2,
    );

    return Scaffold(
      backgroundColor: ColorsManager.white,
      appBar: AppBar(
        centerTitle: true,
        title:  Text('Categories',style: TextStyle(fontFamily: StringManager.fontFamily,color: ColorsManager.textBlue,fontSize: 22.sp,fontWeight: FontWeight.w500),),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: MasonryGridView.count(
          padding: EdgeInsets.symmetric( horizontal: 8.w),
          crossAxisCount: 2,
          mainAxisSpacing: 6.h,
          crossAxisSpacing: 6.w,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final height = extents[index] * 90.h;
            final category = categories[index];
            return InkWell(
              onTap: () {
                // Action on tap (not implemented)
              },
              borderRadius: BorderRadius.circular(16.0.r), // Added border radius for ripple effect
              splashColor: Colors.blueAccent.withOpacity(0.3), // Splash color
              highlightColor: Colors.blue.withOpacity(0.2), // Highlight color
              child: Hero(
                tag: category.id,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0.r),
                  child: Stack(
                    children: [
                      Container(
                        height: height.toDouble(),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(category.imageUrl),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(16.0.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: height.toDouble(),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                      ),
                      Positioned(
                        bottom: 20.h,
                        left: 16.w,
                        right: 16.w, // Added right padding
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.h), // Increased vertical padding
                          child: Text(
                            category.name,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: StringManager.fontFamily,
                              color: Colors.white,
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w600,
                              shadows: const [
                                Shadow(
                                  blurRadius: 8.0,
                                  color: Colors.black,
                                  offset: Offset(0.0, 1.0),
                                ),
                              ],
                            ),
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
      ),
    );
  }
}



class Category {
  final int id;
  final String name;
  final String imageUrl;

  Category({required this.id, required this.name, required this.imageUrl});
}

List<Category> categories = [
  Category(
    id: 44,
    name: "Electronic Devices",
    imageUrl: "https://student.valuxapps.com/storage/uploads/categories/16893929290QVM1.modern-devices-isometric-icons-collection-with-sixteen-isolated-images-computers-periphereals-variou.jpeg",
  ),
  Category(
    id: 43,
    name: "Prevent Corona",
    imageUrl: "https://student.valuxapps.com/storage/uploads/categories/1630142480dvQxx.3658058.jpg",
  ),
  Category(
    id: 42,
    name: "Sports",
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