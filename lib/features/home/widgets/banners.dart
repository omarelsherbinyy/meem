


import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

Widget buildBannerSlider() {
  return CarouselSlider(
    options: CarouselOptions(
      height: 200.h, // Adjust the height based on your design
      autoPlay: true,
      enlargeCenterPage: true,
      aspectRatio: 16 / 9,
      autoPlayInterval:const Duration(seconds: 3),
      viewportFraction: 0.9, // Adjust to show part of the next banner
    ),
    items: banners.map((banner) {
      return Builder(
        builder: (BuildContext context) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 5.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                banner['image'],
                fit: BoxFit.cover,
                width: double.infinity,
                loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child; // Image is fully loaded
                  } else {
                    return ShimmerBanner(); // Show shimmer while loading
                  }
                },
              ),
            ),
          );
        },
      );
    }).toList(),
  );
}


class ShimmerBanner extends StatelessWidget {
  const ShimmerBanner({
    super.key,
  });

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
  {
    "id": 11,
    "image": "https://student.valuxapps.com/storage/uploads/banners/1689106904Mzsmc.photo_2023-07-11_23-08-24.png",
    "category": null,
    "product": null
  },
  {
    "id": 12,
    "image": "https://student.valuxapps.com/storage/uploads/banners/1689106848R4Nxl.photo_2023-07-11_23-08-19.png",
    "category": null,
    "product": null
  },
  {
    "id": 17,
    "image": "https://student.valuxapps.com/storage/uploads/banners/1689106932hsRxm.photo_2023-07-11_23-07-53.png",
    "category": null,
    "product": null
  },
  {
    "id": 19,
    "image": "https://student.valuxapps.com/storage/uploads/banners/1689110348KHwtl.sales-abstract-landing-page-with-photo_52683-28304 (1) (2).png",
    "category": null,
    "product": null
  },
  {
    "id": 23,
    "image": "https://student.valuxapps.com/storage/uploads/banners/1689108526i90RV.online-shopping-banner-template_23-2148764566 (1).png",
    "category": null,
    "product": null
  },
  {
    "id": 24,
    "image": "https://student.valuxapps.com/storage/uploads/banners/1689108648Avc1g.banner-template-with-summer-sale_23-2148515754 (1).png",
    "category": null,
    "product": null
  },
  {
    "id": 26,
    "image": "https://student.valuxapps.com/storage/uploads/banners/1689107104Ezc0d.photo_2023-07-11_23-07-59.png",
    "category": null,
    "product": null
  },
  {
    "id": 27,
    "image": "https://student.valuxapps.com/storage/uploads/banners/1689106762vIpcq.photo_2023-07-11_23-07-38.png",
    "category": null,
    "product": null
  },
  {
    "id": 28,
    "image": "https://student.valuxapps.com/storage/uploads/banners/1689106805161JH.photo_2023-07-11_23-07-43.png",
    "category": null,
    "product": null
  },
  {
    "id": 29,
    "image": "https://student.valuxapps.com/storage/uploads/banners/1689108280StVEo.cyber-monday-banner-template_23-2148748266 (1).png",
    "category": null,
    "product": null
  }
];