import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/utils/string.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../../widgets/banners.dart';
import '../../widgets/categories_list.dart';
import '../../widgets/deals_of_day.dart';
import '../../widgets/populer_products_state.dart';

import '../../widgets/recently_added_products.dart';
import '../../widgets/search_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              pinned: false,
              backgroundColor: Colors.white,
              elevation: 0,
              leading: const Icon(Icons.menu_outlined, color: Colors.black),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/cart logo.png', height: 40.h),
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
                      const Icon(Icons.account_circle_outlined, color: Colors.black),
                  onPressed: () {},
                ),
              ],
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  const CustomSearchBar(),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    child: Text(
                      "All Featured",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontFamily: StringManager.fontFamily,
                        fontWeight: FontWeight.w600,
                        color: ColorsManager.textBlue,
                      ),
                    ),
                  ),
                  CategoriesList(categories: categories),
                  buildBannerSlider(),
                  const PopularProducts(),
                  const DealsOfDay(),
                  const RecentlyAddedProducts()
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: GNav(
            tabBorderRadius: 15.r,
            backgroundColor: Colors.white,
            color: Colors.grey,
            activeColor: ColorsManager.mainBlue,
            iconSize: 24.sp,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            tabs: const [
              GButton(
                icon: Icons.home_outlined,
                text: 'Home',
              ),
              GButton(
                icon: Icons.search_outlined,
                text: 'Search',
              ),
              GButton(
                icon: Icons.shopping_cart_outlined,
                text: 'Cart',
              ),
              GButton(
                icon: Icons.person_outline_rounded,
                text: 'Profile',
              ),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
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

final List<Map<String, String>> trendProducts = [
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
    'imageUrl': 'https://tie-house.com/wp-content/uploads/2023/08/00000435.jpg',
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
