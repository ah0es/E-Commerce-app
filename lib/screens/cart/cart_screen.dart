import 'package:ecommerce_app/cubit/cart_cubit.dart';
import 'package:ecommerce_app/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../components/defult_botton.dart';
import '../../helper/constants.dart';
import 'components/cart_appbar.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});
  static String id = 'CartScreen';

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 27,
          bottom: 27,
        ),
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          color: const Color.fromARGB(255, 252, 252, 253),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, -15),
              blurRadius: 10,
              color: const Color(0xffDADADA).withOpacity(0.15),
            ),
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 35),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: kSecondaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: SvgPicture.asset(
                      'assets/icons/receipt.svg',
                      color: kPrimaryColor,
                    ),
                  ),
                  const Spacer(),
                  const Text('Add voucher code  '),
                  SvgPicture.asset(
                    'assets/icons/arrow_right.svg',
                    color: kTextColor,
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'total:',
                      style: TextStyle(color: kTextColor, fontSize: 16),
                    ),
                    Text(
                      '\$${BlocProvider.of<CartCubit>(context).total.toStringAsFixed(3)}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
                const Spacer(),
                DefultBotton(
                  text: 'Check Out',
                  width: 200,
                  height: 60,
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(72),
          child: CartAppbar(
            items: BlocProvider.of<CartCubit>(context).item,
          )),
      body: Column(
        children: [
          const SizedBox(
            height: 24,
          ),
          SizedBox(
            height: 493,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                itemCount: demoCarts.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Dismissible(
                      key: ValueKey<int>(demoCarts[index].product.id),
                      onDismissed: (direction) {
                        setState(() {
                          BlocProvider.of<CartCubit>(context).total -=
                              demoCarts[index].product.price;
                          demoCarts.removeAt(index);
                        });

                        BlocProvider.of<CartCubit>(context).item -= 1;
                        BlocProvider.of<CartCubit>(context).cartItems();
                      },
                      direction: DismissDirection.endToStart,
                      background: Container(
                        padding: const EdgeInsets.only(right: 15),
                        decoration: BoxDecoration(
                          color: const Color(0xffFFE6E6),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(children: [
                          const Spacer(),
                          SvgPicture.asset('assets/icons/Trash.svg')
                        ]),
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            height: 110,
                            width: 110,
                            decoration: BoxDecoration(
                              color: kSecondaryColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child:
                                Image.asset(demoCarts[index].product.images[0]),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                demoCarts[index].product.title,
                                maxLines: 2,
                                style: const TextStyle(fontSize: 13),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text(
                                    '\$${demoCarts[index].product.price}',
                                    style: const TextStyle(
                                      color: kPrimaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    ' x ${demoCarts[index].numOfItem}',
                                    style: const TextStyle(color: kTextColor),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
