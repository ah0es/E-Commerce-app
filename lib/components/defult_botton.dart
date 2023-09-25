import 'package:flutter/material.dart';

import '../helper/constants.dart';

class DefultBotton extends StatelessWidget {
  const DefultBotton(
      {super.key,
      required this.text,
      this.onPressed,
      required this.width,
      required this.height});
  final String text;
  final double width, height;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        backgroundColor: kPrimaryColor,
        minimumSize: Size(width, height),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 19, color: kPrimaryLightColor),
      ),
    );
  }
}
