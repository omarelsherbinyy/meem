import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  _OnboardingViewState createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "title": "Choose Products",
      "subtitle": "Discover bold, trendsetting products. Swipe, choose, and elevate your style with every click. Your perfect picks await.",
      "image": "assets/images/splash1.png"
    },
    {
      "title": "Make Payment",
      "subtitle": "Secure your style with ease. Fast, simple, and safe payments for a seamless shopping experience. Own it now.",
      "image": "assets/images/splash2.png"
    },
    {
      "title": "Get Your Order",
      "subtitle": "Your order is on the way! Track, receive, and unwrap your style. Get ready to elevate your look.",
      "image": "assets/images/splash3.png"
    }
  ];

  void _onNextPressed() {
    if (_currentPage < onboardingData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.of(context).pushReplacementNamed('/home');
    }
  }

  void _onPrevPressed() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _onSkipPressed() {
    Navigator.of(context).pushReplacementNamed('/SignUp');
  }

  @override
  Widget build(BuildContext context) {
    const Color darkBlueColor = Color(0xFF133B5C);

    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.0.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: (_currentPage + 1).toString(),
                            style: const TextStyle(
                              color: darkBlueColor,
                              fontFamily: 'Montserrat',
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextSpan(
                            text: "/3",
                            style: TextStyle(
                              color: Color(0xFFA0A0A1),
                              fontFamily: 'Montserrat',
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: TextButton(
                      onPressed: _onSkipPressed,
                      child: const Text(
                        "Skip",
                        style: TextStyle(
                          color: darkBlueColor,
                          fontFamily: 'Montserrat',
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                itemCount: onboardingData.length,
                itemBuilder: (context, index) => OnboardingContent(
                  title: onboardingData[index]['title']!,
                  subtitle: onboardingData[index]['subtitle']!,
                  image: onboardingData[index]['image']!,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SmoothPageIndicator(
                      controller: _pageController,
                      count: onboardingData.length,
                      effect: ExpandingDotsEffect(
                        activeDotColor: darkBlueColor,
                        dotColor: Colors.grey.shade300,
                        dotHeight: 10.0,
                        dotWidth: 10.0,
                        expansionFactor: 2,
                        spacing: 5.0,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (_currentPage == 0)
                          const SizedBox(width: 50)
                        else
                          TextButton(
                            onPressed: _onPrevPressed,
                            child: const Text(
                              "Prev",
                              style: TextStyle(
                                color: Color(0xFFC4C4C4),
                                fontFamily: 'Montserrat',
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        TextButton(
                          onPressed: _onNextPressed,
                          child: Text(
                            _currentPage < onboardingData.length - 1
                                ? "Next"
                                : "Get Started",
                            style: const TextStyle(
                              color: Color(0xFF38B6FF),
                              fontFamily: 'Montserrat',
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingContent extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;

  const OnboardingContent({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image, height: 400, fit: BoxFit.contain),
          const SizedBox(height: 40),
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: Color(0xFF133B5C),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFFA8A8A9),
            ),
          ),
        ],
      ),
    );
  }
}
