import 'package:flutter/cupertino.dart';

import '../../../helper/constants.dart';



class SplashContent extends StatelessWidget {
  const SplashContent({
    Key? key,
    this.text,
    this.image,
  }) : super(key: key);
  final String? image, text;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 50),
        const Text(
          'TOKOTO',
          style: TextStyle(
              color: kPrimaryColor, fontSize: 40, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        Text(
          text!,
          style: const TextStyle(
            color: Color(0xffABABAB),
            fontSize: 18,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 50),
        Image.asset(
          image!,
          height: 300,
          width: 300,
        ),
      ],
    );
  }
}
