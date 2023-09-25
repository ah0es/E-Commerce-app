import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../../helper/constants.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.index,
  });

  final int index;
  final List<Map<String, String>> category = const [
    {'icon': 'assets/icons/Flash Icon.svg', 'test': 'Flash\nDeal'},
    {'icon': 'assets/icons/Bill Icon.svg', 'test': 'Bill'},
    {'icon': 'assets/icons/Game Icon.svg', 'test': 'Game'},
    {'icon': 'assets/icons/Gift Icon.svg', 'test': 'Daily\nGift'},
    {'icon': 'assets/icons/Discover.svg', 'test': 'Discover'},
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 55,
          width: 55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: const Color(0xffFDE8DC),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: SvgPicture.asset(category[index]['icon']!),
          ),
        ),
        Text(
          category[index]['test']!,
          style: const TextStyle(
            color: kTextColor,
          ),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
