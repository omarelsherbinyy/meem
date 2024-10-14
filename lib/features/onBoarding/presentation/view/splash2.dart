import 'package:flutter/material.dart';

class SecondSplashScreen extends StatelessWidget {
  const SecondSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/splash2.png'),
            const Text(
              textAlign: TextAlign.center,
              'Make Payment',
              style: TextStyle(
                color: Color(0xFF133B5C),
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w800,
                fontSize: 24,
              ),
            ),
            const Text(
                textAlign: TextAlign.center,
                'Secure your style with ease. Fast, simple, and safe payments for a seamless shopping experience. Own it now.',
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
