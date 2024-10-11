import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({
    super.key,
    required this.categories,
  });

  final List<Map<String, String>> categories;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {}, // Nav for category list
      child: Container(
        height: 120.h,
        // Height is scaled using ScreenUtil
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        // Use w for width and h for height
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(8.sp), // Adjust padding to be responsive
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundImage:
                    NetworkImage(categories[index]['imageUrl']!),
                    radius: 34.r, // Use ScreenUtil for radius
                  ),
                  SizedBox(height: 8.h), // SizedBox with responsive height
                  Text(
                    categories[index]['name']!,
                    style: TextStyle(
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
final List<Map<String, String>> categories = [
  {
    'name': 'Beauty',
    'imageUrl':
    'https://m.media-amazon.com/images/M/MV5BNzA3MmE3YTgtYzA1Zi00NDBjLTlmZjAtYzY0MWU3MTZjMjdlXkEyXkFqcGc@._V1_.jpg'
  },
  {
    'name': 'Fashion',
    'imageUrl':
    'https://t4.ftcdn.net/jpg/02/62/24/31/360_F_262243135_q7xBjfg02gaeD1NVfIqHBLz3qrOMFYcw.jpg'
  },
  {
    'name': 'Kids',
    'imageUrl':
    'https://cdn.cdnparenting.com/articles/2020/08/23110028/1036459504-1024x700.webp'
  },
  {
    'name': 'Mens',
    'imageUrl':
    'https://www.nextdirect.com/nxtcms/resource/blob/6091888/698f23220d45c0cdc3c6c4e28ab8353c/linen-data.jpg'
  },
  {
    'name': 'Womens',
    'imageUrl':
    'https://img.freepik.com/premium-photo/blonde-woman-with-blonde-hair-white-tank-top_662214-104682.jpg'
  },
];

