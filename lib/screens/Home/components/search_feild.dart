
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../helper/constants.dart';

class SearchTextFeild extends StatelessWidget {
  const SearchTextFeild({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 55,
      decoration: BoxDecoration(
        color: kSecondaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        decoration: InputDecoration(
            hintText: 'Search Product',
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: SvgPicture.asset('assets/icons/Search Icon.svg'),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 20)),
      ),
    );
  }
}
