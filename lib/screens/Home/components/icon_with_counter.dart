import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../helper/constants.dart';

class IconWithCounter extends StatelessWidget {
  const IconWithCounter({
    super.key,
    required this.image,
    required this.counter,required this.onTap,
  });
  final String image;
  final int counter;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(50),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: kSecondaryColor.withOpacity(0.1),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: SvgPicture.asset(image),
            ),
          ),
          if (counter > 0)
            Positioned(
              right: 0,
              top: -3,
              child: Container(
                height: 18,
                width: 20,
                decoration: const BoxDecoration(
                  color: Color(0xffFA4048),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    '$counter',
                    style: const TextStyle(fontSize: 11, color: Colors.white),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
