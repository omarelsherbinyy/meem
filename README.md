# Meem - E-commerce App

*Meem* is a comprehensive e-commerce application developed using Flutter as part of the DEPI graduation project. The app offers a modern and user-friendly interface for browsing products, managing a shopping cart, and exploring various categories. Our team of five has designed this app with a focus on delivering a seamless shopping experience.

## Table of Contents
- [Overview](#overview)
- [Features](#features)
- [Architecture and Code Structure](#architecture-and-code-structure)
- [Technology Stack](#technology-stack)
- [Packages Used](#packages-used)
- [Installation](#installation)
- [Contributors](#contributors)
- [License](#license)

## Overview
Meem provides an intuitive platform for users to explore different products, manage cart items, and engage in a seamless shopping journey. Although the app does not currently include a checkout process or secure user authentication, it lays the groundwork for future enhancements with features like offline data access, caching, and efficient product management.

## Features
- *User Authentication*: Supports login and registration functionalities, including saving user tokens for session management.
- *Product Browsing*: Allows users to browse and search for products across various categories.
- *Cart Management*: Users can add or remove items from the shopping cart, with updates reflected in real-time.
- *Category Exploration*: Provides a categorized view of products, enabling users to filter products by category.
- *User Profile Management*: Allows updating user information like name, email, and phone.
- *Offline Access*: Uses local storage for offline data access.
- *Responsive Design*: Optimized for various screen sizes using flutter_screenutil.
- *Smooth Animations*: Enhances user experience with Lottie animations and shimmering effects for loading states.

## Architecture and Code Structure
The project follows a clean architecture, using separate layers for data, domain, and presentation. The architecture includes:
- *Data Layer*: Handles API interactions and data caching using remote data sources.
  - AuthRemoteDataSource, CartRemoteDataSource, and HomeDataSource are used for authentication, cart management, and product data retrieval respectively.
- *Presentation Layer*: Manages the app's UI using widgets and screens like CategoriesView for displaying categorized products.
- *Models*: Includes models for managing data throughout the app, such as AuthModel, ProductModel, UserInfoModel, CategoryModel, and PosterModel.
- *Utilities*: Core functionalities like saving tokens and API endpoint management are abstracted for easier code maintenance.

### Example Code Snippets
1. *Authentication Implementation*
   - Login and Registration are managed using AuthRemoteDataSource and AuthRemoteDataSourceImpl:
     dart
     Future<AuthModel> login({required String email, required String password}) async {
       Map<String, dynamic> jsonData = await apiConsumer.post(
           endPoint: EndPoints.login,
           bodyData: {"email": email, "password": password},
           isFormData: true);
       AuthModel authModel = AuthModel.fromJson(jsonData);
       await saveToken(value: authModel.data?.token);
       return authModel;
     }
     
2. *Fetching Products*
   - Products are retrieved through the HomeDataSourceImpl class:
     dart
     Future<List<ProductModel>> getProducts() async {
       Map<String, dynamic> jsonData =
           await apiConsumer.get(endPoint: EndPoints.home);
       List<dynamic> results = jsonData["data"]["products"];
       List<ProductModel> products = [];
       for (var productData in results) {
         products.add(ProductModel.fromJson(productData));
       }
       return products;
     }
     

## Technology Stack
- *Flutter*: Utilized for developing the app on multiple platforms including Android, iOS, and web.
- *Dart*: The programming language used for Flutter development.
- *Hive*: Manages local storage for offline capabilities.
- *Flutter Bloc*: Manages state across the app with a clean architecture approach.

## Packages Used

1. *[awesome_snackbar_content](https://pub.dev/packages/awesome_snackbar_content)*: Provides styled snackbars for displaying alerts.
2. *[cached_network_image](https://pub.dev/packages/cached_network_image)*: Caches images to improve performance.
3. *[carousel_slider](https://pub.dev/packages/carousel_slider)*: Used for creating carousels to display featured products.
4. *[flutter_screenutil](https://pub.dev/packages/flutter_screenutil)*: Facilitates responsive layouts for various screen sizes.
5. *[flutter_bloc](https://pub.dev/packages/flutter_bloc)*: Enables state management using the Bloc pattern.
6. *[dio](https://pub.dev/packages/dio)*: A powerful HTTP client for network requests.
7. *[lottie](https://pub.dev/packages/lottie)*: For animations that enhance the visual appeal of the app.
8. *[shimmer](https://pub.dev/packages/shimmer)*: Displays shimmering effects while content is loading.

## Installation
To run the Meem app locally, follow these steps:

1. *Clone the repository*:
   ```bash
   git clone https://github.com/your-username/meem.git
   cd meem
