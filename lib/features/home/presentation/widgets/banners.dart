import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

Widget buildBannerSlider() {
  return CarouselSlider(
    options: CarouselOptions(
      aspectRatio: 3/2,
      height: 120.h,
      autoPlay: true,
      enlargeCenterPage: true,
      autoPlayInterval: const Duration(seconds: 3),
      viewportFraction: 0.9,
      enableInfiniteScroll: true,
      autoPlayAnimationDuration: const Duration(milliseconds: 800),
    ),
    items: banners.map((banner) {
      return Builder(
        builder: (BuildContext context) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              banner['image'],
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          );
        },
      );
    }).toList(),
  );
}

class ShimmerBanner extends StatelessWidget {
  const ShimmerBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        height: 200.h,
        margin: EdgeInsets.symmetric(horizontal: 5.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

final List<Map<String, dynamic>> banners = [


  {"image": "assets/images/b0.jpg"},{"image": "assets/images/b1.jpg"},{"image": "assets/images/b2.jpg"},
  {"image": "assets/images/bannar1.jpg"},
  {"image": "assets/images/bannar2.jpg"},
  {"image": "assets/images/bannar3.jpg"},
  {"image": "assets/images/bannar4.jpg"},
  {"image": "assets/images/bannar5.jpg"},
  {"image": "assets/images/bannar6.jpg"},
  {"image": "assets/images/bannar7.jpg"},
  {"image": "assets/images/bannar8.jpg"},
];