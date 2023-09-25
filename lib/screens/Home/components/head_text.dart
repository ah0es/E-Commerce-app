import 'package:flutter/cupertino.dart';

import '../../../helper/constants.dart';

class HeadText extends StatelessWidget {
  const HeadText({
    super.key,
    required this.text1,
    required this.text2,
  });
  final String text1, text2;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text1,
          style: const TextStyle(
            fontSize: 19,
          ),
        ),
        Text(
          text2,
          style: const TextStyle(
            color: kTextColor,
          ),
        ),
      ],
    );
  }
}
