import 'package:ecommerce_app/screens/cart/cart_screen.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/bottom_navigator_bar.dart';
import '../../cubit/cart_cubit.dart';
import '../../enums.dart';
import '../../models/Product.dart';
import 'components/category_list.dart';
import 'components/discount_card.dart';
import 'components/head_text.dart';
import 'components/icon_with_counter.dart';
import 'components/list_special_offer.dart';
import 'components/popular_product_card.dart';
import 'components/search_feild.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static String id = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> categories = const [
    {
      'image': 'assets/images/Image Banner 2.png',
      'categoryName': 'SmartPhone',
      'numOfBrand': 16,
    },
    {
      'image': 'assets/images/Image Banner 3.png',
      'categoryName': 'Fashion',
      'numOfBrand': 17,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomnavigationBar(
        selectedMenum: MenuState.home,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SearchTextFeild(),
                    BlocBuilder<CartCubit, CartState>(
                      builder: (context, state) {
                        return IconWithCounter(
                          image: 'assets/icons/Cart Icon.svg',
                          counter: BlocProvider.of<CartCubit>(context).item,
                          onTap: () {
                            Navigator.pushNamed(context, CartScreen.id);
                          },
                        );
                      },
                    ),
                    IconWithCounter(
                      image: 'assets/icons/Bell.svg',
                      counter: 0,
                      onTap: () {},
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const DiscountCard(),
                const SizedBox(
                  height: 30,
                ),
                const CategoryList(),
                const SizedBox(
                  height: 15,
                ),
                const HeadText(
                  text1: 'Special For you',
                  text2: 'See More',
                ),
                const SizedBox(
                  height: 15,
                ),
                ListSpecialOffer(categories: categories),
                const SizedBox(
                  height: 15,
                ),
                const HeadText(
                  text1: 'Popular Product',
                  text2: 'See More',
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 300,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: demoProducts.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: PopularPorductCard(
                          product: demoProducts[index],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
