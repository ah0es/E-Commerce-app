import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../helper/constants.dart';
import '../../../models/Product.dart';
import '../../product_view/product_view.dart';

class PopularPorductCard extends StatefulWidget {
  const PopularPorductCard({
    super.key,
    required this.product,
  });
  final Product product;

  @override
  State<PopularPorductCard> createState() => _PopularPorductCardState();
}

class _PopularPorductCardState extends State<PopularPorductCard> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, ProductView.id,
                  arguments: widget.product);
            },
            borderRadius: BorderRadius.circular(16),
            child: Container(
              padding: const EdgeInsets.all(10),
              height: 140,
              width: 140,
              decoration: BoxDecoration(
                color: kSecondaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Image.asset(widget.product.images[0]),
            ),
          ),
          Text(
            widget.product.title,
            maxLines: 2,
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$${widget.product.price}',
                style: const TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    isFavorite = !isFavorite;
                    widget.product.isFavourite = isFavorite;
                  });
                },
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  height: 28,
                  width: 28,
                  decoration: BoxDecoration(
                    color: isFavorite
                        ? kPrimaryColor.withOpacity(0.15)
                        : kSecondaryColor.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(
                    'assets/icons/Heart Icon_2.svg',
                    color: isFavorite
                        ? const Color(0xFFFF4848)
                        : const Color(0xFFDBDEE4),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
