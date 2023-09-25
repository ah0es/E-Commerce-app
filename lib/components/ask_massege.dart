import 'package:flutter/cupertino.dart';

import '../helper/constants.dart';

class AskingMassege extends StatelessWidget {
  const AskingMassege({
    super.key,
    required this.text1,
    @required this.text2,
    @required this.onTap,
  });
  final String text1;
  final String? text2;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text1,
          style: const TextStyle(color: kTextColor, fontSize: 19),
          textAlign: TextAlign.center,
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            text2 ?? '',
            style: const TextStyle(color: kPrimaryColor, fontSize: 19),
          ),
        ),
      ],
    );
  }
}
