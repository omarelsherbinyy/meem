import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesViewAppBar extends StatelessWidget {
  final String name;
  const CategoriesViewAppBar({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      centerTitle: true,
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          // ignore: prefer_const_constructors
          icon: Icon(Icons.arrow_back_ios_new)),
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      title: Text(
        name,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22.sp,
        ),
      ),
    );
  }
}
