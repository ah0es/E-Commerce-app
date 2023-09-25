import 'package:flutter/cupertino.dart';

import '../helper/constants.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const DecoratedBox(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color:
                kTextColor, // Adjust the line color as needed
            width:
                1, // Adjust the line thickness as needed
          ),
        ),
      ),
      child: Text(
        'Forget Password?',
        style: TextStyle(
            fontSize:
                15.0, // Adjust the font size as needed
            color:
                kTextColor // Adjust the font weight as needed
            ),
      ),
    );
  }
}
