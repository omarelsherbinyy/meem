import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/utils/string.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;

  // Dummy data for categories and products
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


  final List<Map<String, String>> products = [
    {
      'name': 'IWC Watch',
      'price': '65',
      'imageUrl':
          'https://images-cdn.ubuy.ae/6340059bd6d2d86e2476d684-iwc-ingenieur-dual-time-titanium.jpg',
      'description': 'A luxury watch with precision engineering.',
      'rating': '4.5'
    },
    {
      'name': 'Labbin Sneakers',
      'price': '35',
      'imageUrl':
          'https://fashion-section-website-media.s3.ap-south-1.amazonaws.com/media/2023/01/28165228/D-2.jpg',
      'description': 'Comfortable and stylish sneakers for everyday use.',
      'rating': '4.2'
    },
    {
      'name': 'Suit',
      'price': '150',
      'imageUrl':
          'https://tie-house.com/wp-content/uploads/2023/08/00000435.jpg',
      'description': 'Elegant suit for formal occasions.',
      'rating': '4.8'
    },
    {
      'name': 'HRX Sneakers',
      'price': '249',
      'imageUrl':
          'https://media.vogue.in/wp-content/uploads/2018/08/11520405637462-HRX-by-Hrithik-Roshan-Women-Black-Running-Shoes-6951520405637271-1.jpg',
      'description': 'High-performance sneakers for athletic wear.',
      'rating': '4.7'
    },
  ];

  // Search Bar
  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 8.sp),
        padding: EdgeInsets.symmetric(horizontal: 12.sp),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.075),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 1),
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.sp),
        ),
        child: Row(
          children: [
            Icon(Icons.search_outlined, color: ColorsManager.lightGray),
            Expanded(
              child: TextField(
                style: TextStyle(
                  fontSize: 15.sp,
                  fontFamily: StringManager.fontFamily,
                  fontWeight: FontWeight.normal,
                  color: ColorsManager.lightGray,
                ),
                decoration: InputDecoration(
                    hintText: ' Search any product', border: InputBorder.none),
              ),
            ),
            Icon(Icons.mic_none_rounded, color: ColorsManager.lightGray),
          ],
        ),
      ),
    );
  }

// Categories List
  Widget _buildCategoriesList() {
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

  Widget _buildBannerSlider() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200.h, // Adjust the height based on your design
        autoPlay: true,
        enlargeCenterPage: true,
        aspectRatio: 16 / 9,
        autoPlayInterval: Duration(seconds: 3),
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
                      return _buildShimmerBanner(); // Show shimmer while loading
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

// Shimmer effect for loading banners
  Widget _buildShimmerBanner() {
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




  Widget _buildDealsOfDay() {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: ColorsManager.mainBlue),
        height: 65.h,
        padding: EdgeInsets.symmetric(horizontal: 8.sp),
        margin: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 8.sp),
        child: ListTile(
          title: Text(
            "Deals Of To Day",
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.normal,
              color: ColorsManager.white,
            ),
          ),
          subtitle: Row(
            children: [
              Icon(Icons.timer_outlined, color: ColorsManager.white),
              SizedBox(width: 4.sp),
              // Space between icon and text
              Text(
                "22h 55m 20s", // Placeholder for timer text
                style: TextStyle(
                  fontSize: 12.sp,
                  fontFamily: StringManager.fontFamily,
                  fontWeight: FontWeight.normal,
                  color: ColorsManager.white,
                ),
              ),
            ],
          ),
          trailing: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_forward_outlined,
                color: ColorsManager.white,
                size: 28.sp,
              )),
        ));
  }

  // Product Listings with detailed cards
  Widget _buildProductListings(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {},
                child: Text("View all"),
              ),
            ],
          ),
        ),
        Container(
          height: 300.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.symmetric(horizontal: 8),
                child: Container(
                  width: 200.w,
                  padding: EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        products[index]['imageUrl']!,
                        height: 120.h,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        products[index]['name']!,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        products[index]['description']!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.yellow, size: 16.w),
                          SizedBox(width: 4.w),
                          Text(
                            products[index]['rating']!,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "\$${products[index]['price']}",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: ColorsManager.mainBlue,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: ColorsManager.mainBlue,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 8),
                            ),
                            child: Text(
                              "Add",
                              style: TextStyle(fontSize: 14.sp),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  // Bottom Navigation Bar
  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: 'Profile',
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.white,
      bottomNavigationBar: _buildBottomNavigationBar(),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              pinned: false,
              backgroundColor: Colors.white,
              elevation: 0,
              leading: Icon(Icons.menu_outlined, color: Colors.black),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/cart logo.png', height: 40),
                  Text(
                    "meem",
                    style: TextStyle(
                      fontSize: 26.sp,
                      fontFamily: StringManager.fontFamily,
                      fontWeight: FontWeight.bold,
                      color: ColorsManager.mainBlue,
                    ),
                  ),
                ],
              ),
              actions: [
                IconButton(
                  icon:
                      Icon(Icons.account_circle_outlined, color: Colors.black),
                  onPressed: () {},
                ),
              ],
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  _buildSearchBar(),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    child: Row(
                      children: [
                        Text(
                          "All Featured",
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontFamily: StringManager.fontFamily,
                            fontWeight: FontWeight.w600,
                            color: ColorsManager.textBlue,
                          ),
                        ),
                      ],
                    ),
                  ),

                  _buildCategoriesList(), // The Circles for Category
                  _buildBannerSlider(),
                  _buildDealsOfDay(),

                  _buildProductListings("Trending"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
