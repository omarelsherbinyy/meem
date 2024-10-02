import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meem/core/utils/colors.dart';
import 'package:meem/features/Auth/presentation/widgets/custom_text_form_field.dart';

class EmailAndPassword extends StatefulWidget {
  final bool showConfirmPassword; // Control whether to show the confirm password field

  const EmailAndPassword({
    Key? key,
    this.showConfirmPassword = false, // Default is false (for login), can set to true (for registration)
  }) : super(key: key);

  @override
  _EmailAndPasswordState createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isObsecureText = true; // State variable to toggle password visibility
  bool isObsecureConfirmText = true; // State variable to toggle confirm password visibility

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  String? _emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your email";
    }
    // Simple email validation
    String pattern = r'\w+@\w+\.\w+';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return "Please enter a valid email";
    }
    return null;
  }

  String? _passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your password";
    }
    if (value.length < 6) {
      return "Password must be at least 6 characters";
    }
    return null;
  }

  String? _confirmPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please confirm your password";
    }
    if (value != _passwordController.text) {
      return "Passwords do not match";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // Email field
          CustomTextFormField(
            controller: _emailController,
            prefixIcon: Icon(
              Icons.email_outlined,
              size: 24.sp,
              color: ColorsManager.gray,
            ),
            hintText: "Email",
            validator: _emailValidator,
          ),
          SizedBox(height: 22.h),

          // Password field
          CustomTextFormField(
            controller: _passwordController,
            isObsecureText: isObsecureText,
            prefixIcon: Icon(
              Icons.lock_outline_rounded,
              size: 24.sp,
              color: ColorsManager.gray,
            ),
            suffixIcon: IconButton(
              icon: Icon(
                isObsecureText
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                size: 24.sp,
                color: ColorsManager.gray,
              ),
              onPressed: () {
                setState(() {
                  isObsecureText = !isObsecureText; // Toggle password visibility
                });
              },
            ),
            hintText: "Password",
            validator: _passwordValidator,
          ),

          // Conditionally show Confirm Password field
          if (widget.showConfirmPassword) ...[
            SizedBox(height: 22.h),
            CustomTextFormField(
              controller: _confirmPasswordController,
              isObsecureText: isObsecureConfirmText,
              prefixIcon: Icon(
                Icons.lock_outline_rounded,
                size: 24.sp,
                color: ColorsManager.gray,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  isObsecureConfirmText
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  size: 24.sp,
                  color: ColorsManager.gray,
                ),
                onPressed: () {
                  setState(() {
                    isObsecureConfirmText = !isObsecureConfirmText; // Toggle confirm password visibility
                  });
                },
              ),
              hintText: "Confirm Password",
              validator: _confirmPasswordValidator,
            ),
          ],
        ],
      ),
    );
  }
}
