import 'dart:io';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meem/core/utils/colors.dart';
import 'package:meem/core/utils/string.dart';
import 'package:meem/core/utils/constant.dart';
import 'package:meem/features/user_profile/presentation/cubits/get_user_info_cubit/get_user_info_cubit.dart';
import 'package:shimmer/shimmer.dart';
import '../../../Auth/presentation/widgets/custom_bottom.dart';
import '../../../Auth/presentation/widgets/custom_text_form_field.dart';

class UserProfileView extends StatefulWidget {
  const UserProfileView({super.key});

  @override
  _UserProfileViewState createState() {
    return _UserProfileViewState();
  }
}

class _UserProfileViewState extends State<UserProfileView> {
  XFile? _image; // Variable to hold the selected image
  bool _isLoading = false; // Loading state

  @override
  void initState() {
    super.initState();
    _loadImage();
    BlocProvider.of<GetUserInfoCubit>(context)
        .getUserInfo(); // Load the image when the view initializes
  }

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
        _image = null;
      });
    }

    setState(() {
      _isLoading = false; // End loading
    });
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _isLoading = true; // Start loading
        _image = pickedFile; // Update the image state
      });

      saveDataLocally(key: 'userImagePath', value: pickedFile.path);

      setState(() {
        _isLoading = false; // End loading
      });
    }
  }

  Future<void> saveDataLocally(
      {required String key, required String? value}) async {
    final box = Hive.box(Constants.tokenBox);
    await box.put(key, value);
  }

  GlobalKey<FormState> _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context); // Initialize ScreenUtil

    return Scaffold(
      backgroundColor: ColorsManager.white,
      appBar: AppBar(
        backgroundColor: ColorsManager.white,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "Profile",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: ColorsManager.textBlue,
              fontSize: 20.sp),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: BlocConsumer<GetUserInfoCubit, GetUserInfoState>(
                  listener: (context, state) {
                    if (state is UpdateUserInfoSuccess) {
                      BlocProvider.of<GetUserInfoCubit>(context).getUserInfo();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.white,
                          content: AwesomeSnackbarContent(
                            title: 'Update',
                            message:
                                state.user.message ?? "Updated Successfully",
                            contentType: ContentType.success,
                          ),
                          duration: const Duration(seconds: 2),
                          behavior: SnackBarBehavior.floating,
                          elevation: 0,
                          margin: const EdgeInsets.all(16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      );
                    } else if (state is UpdateUserInfoFailure) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.white,
                          content: AwesomeSnackbarContent(
                            title: 'Error',
                            message: state.errorMessage,
                            contentType: ContentType.failure,
                          ),
                          duration: const Duration(seconds: 2),
                          behavior: SnackBarBehavior.floating,
                          elevation: 0,
                          margin: const EdgeInsets.all(16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is GetUserInfoSuccess) {
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: _pickImage,
                            child: Stack(
                              children: [
                                AnimatedOpacity(
                                  opacity: _isLoading ? 0.5 : 1.0,
                                  duration: const Duration(milliseconds: 300),
                                  child: CircleAvatar(
                                    radius: 50.r,
                                    backgroundImage: _image != null
                                        ? FileImage(File(_image!.path))
                                        : const AssetImage(
                                                'assets/images/defaultavatar.jpg')
                                            as ImageProvider<Object>,
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    height: 30.r,
                                    width: 30.r,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: ColorsManager.white,
                                          width: 4.w),
                                      shape: BoxShape.circle,
                                      color: ColorsManager.mainBlue,
                                    ),
                                    child: Icon(
                                      Icons.edit_outlined,
                                      color: Colors.white,
                                      size: 16.r,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            state.user.name!,
                            style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                                fontFamily: StringManager.fontFamily,
                                color: ColorsManager.textBlue),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            state.user.email!,
                            style: const TextStyle(
                                fontFamily: StringManager.fontFamily),
                          ),
                          SizedBox(height: 8.h),
                          _buildDetailSection("Account Holder's Name"),
                          SizedBox(height: 8.h),
                          _buildCustomTextFormField(
                              "Account Holder's Name",
                              state.user.name!,
                              BlocProvider.of<GetUserInfoCubit>(context)
                                  .nameController),
                          _buildDetailSection("Email Address"),
                          SizedBox(height: 8.h),
                          _buildCustomTextFormField(
                              "Email Address",
                              state.user.email!,
                              BlocProvider.of<GetUserInfoCubit>(context)
                                  .emailController),
                          _buildDetailSection("Phone"),
                          SizedBox(height: 8.h),
                          _buildCustomTextFormField(
                              "Phone",
                              state.user.phone!,
                              BlocProvider.of<GetUserInfoCubit>(context)
                                  .phoneController),
                          CustomBottom(
                            text: "Update",
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                BlocProvider.of<GetUserInfoCubit>(context)
                                    .updateUserInfo();
                              }
                            },
                          ),
                        ],
                      );
                    } else if (state is GetUserInfoFailure) {
                      return Center(
                        child: Text(
                          state.errorMessage,
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: StringManager.fontFamily,
                              color: Colors.red),
                        ),
                      );
                    } else {
                      return _buildShimmerProfile(); // Use shimmer for loading state
                    }
                  },
                ),
              ),
              _buildLoadingIndicator(), // Show loading indicator
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingIndicator() {
    return _isLoading
        ? const Center(
            child: CircularProgressIndicator(
              color: Colors.blue,
            ),
          )
        : const SizedBox.shrink();
  }

  Widget _buildDetailSection(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20.h,
          child: Row(
            children: [
              Text(
                title,
                style: TextStyle(
                    fontSize: 14.sp,
                    color: ColorsManager.textBlue,
                    fontFamily: StringManager.fontFamily,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCustomTextFormField(
      String label, String value, TextEditingController? controller) {
    return CustomTextFormField(
      hintText: label,
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '$label cannot be empty';
        }
        return null;
      },
    );
  }

  Widget _buildShimmerProfile() {
    return Column(
      children: [
        Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: CircleAvatar(
            radius: 50.r,
            backgroundColor: Colors.grey[300]!,
          ),
        ),
        SizedBox(height: 8.h),
        Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            height: 20.h,
            width: 150.w,
            color: Colors.grey[300]!,
          ),
        ),
        SizedBox(height: 8.h),
        Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            height: 15.h,
            width: 200.w,
            color: Colors.grey[300]!,
          ),
        ),
        SizedBox(height: 8.h),
        ...List.generate(3, (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                height: 50.h,
                width: double.infinity,
                color: Colors.grey[300]!,
              ),
            ),
          );
        }),
      ],
    );
  }
}
