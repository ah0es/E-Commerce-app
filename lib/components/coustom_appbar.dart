import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../helper/constants.dart';
import '../models/size_config.dart';

class CostomAppBarViewProduct extends StatelessWidget {
  const CostomAppBarViewProduct({
    super.key,
    required this.product,
  });
  final dynamic product;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          top: SizeConfig.getProportionateScreenHeight(15),
          left: SizeConfig.getProportionateScreenWidth(24),
          right: SizeConfig.getProportionateScreenWidth(24),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              borderRadius: BorderRadius.circular(
                  SizeConfig.getProportionateScreenWidth(20)),
              child: Container(
                padding:
                    EdgeInsets.all(SizeConfig.getProportionateScreenWidth(9)),
                height: SizeConfig.getProportionateScreenHeight(40),
                width: SizeConfig.getProportionateScreenWidth(40),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffFEFFFF),
                ),
                child: SvgPicture.asset(
                  'assets/icons/Back ICon.svg',
                  color: kTextColor,
                ),
              ),
            ),
            Container(
              height: SizeConfig.getProportionateScreenHeight(27),
              width: SizeConfig.getProportionateScreenWidth(60),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    SizeConfig.getProportionateScreenWidth(16)),
                color: const Color(0xffFEFFFF),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: SizeConfig.getProportionateScreenWidth(11),
                  ),
                  Text(
                    "${product.rating}",
                    style: const TextStyle(
                      color: kTextColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.getProportionateScreenWidth(5),
                  ),
                  SvgPicture.asset('assets/icons/Star Icon.svg'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
