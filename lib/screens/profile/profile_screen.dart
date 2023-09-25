import 'package:ecommerce_app/enums.dart';
import 'package:ecommerce_app/helper/constants.dart';
import 'package:flutter/material.dart';

import '../../components/bottom_navigator_bar.dart';
import 'components/body.dart';

class ProfileScreen extends StatelessWidget {
  static String id = "ProfileScreen";

  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          "Profile",
          style: TextStyle(color: kTextColor),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: const Body(),
      bottomNavigationBar: const BottomnavigationBar(
        selectedMenum: MenuState.profile,
      ),
    );
  }
}
