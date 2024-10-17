import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:meem/core/utils/string.dart';
import '../../../../core/utils/colors.dart';
import '../../../Auth/presentation/widgets/custom_bottom.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  _CartViewState createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  List<CartItem> cartItems = [
    CartItem(
      id: 5661,
      quantity: 1,
      product: Product(
        id: 55,
        price: 5661,
        oldPrice: 0,
        discount: 0,
        image:
            "https://student.valuxapps.com/storage/uploads/products/1615442168bVx52.item_XXL_36581132_143760083.jpeg",
        name: "Apple MacBook Pro",
        description: "Experience high performance with the Apple MacBook Pro.",
        images: [],
      ),
    ),
    CartItem(
      id: 5662,
      quantity: 1,
      product: Product(
        id: 53,
        price: 10230,
        oldPrice: 10230,
        discount: 45,
        image:
            "https://student.valuxapps.com/storage/uploads/products/1615440689wYMHV.item_XXL_36330138_142814934.jpeg",
        name: "JBL Xtreme 2 Bluetooth Speaker",
        description: "Portable speaker with 15 hours of playtime.",
        images: [],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    double totalAmount = calculateTotal(cartItems); // Calculate total amount

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text(
          'Shopping Cart',
          style: TextStyle(
            color: ColorsManager.textBlue,
            fontFamily: StringManager.fontFamily,
            fontWeight: FontWeight.w600,
            fontSize: 18.sp,
          ),
        ),
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.all(16.w),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  if (index < cartItems.length) {
                    final cartItem = cartItems[index];
                    final DateTime deliveryDate =
                        DateTime.now().add(const Duration(days: 2));
                    final String formattedDeliveryDate =
                        DateFormat('d MMM y').format(deliveryDate);

                    return Dismissible(
                      key: Key(cartItem.id.toString()),
                      // Unique key for each item
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) {
                        setState(() {
                          cartItems.removeAt(index);
                        });

                        // Show Awesome Snackbar
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.white,
                            content: AwesomeSnackbarContent(
                              title: 'Removed',
                              message:
                                  "${cartItem.product.name} removed from cart",
                              contentType: ContentType.success,
                            ),
                            duration: Duration(seconds: 2),
                            behavior: SnackBarBehavior.floating,
                            elevation: 0,
                            margin: EdgeInsets.all(16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        );
                      },
                      child: buildCartItem(cartItem, formattedDeliveryDate),
                    );
                  } else if (index == cartItems.length) {
                    return buildApplyCouponsSection();
                  } else if (index == cartItems.length + 1) {
                    return buildOrderPaymentDetailsSection(totalAmount);
                  } else {
                    return CustomBottom(
                      text: "Checkout",
                      onPressed: () {
                        // Handle checkout action
                      },
                    );
                  }
                },
                childCount: cartItems.length + 3, // Add sections and buttons
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCartItem(CartItem cartItem, String formattedDeliveryDate) {
    return Card(
      color: ColorsManager.white,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      margin: EdgeInsets.symmetric(vertical: 10.h),
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: Image.network(
                        cartItem.product.image,
                        height: 100.h,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Center(child: Icon(Icons.error));
                        },
                      ),
                    ),
                    if (cartItem.product.discount > 0)
                      Positioned(
                        top: 5.h,
                        left: 5.w,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 6.w, vertical: 2.h),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Text(
                            '${cartItem.product.discount}%',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cartItem.product.name,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        cartItem.product.description,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.grey,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              'EGP ${cartItem.product.price.toStringAsFixed(2)}',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.remove, size: 20.sp),
                                onPressed: () {
                                  // Decrement logic
                                },
                              ),
                              Text(
                                cartItem.quantity.toString(),
                                style: TextStyle(fontSize: 16.sp),
                              ),
                              IconButton(
                                icon: Icon(Icons.add, size: 20.sp),
                                onPressed: () {
                                  // Increment logic
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildInfoContainer('Free Shipping', Colors.green),
                buildInfoContainer(
                    'Delivery by $formattedDeliveryDate', Colors.blue),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInfoContainer(String text, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      ),
    );
  }

  Widget buildApplyCouponsSection() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: ColorsManager.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Apply Coupons',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              fontFamily: StringManager.fontFamily,
              color: ColorsManager.textBlue,
            ),
          ),
          SizedBox(height: 4.h),
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter coupon code',
                    hintStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8.w),
              ElevatedButton(
                onPressed: () {
                  // Apply coupon logic here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorsManager.mainBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                child: Text('Apply'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildOrderPaymentDetailsSection(double totalAmount) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Column(
        children: [
          buildOrderDetailRow('Subtotal', totalAmount),
          Divider(color: Colors.grey.shade300),
          buildOrderDetailRow('Total Amount', totalAmount),
        ],
      ),
    );
  }

  Widget buildOrderDetailRow(String label, double value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            fontFamily: StringManager.fontFamily,
            color: ColorsManager.textBlue,
          ),
        ),
        Text(
          'EGP ${value.toStringAsFixed(2)}',
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  double calculateTotal(List<CartItem> items) {
    double total = 0;
    for (var item in items) {
      total += item.product.price * item.quantity;
    }
    return total;
  }
}

class CartItem {
  final int id;
  final int quantity;
  final Product product;

  CartItem({
    required this.id,
    required this.quantity,
    required this.product,
  });
}

class Product {
  final int id;
  final double price;
  final double oldPrice;
  final int discount;
  final String image;
  final String name;
  final String description;
  final List<String> images;

  Product({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
    required this.images,
  });
}
