import 'package:flutter/material.dart';

class ThirdSplashScreen extends StatelessWidget {
  const ThirdSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/splash3.png'),
            const Text(
              textAlign: TextAlign.center,
              'Get Your Order',
              style: TextStyle(
                color: Color(0xFF133B5C),
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w800,
                fontSize: 24,
              ),
            ),
            const Text(
                textAlign: TextAlign.center,
                'Your order is on the way! Track, receive, and unwrap your style. Get ready to elevate your look.',
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
