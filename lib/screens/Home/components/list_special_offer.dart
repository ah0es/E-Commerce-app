import 'package:flutter/cupertino.dart';

import 'special_offer.dart';

class ListSpecialOffer extends StatelessWidget {
  const ListSpecialOffer({
    super.key,
    required this.categories,
  });

  final List<Map<String, dynamic>> categories;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          categories.length,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SpecialOfferCard(
              image: categories[index]['image']!,
              categoryName: categories[index]['categoryName']!,
              numOfBrand: categories[index]['numOfBrand']!,
            ),
          ),
        ),
      ),
    );
  }
}
