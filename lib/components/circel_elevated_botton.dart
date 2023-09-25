import 'package:flutter/material.dart';

import '../helper/constants.dart';
import '../models/size_config.dart';

class CircularElevatedButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const CircularElevatedButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.getProportionateScreenHeight(40),
      width: SizeConfig.getProportionateScreenWidth(40),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: Colors.white,
          padding: EdgeInsets.zero,
        ),
        onPressed: onPressed,
        child: Icon(
          icon,
          size: SizeConfig.getProportionateScreenWidth(20),
          color: kTextColor,
        ),
      ),
    );
  }
}
