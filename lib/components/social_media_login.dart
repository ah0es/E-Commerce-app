
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialMediaLogin extends StatelessWidget {
  const SocialMediaLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: const Color(0xffEEEFF1),
          child: SvgPicture.asset(
            'assets/icons/google-icon.svg',
            height: 20,
            width: 20,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        CircleAvatar(
            backgroundColor: const Color(0xffEEEFF1),
            child: SvgPicture.asset(
                'assets/icons/facebook-2.svg')),
        const SizedBox(
          width: 20,
        ),
        CircleAvatar(
            backgroundColor: const Color(0xffEEEFF1),
            child:
                SvgPicture.asset('assets/icons/twitter.svg')),
      ],
    );
  }
}
