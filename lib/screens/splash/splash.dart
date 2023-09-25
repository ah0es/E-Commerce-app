import 'package:flutter/material.dart';

import '../../components/defult_botton.dart';
import '../../helper/constants.dart';
import '../sign_in/login._screen.dart';

import 'components/splash_content.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static String id = 'SplashScreen';
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int currentIndex = 0;

  List<Map<String, String>> spalshData = [
    {
      'image': 'assets/images/splash_1.png',
      'text': 'Welcome to Tokoto, Let\'s shop!',
    },
    {
      'image': 'assets/images/splash_2.png',
      'text':
          'We help people contact with store\naround United State of America',
    },
    {
      'image': 'assets/images/splash_3.png',
      'text': 'We show the easy way to shop\nJust stay with home with us',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      currentIndex = value;
                    });
                  },
                  itemCount: spalshData.length,
                  itemBuilder: (context, index) => SplashContent(
                    image: spalshData[index]['image']!,
                    text: spalshData[index]['text']!,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          spalshData.length, (index) => buildDot(index: index)),
                    ),
                    const Spacer(
                      flex: 3,
                    ),
                    DefultBotton(
                      height: 60,
                      width: 370,
                      text: 'Continue',
                      onPressed: () {
                        Navigator.pushNamed(context, LoginScreen.id);
                      },
                    ),
                    const Spacer(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding buildDot({required index}) {
    return Padding(
      padding: const EdgeInsets.only(top: 65, right: 3, left: 3),
      child: AnimatedContainer(
        duration: kAnimationDuration,
        height: 6,
        width: index == currentIndex ? 20 : 6,
        decoration: BoxDecoration(
          color:
              currentIndex == index ? kPrimaryColor : const Color(0xffD1D1D1),
          borderRadius: BorderRadius.circular(3),
        ),
      ),
    );
  }
}
