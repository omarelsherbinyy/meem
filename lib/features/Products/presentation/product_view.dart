import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meem/core/utils/colors.dart';

import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key});

  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  final Map<String, dynamic> productData = {
    "id": 52,
    "price": 25000,
    "old_price": 30000,
    "discount": 0,
    "image":
        "https://student.valuxapps.com/storage/uploads/products/1615440322npwmU.71DVgBTdyLL._SL1500_.jpg",
    "name": "Apple iPhone 12 Pro Max 256GB 6 GB RAM, Pacific Blue",
    "description":
        "DISPLAY\r\nSize: 6.7 inches\r\nResolution: 2778 x 1284 pixels, 458 PPI\r\nTechnology: OLED\r\nScreen-to-body: 87.45 %\r\nPeak brightness: 1200 cd/m2 (nit)\r\nFeatures: HDR video support, Oleophobic coating, Scratch-resistant glass (Ceramic Shield), Ambient light sensor, Proximity sensor\r\nHARDWARE\r\nSystem chip: Apple A14 Bionic\r\nProcessor: Hexa-core, 64-bit, 5 nm\r\nGPU: Yes\r\nRAM: 6GB LPDDR5\r\nInternal storage: 128GB (NVMe), not expandable\r\nDevice type: Smartphone\r\nOS: iOS (14.x)\r\nBATTERY\r\nType: Li - Ion, Not user replaceable\r\nCharging: USB Power Delivery, Qi wireless charging, MagSafe wireless charging\r\nMax charge speed: Wireless: 15.0W\r\nCAMERA\r\nRear: Triple camera\r\nMain camera: 12 MP (OIS, PDAF)\r\nSpecifications: Aperture size: F1.6; Focal length: 26 mm; Pixel size: 1.7 μm\r\nSecond camera: 12 MP (Telephoto, OIS, PDAF)\r\nSpecifications: Optical zoom: 2x; Aperture size: F2.2; Focal Length: 65 mm\r\nThird camera: 12 MP (Ultra-wide)\r\nSpecifications: Aperture size: F2.4; Focal Length: 13 mm\r\nVideo recording: 3840x2160 (4K UHD) (60 fps), 1920x1080 (Full HD) (240 fps), 1280x720 (HD) (30 fps)\r\nFeatures: OIS, HDR, Time-lapse video, Continuous autofocus, Picture-taking during video recording, Video light\r\nFront: 12 MP (Time-of-Flight (ToF), EIS, HDR, Slow-motion videos)\r\nVideo capture: 3840x2160 (4K UHD) (60 fps)\r\nDESIGN\r\nDimensions: 6.33 x 3.07 x 0.29 inches (160.84 x 78.09 x 7.39 mm)\r\nWeight: 8.03 oz (228.0 g)\r\nMaterials: Back: Glass; Frame: Stainless steel\r\nMaterials & Colors: Pacific Blue\r\nResistance: Water, Splash, Dust; IP68\r\nBiometrics: 3D Face unlock\r\nKeys: Left: Volume control, Other; Right: Lock/Unlock key\r\nCELLULAR\r\n5G: n1, n2, n3, n5, n7, n8, n12, n20, n25, n28, n38, n40, n41, n66, n71, n77, n78, n79, n260, n261, Sub-6, mmWave\r\nLTE (FDD): Bands 1(2100), 2(1900), 3(1800), 4(AWS-1), 5(850), 7(2600), 8(900), 12(700 a), 13(700 c), 14(700 PS), 17(700 b), 18(800 Lower), 19(800 Upper), 20(800 DD), 25(1900+), 26(850+), 28(700 APT), 29(700 d), 30(2300 WCS), 32(1500 L-band), 66(AWS-3), 71(600)\r\nLTE (TDD): Bands 34(2000), 38(2600), 39(1900+), 40(2300), 41(2600+), 42(3500), 46, 48(3600)\r\nUMTS: 850, 900, 1700/2100, 1900, 2100 MHz\r\nData Speed: LTE-A, HSDPA+ (4G) 42.2 Mbit/s, HSUPA 5.76 Mbit/s, UMTS\r\nDual SIM: Yes\r\nSIM type: Nano SIM, eSIM\r\nHD Voice: Yes\r\nVoLTE: Yes\r\nMULTIMEDIA\r\nHeadphones: No 3.5mm jack\r\nSpeakers: Earpiece, Loudspeaker\r\nFeatures: Dolby Atmos\r\nScreen mirroring: Wireless screen share\r\nAdditional microphone(s): for Noise cancellation\r\nCONNECTIVITY & FEATURES\r\nBluetooth: 5.0\r\nWi-Fi: 802.11 a, b, g, n, ac, ax (Wi-Fi 6), dual-band; MIMO, Wi-Fi Direct, Hotspot\r\nUSB: Lightning\r\nFeatures: Charging, Headphones port\r\nLocation: GPS, A-GPS, Glonass, Galileo, BeiDou, QZSS, Cell ID, Wi-Fi positioning\r\nSensors: Accelerometer, Gyroscope, Compass, Barometer, LiDAR scanner\r\nOther: NFC, UMA (Wi-Fi Calling)\r\nHearing aid compatible: M3, T4\r\nBrand : Apple\r\nColor : Pacific Blue\r\nOperating System Type : iOS\r\nStorage Capacity : 128GB\r\nNumber Of SIM : Single SIM & E-SIM\r\nRear Camera Resolution : 12 megapixels\r\nMobile Phone Type : Mobile Phone\r\nCellular Network Technology : 5G\r\nChipset manufacturer : Apple\r\nDisplay Size (Inch) : 6.7 inches\r\nModel Number : iPhone 12 Pro Max\r\nBattery Capacity in mAh : 3,687mAh\r\nFast Charge : Yes\r\nMemory RAM : 6 GB",
    "in_favorites": false,
    "in_cart": true,
    "images": [
      "https://student.valuxapps.com/storage/uploads/products/1615440322UAwSF.81KcqNGQIsL._SL1500_.jpg",
      "https://student.valuxapps.com/storage/uploads/products/1615440322UjY4o.71DVgBTdyLL._SL1500_.jpg"
    ]
  };

  bool isDescriptionExpanded = false;

  double calculateDiscountPercentage(dynamic oldPrice, dynamic newPrice) {
    if (oldPrice > newPrice) {
      return ((oldPrice.toDouble() - newPrice.toDouble()) /
              oldPrice.toDouble()) *
          100;
    }
    return 0;
  }

  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose(); // Dispose of the PageController when done
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double discountPercentage = calculateDiscountPercentage(
        productData['old_price'], productData['price']);

    return Scaffold(
      backgroundColor: ColorsManager.white,
      appBar: AppBar(
        backgroundColor: ColorsManager.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart_outlined, color: Colors.black),
            onPressed: () {
              // Cart action TO Carrrrrrrrrrrrrrrrrrt
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(18.sp),
        child: ListView(
          children: [
            // Main Product Image with Carousel
            Column(
              children: [
                SizedBox(
                  height: 220.h, // Adjust the height as needed
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: productData['images'].length,
                    itemBuilder: (context, index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(12.r),
                        child: Image.network(
                          productData["images"][index],
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                color: Colors.white,
                              ),
                            );
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey[300],
                              child: const Center(child: Icon(Icons.error)),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),

                // Dots Indicator under the images within the card
                SizedBox(height: 10.h),
                // Add spacing between the images and dots
                SmoothPageIndicator(
                  controller: _pageController, // Controller for PageView
                  count: productData['images'].length, // Number of dots
                  effect: ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    activeDotColor: Colors.blue,
                    dotHeight: 8.0.h,
                    dotWidth: 8.0.w,
                    spacing: 5.0.sp, // Spacing between dots
                  ),
                ),
              ],
            ),

            SizedBox(height: 16.h),

            // Product Name
            Text(
              productData['name'],
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.h),

            // Ratings and Reviews Count
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber, size: 18.sp),
                Icon(Icons.star, color: Colors.amber, size: 18.sp),
                Icon(Icons.star, color: Colors.amber, size: 18.sp),
                Icon(Icons.star, color: Colors.amber, size: 18.sp),
                Icon(Icons.star_half, color: Colors.amber, size: 18.sp),
                SizedBox(width: 8.w),
                const Text("56,890 reviews"),
              ],
            ),
            SizedBox(height: 8.h),

            // Price and Discount Information
            Row(
              children: [
                Text(
                  "EGP ${productData['price']}",
                  style: TextStyle(
                    fontSize: 22.sp,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 10.h),
                if (productData['old_price'] != productData['price'])
                  Text(
                    "EGP ${productData['old_price']}",
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                SizedBox(width: 10.w),
                if (discountPercentage > 0)
                  Text(
                    "${discountPercentage.toStringAsFixed(0)}% Off",
                    style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              ],
            ),
            SizedBox(height: 16.h),

            // Product Details
            Text(
              "Product Details",
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.h),

            // Expandable Product Description
            GestureDetector(
              onTap: () {
                setState(() {
                  isDescriptionExpanded = !isDescriptionExpanded;
                });
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isDescriptionExpanded
                        ? productData['description']
                        : (productData['description'].length > 100
                            ? productData['description'].substring(0, 100) +
                                '...'
                            : productData['description']),
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    isDescriptionExpanded ? "Show Less" : "Show More",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),

            // Buttons (Add to Cart, Buy Now)
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0.r),
                    // Rounded corners
                    gradient: const LinearGradient(
                      colors: [Colors.deepPurpleAccent, Colors.blue],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      // To apply the container gradient
                      shadowColor: Colors.transparent,
                      padding: EdgeInsets.symmetric(
                          vertical: 12.0.sp, horizontal: 20.0.sp),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    icon: Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.white,
                      size: 26.sp,
                    ), // Hand icon
                    label: Text(
                      "Go To cart",
                      style: TextStyle(color: Colors.white, fontSize: 20.sp),
                    ),
                    onPressed: () {
                      // Add your onPressed logic here BUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUYYYYYYYYYYYYYYYYYYYYYYY
                    },
                  ),
                ),
                SizedBox(
                  width: 8.w,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0.r),
                    // Rounded corners
                    gradient: const LinearGradient(
                      colors: [Colors.green, Colors.greenAccent],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      padding: EdgeInsets.symmetric(
                          vertical: 12.0.sp, horizontal: 20.0.sp),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0.sp),
                      ),
                    ),
                    icon: Icon(
                      Icons.touch_app,
                      color: Colors.white,
                      size: 26.sp,
                    ),
                    // Hand icon
                    label: Text(
                      "Buy Now",
                      style: TextStyle(color: Colors.white, fontSize: 20.sp),
                    ),
                    onPressed: () {
                      // Add your onPressed logic here BUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUYYYYYYYYYYYYYYYYYYYYYYY
                    },
                  ),
                )
              ],
            ),
            SizedBox(height: 16.h),

            // Delivery Information
            Container(
              padding: EdgeInsets.all(12.sp),
              decoration: BoxDecoration(
                color: Colors.pink.shade50,
                borderRadius: BorderRadius.circular(12.sp),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(
                    Icons.delivery_dining,
                    color: Colors.red,
                    size: 26.sp,
                  ),
                  SizedBox(width: 8.w),
                  const Text(
                    "Delivery in \n1 Within Hour",
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),

            // Similar Products Section This Will Rreplaced By Product Cardddddddddddddddddddddddddddddddddddddd
            Text(
              "Similar To",
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.h),
            SizedBox(
              height: 200.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 2,
                // Replace with the actual number of similar products
                itemBuilder: (context, index) {
                  return Container(
                    width: 150.w,
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      children: [
                        Image.network(
                          productData['image'],
                          height: 120.h,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          "Nike Sneakers",
                          style: TextStyle(fontSize: 14.sp),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          "\EGP 1,900",
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
