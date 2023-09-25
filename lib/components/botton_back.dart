import 'package:flutter/material.dart';

import '../helper/constants.dart';

class BottonBack extends StatelessWidget {
  const BottonBack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 120,
        width: 120,
        decoration: BoxDecoration(
          color: kSecondaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Image.asset('assets/images/ps4_console_blue_1.png'),
      ),
    );
  }
}