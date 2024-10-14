import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meem/core/utils/colors.dart';
import 'package:meem/core/utils/string.dart';
import 'package:meem/core/utils/constant.dart';

import '../../../Auth/presentation/widgets/custom_bottom.dart';
import '../../../Auth/presentation/widgets/custom_text_form_field.dart';

class UserProfileView extends StatefulWidget {
  const UserProfileView({Key? key}) : super(key: key);

  @override
  _UserProfileViewState createState() => _UserProfileViewState();
}

class _UserProfileViewState extends State<UserProfileView> {
  // User data stored directly in the class
  final Map<String, dynamic> userData = {
    "id": 2015,
    "name": "Mahmoud Hatem",
    "email": "Mahmoudhatems@gmail.com",
    "phone": "01068714251",
    "points": 0,
    "credit": 0,
    "token":
        "8gw03WCdU59iOCDmrdlKXa71SAKDo94SY0SfATl0f84rxs4C1T7hRkvRwacKUmGAfkFzu2"
  };

  XFile? _image; // Variable to hold the selected image
  bool _isLoading = false; // Loading state

  @override
  void initState() {
    super.initState();
    _loadImage(); // Load the image when the view initializes
  }

  // Method to load the image path from Hive
  void _loadImage() async {
    setState(() {
      _isLoading = true; // Start loading
    });

    final box = Hive.box(Constants.tokenBox);
    final imagePath = box.get('userImagePath');

    if (imagePath != null && imagePath.isNotEmpty) {
      setState(() {
        _image = XFile(imagePath); // Load the image from Hive
      });
    } else {
      setState(() {
        _image = null; // Set to null if no image found
      });
    }

    setState(() {
      _isLoading = false; // Stop loading
    });
  }

  // Method to pick an image from the gallery
  Future<void> _pickImage() async {
    setState(() {
      _isLoading = true; // Start loading
    });

    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = pickedFile; // Update the image state
      });

      // Save the image path locally
      saveDataLocally(key: 'userImagePath', value: pickedFile.path);
    }

    setState(() {
      _isLoading = false; // Stop loading
    });
  }

  // Method to save data locally using Hive
  Future<void> saveDataLocally(
      {required String key, required String? value}) async {
    final box = Hive.box(Constants.tokenBox);
    await box.put(key, value);
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context); // Initialize ScreenUtil

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Profile",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: ColorsManager.textBlue,
              fontSize: 20.sp),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: _pickImage, // Open image picker when tapped
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 50.r,
                      backgroundImage: _image != null
                          ? FileImage(File(_image!.path))
                          : const AssetImage('assets/images/defaultavatar.jpg')
                              as ImageProvider<Object>,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 30.r,
                        width: 30.r,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: ColorsManager.white, width: 4.w),
                          shape: BoxShape.circle,
                          color: ColorsManager.mainBlue, // Blue background
                        ),
                        child: Icon(
                          Icons.edit_outlined, // Pen icon for edit
                          color: Colors.white, // White color for the icon
                          size: 16.r,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                userData['name'],
                style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.h),
              Text(userData['email']),
              SizedBox(height: 16.h),
              SizedBox(
                height: 20.h,
                child: Row(
                  children: [
                    Text(
                      "Personal Details",
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontFamily: StringManager.fontFamily,
                          fontWeight: FontWeight.bold,
                          color: ColorsManager.textBlue),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              _buildDetailSection("Email Address", userData['email']),
              _buildCustomTextFormField("Email Address", userData['email']),
              _buildDetailSection("Phone", userData['phone']),
              _buildCustomTextFormField("Phone", userData['phone']),
              _buildDetailSection("Account Holder's Name", userData['name']),
              _buildCustomTextFormField(
                  "Account Holder's Name", userData['name']),
              SizedBox(height: 16.h),
              CustomBottom(
                text: "Save",
                onPressed: () {
                  // Save button action Ya 3maaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaar
                },
              ),
              if (_isLoading) // Show loading indicator if loading
                const Center(
                  child: CircularProgressIndicator(
                    color: ColorsManager.mainBlue, // Loading indicator color
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailSection(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20.h,
          child: Row(
            children: [
              Text(
                title,
                style:
                    TextStyle(fontSize: 12.sp, color: ColorsManager.textBlue),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCustomTextFormField(String label, String value,
      {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: CustomTextFormField(
        hintText: label,
        controller: TextEditingController(text: value),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '$label cannot be empty';
          }
          return null;
        },
      ),
    );
  }
}
