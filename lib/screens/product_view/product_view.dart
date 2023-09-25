import 'package:ecommerce_app/helper/constants.dart';
import 'package:ecommerce_app/models/cart_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../components/circel_elevated_botton.dart';

import '../../components/coustom_appbar.dart';

import '../../components/defult_botton.dart';
import '../../cubit/cart_cubit.dart';
import '../../helper/show_snakbar.dart';
import '../../models/size_config.dart';
// Import your SizeConfig file here

class ProductView extends StatefulWidget {
  const ProductView({Key? key}) : super(key: key);
  static String id = 'ProductView';

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  int selectedImage = 0, selectedColor = 0, nomOfItem = 1, item = 0;
  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as dynamic;
    SizeConfig().init(context); // Initialize SizeConfig

    return Scaffold(
      backgroundColor: const Color(0xffF4F4FA),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(SizeConfig.getProportionateScreenHeight(
            200)), // Replace YourAppBarHeight with the desired height
        child: CostomAppBarViewProduct(
          product: product,
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: SizeConfig.getProportionateScreenHeight(243),
            width: SizeConfig.getProportionateScreenWidth(243),
            child: Image.asset(product.images[selectedImage]),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              product.images.length,
              (index) => buildSmallView(index, product),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: SizeConfig.getProportionateScreenHeight(15),
                    left: SizeConfig.getProportionateScreenWidth(15),
                  ),
                  child: Text(
                    product.title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding: EdgeInsets.all(
                      SizeConfig.getProportionateScreenWidth(12),
                    ),
                    height: SizeConfig.getProportionateScreenHeight(40),
                    width: SizeConfig.getProportionateScreenWidth(80),
                    decoration: BoxDecoration(
                      color: kPrimaryColor.withOpacity(0.15),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        bottomLeft: Radius.circular(16),
                      ),
                    ),
                    child: SvgPicture.asset(
                      'assets/icons/Heart Icon_2.svg',
                      color: product.isFavourite
                          ? Colors.red
                          : const Color(0xffDBDEE4),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: SizeConfig.getProportionateScreenWidth(20),
                    right: SizeConfig.getProportionateScreenWidth(64),
                    top: SizeConfig.getProportionateScreenHeight(5),
                  ),
                  child: Text(
                    product.description,
                    style: const TextStyle(color: kTextColor),
                    maxLines: 3,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    const Text(
                      'See More Detail',
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    SvgPicture.asset(
                      'assets/icons/arrow_right.svg',
                      color: kPrimaryColor,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                    color: Color(0xffF4F4FA),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.getProportionateScreenWidth(8),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const SizedBox(
                              height: 85,
                            ),
                            ...List.generate(
                              product.colors.length,
                              (index) => buildColorItem(index, product),
                            ),
                            const Spacer(),
                            CircularElevatedButton(
                              icon: Icons.remove,
                              onPressed: () {
                                setState(() {
                                  if (nomOfItem > 1) {
                                    nomOfItem--;
                                  }
                                });
                              },
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              '$nomOfItem',
                              style: const TextStyle(fontSize: 17),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            CircularElevatedButton(
                              icon: Icons.add,
                              onPressed: () {
                                setState(() {
                                  nomOfItem++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              left: SizeConfig.getProportionateScreenWidth(80),
              right: SizeConfig.getProportionateScreenWidth(80),
              top: SizeConfig.getProportionateScreenHeight(27),
              bottom: SizeConfig.getProportionateScreenHeight(27),
            ),
            width: double.infinity,
            height: SizeConfig.getProportionateScreenHeight(108),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
              color: Colors.white,
            ),
            child: DefultBotton(
              text: 'Add to Cart',
              height: SizeConfig.getProportionateScreenHeight(60),
              width: 0,
              onPressed: () {
                if (demoCarts.any((cart) => cart.product.id == product.id) ==
                    false) {
                  demoCarts.add(
                    Cart(product: product, numOfItem: nomOfItem),
                  );
                  BlocProvider.of<CartCubit>(context).total += product.price;
                  BlocProvider.of<CartCubit>(context).item += 1;
                  BlocProvider.of<CartCubit>(context).cartItems();
                  showSnakBar(context, message: 'Add Successfly');
                }
              },
            ),
          )
        ],
      ),
    );
  }

  GestureDetector buildColorItem(int index, product) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedColor = index;
        });
      },
      child: Padding(
        padding: EdgeInsets.only(
          left: SizeConfig.getProportionateScreenWidth(15),
        ),
        child: CircleAvatar(
          radius: SizeConfig.getProportionateScreenWidth(22),
          backgroundColor:
              selectedColor == index ? kPrimaryColor : Colors.transparent,
          child: CircleAvatar(
            radius: SizeConfig.getProportionateScreenWidth(20),
            backgroundColor: Color(product.colors[index].value),
          ),
        ),
      ),
    );
  }

  GestureDetector buildSmallView(int index, product) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedImage = index;
        });
      },
      child: Container(
        margin: EdgeInsets.only(
          left: SizeConfig.getProportionateScreenWidth(10),
        ),
        height: SizeConfig.getProportionateScreenHeight(55),
        width: SizeConfig.getProportionateScreenWidth(55),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            SizeConfig.getProportionateScreenWidth(15),
          ),
          color: Colors.white,
          border: Border.all(
            color: selectedImage == index ? kPrimaryColor : Colors.white,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(
            SizeConfig.getProportionateScreenWidth(8),
          ),
          child: Image.asset(
            product.images[index],
          ),
        ),
      ),
    );
  }
}
