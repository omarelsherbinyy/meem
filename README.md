# Meem - E-commerce App

*Meem* is a Flutter-based e-commerce application developed as part of the DEPI graduation project. Our team of five has collaborated to create an app that offers a seamless shopping experience, complete with engaging features, modern UI, and responsive design.

## Table of Contents
- [Overview](#overview)
- [Features](#features)
- [Technology Stack](#technology-stack)
- [Packages Used](#packages-used)
- [Installation](#installation)
- [Contributors](#contributors)
- [License](#license)

## Overview
Meem is an e-commerce app that allows users to browse products, manage their shopping carts, and explore categories effortlessly. The app leverages state-of-the-art Flutter technologies to deliver a modern and visually appealing interface. Although the app does not currently feature a checkout system or secure authentication, it provides offline data access and smooth user interactions.

## Features
- *Product Browsing:* Explore a variety of products across different categories.
- *Cart Management:* Add or remove items from the cart with ease.
- *Offline Access:* Save data locally using Hive for a seamless offline experience.
- *Animated UI:* Leverage Lottie animations for dynamic interactions.
- *Page Navigation:* Use a smooth page indicator and carousel sliders for an engaging browsing experience.
- *Responsiveness:* Optimized layout for different screen sizes with Flutter ScreenUtil.
- *Caching:* Efficient image loading and caching for improved performance.

## Technology Stack
- *Flutter*: Used for cross-platform development, ensuring a consistent experience across Android, iOS, and web.
- *Dart*: The primary programming language for Flutter.
- *Hive*: Local storage for offline access and caching.
- *Flutter Bloc*: For state management, allowing a clear separation between business logic and UI.

## Packages Used

1. *[awesome_snackbar_content](https://pub.dev/packages/awesome_snackbar_content)*: For enhanced Snackbar notifications, offering visually appealing alerts for user actions.

2. *[cached_network_image](https://pub.dev/packages/cached_network_image)*: Caches images to reduce load times and enhance performance.

3. *[carousel_slider](https://pub.dev/packages/carousel_slider)*: Creates image and content carousels for showcasing featured products.

4. *[cupertino_icons](https://pub.dev/packages/cupertino_icons)*: Provides iOS-style icons for consistent cross-platform UI design.

5. *[dartz](https://pub.dev/packages/dartz)*: Adds functional programming features for safer error handling.

6. *[dio](https://pub.dev/packages/dio)*: A versatile HTTP client for handling network requests and integrating with backend services.

7. *[flutter_bloc](https://pub.dev/packages/flutter_bloc)*: Utilized for state management, offering a scalable architecture for app development.

8. *[flutter_launcher_icons](https://pub.dev/packages/flutter_launcher_icons)*: Automates the generation of launcher icons across multiple platforms.

9. *[flutter_product_card](https://pub.dev/packages/flutter_product_card)*: Simplifies product card layouts for consistent UI components.

10. *[flutter_screenutil](https://pub.dev/packages/flutter_screenutil)*: Aids in developing responsive layouts for various device screen sizes.

11. *[flutter_svg](https://pub.dev/packages/flutter_svg)*: Allows the use of SVG images, providing high-quality vector graphics.

12. *[get_it](https://pub.dev/packages/get_it)*: A service locator for dependency injection, enabling easy access to shared services.

13. *[google_nav_bar](https://pub.dev/packages/google_nav_bar)*: Adds a customizable bottom navigation bar for intuitive navigation.

14. *[hive](https://pub.dev/packages/hive)* & *[hive_flutter](https://pub.dev/packages/hive_flutter)*: Provide local data storage for offline functionality.

15. *[image_picker](https://pub.dev/packages/image_picker)*: Allows users to select images from the device gallery or camera.

16. *[lottie](https://pub.dev/packages/lottie)*: Integrates Lottie animations for dynamic, vector-based visual effects.

17. *[shimmer](https://pub.dev/packages/shimmer)*: Displays shimmering loading placeholders to enhance the user experience while fetching data.

18. *[smooth_page_indicator](https://pub.dev/packages/smooth_page_indicator)*: Adds smooth, customizable page indicators.

## Installation
To run the Meem app locally, follow these steps:

1. *Clone the repository*:
   ```bash
   git clone https://github.com/your-username/meem.git
   cd meem
