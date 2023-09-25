import 'package:ecommerce_app/cubit/cart_cubit.dart';
import 'package:ecommerce_app/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../enums.dart';
import '../helper/constants.dart';
import '../screens/Home/home_screen.dart';

class BottomnavigationBar extends StatelessWidget {
  const BottomnavigationBar({
    super.key,
    required this.selectedMenum,
  });
  final MenuState selectedMenum;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, -15),
              blurRadius: 10,
              color: const Color(0xffDADADA).withOpacity(0.15),
            )
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () {
              if (BlocProvider.of<CartCubit>(context).click != HomeScreen.id) {
                Navigator.pushNamed(context, HomeScreen.id);

                BlocProvider.of<CartCubit>(context).click = HomeScreen.id;
              }
            },
            icon: SvgPicture.asset(
              'assets/icons/Shop Icon.svg',
              color:
                  MenuState.home == selectedMenum ? kPrimaryColor : kTextColor,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/Heart Icon.svg',
              color: MenuState.favourite == selectedMenum
                  ? kPrimaryColor
                  : kTextColor,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/Chat bubble Icon.svg',
              color: MenuState.message == selectedMenum
                  ? kPrimaryColor
                  : kTextColor,
            ),
          ),
          IconButton(
            onPressed: () {
              if (BlocProvider.of<CartCubit>(context).click !=
                  ProfileScreen.id) {
                Navigator.pushNamed(context, ProfileScreen.id);

                BlocProvider.of<CartCubit>(context).click = ProfileScreen.id;
              }
            },
            icon: SvgPicture.asset(
              'assets/icons/User.svg',
              color: MenuState.profile == selectedMenum
                  ? kPrimaryColor
                  : kTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
