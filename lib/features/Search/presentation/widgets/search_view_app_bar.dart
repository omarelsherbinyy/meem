import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchViewAppBar extends StatelessWidget {
  const SearchViewAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      centerTitle: true,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      title: Text(
        'Search',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24.sp,
        ),
      ),
    );
  }
}
