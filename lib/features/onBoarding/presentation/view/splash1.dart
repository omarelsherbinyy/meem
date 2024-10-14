import 'package:flutter/material.dart';

class FirstSplashScreen extends StatelessWidget {
  const FirstSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/splash1.png'),
            const Text(
              textAlign: TextAlign.center,
              'Choose Products',
              style: TextStyle(
                color: Color(0xFF133B5C),
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w800,
                fontSize: 24,
              ),
            ),
            const Text(
                textAlign: TextAlign.center,
                'Discover bold, trendsetting products. Swipe, choose, and elevate your style with every click. Your perfect picks await.',
                style: TextStyle(
                  color: Color(0xFFA8A8A9),
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                )),
          ],
        ),
      ),
    );
  }
}
