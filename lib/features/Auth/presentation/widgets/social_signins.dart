import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meem/core/utils/colors.dart';
import 'package:meem/core/utils/string.dart';

class SocialSignIn extends StatelessWidget {
  final String textBegin;
  final String textEnd;

  const SocialSignIn({super.key, required this.textBegin, required this.textEnd});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "- OR Continue with -",
          style: TextStyle(fontSize: 16, color: Colors.grey,fontFamily: StringManager.fontFamily,fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _socialButton('assets/images/googleicon.svg' ,onTap: () {
              // Add your Google sign-in functionality here
            }),
            const SizedBox(width: 20),
            _socialButton('assets/images/appleicon.svg', onTap: () {
              // Add your Apple sign-in functionality here
            }),
            const SizedBox(width: 20),
            _socialButton('assets/images/facebookicon.svg', onTap: () {
              // Add your Facebook sign-in functionality here
            }),
          ],
        ),
        const SizedBox(height: 30),
        GestureDetector(
          onTap: () {
            // Navigate to Sign-up page
          },
          child: RichText(
            text: TextSpan(
              text: textBegin,
              style: const TextStyle(color: Colors.black, fontSize: 16,fontFamily: StringManager.fontFamily),
              children: [
                TextSpan(
                  text: textEnd,
                  style: const TextStyle(color: ColorsManager.mainPink,fontFamily: StringManager.fontFamily,fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _socialButton(String assetPath, {required Function onTap, double iconHeight =35}) {
    return GestureDetector(
      onTap: () => onTap(),
      child: CircleAvatar(
        radius: 30,
        backgroundColor: Colors.pink.withOpacity(0.1),
        child: SvgPicture.asset(
          assetPath,
          width: 30,
          height: iconHeight, // Using the parameter passed or the default 80
          // Ensure no color filter is applied
        ),
      ),
    );
  }}