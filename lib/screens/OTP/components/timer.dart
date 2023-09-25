import 'package:flutter/cupertino.dart';

import '../../../helper/constants.dart';

class Buildtimer extends StatelessWidget {
  const Buildtimer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'this code will expaird in',
          style: TextStyle(color: kSecondaryColor, fontSize: 18),
          textAlign: TextAlign.center,
        ),
        TweenAnimationBuilder(
          tween: Tween(begin: 30.0, end: 0),
          duration: const Duration(seconds: 30),
          builder: (context, value, child) => Text(
            '00:${value.toInt()}',
            style: const TextStyle(color: kPrimaryColor, fontSize: 18),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}