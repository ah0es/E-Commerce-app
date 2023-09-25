import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import '../../../helper/constants.dart';

class CartAppbar extends StatefulWidget {
  const CartAppbar({super.key,  this.items=0});
  final int items ;
  @override
  State<CartAppbar> createState() => _CartAppbarState();
}

class _CartAppbarState extends State<CartAppbar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 16, left: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: const EdgeInsets.all(9),
                height: 40,
                width: 40,
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
            const Spacer(),
            Column(
              children: [
                const Text(
                  'Your Cart',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  '${widget.items} item',
                  style: const TextStyle(color: kTextColor),
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
