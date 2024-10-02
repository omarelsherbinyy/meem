import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meem/core/utils/colors.dart';
import 'package:meem/features/Auth/presentation/widgets/custom_text_form_field.dart';
class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  _EmailAndPasswordState createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool isObsecureText = true; // State variable to toggle password visibility

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          CustomTextFormField(

            prefixIcon: Icon(
              Icons.email_outlined,
              size: 24.sp,
              color: ColorsManager.gray,
            ),
            hintText: "Email",
            validator: (value) {},
          ),
          SizedBox(height: 30.h),
          CustomTextFormField(
            isObsecureText: isObsecureText,
            prefixIcon: Icon(
              Icons.lock_outline_rounded,
              size: 24.sp,
              color: ColorsManager.gray,
            ),
            suffixIcon: IconButton(
              icon: Icon(
                 isObsecureText ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                size: 24.sp,
                color: ColorsManager.gray,
              ),
              onPressed: () {
                setState(() {
                  isObsecureText = !isObsecureText; // Toggle the password visibility
                });
              },
            ),
            hintText: "Password",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter your password"; // Validation message for empty password
              }
              return null; // Return null if validation passes
            },
          ),
        ],
      ),
    );
  }
}
