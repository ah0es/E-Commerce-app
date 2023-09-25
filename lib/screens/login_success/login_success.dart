import 'package:ecommerce_app/components/defult_botton.dart';
import 'package:flutter/material.dart';
import '../../components/customAppbar.dart';
import '../../models/size_config.dart';
import '../Home/home_screen.dart';

class LoginSuccess extends StatelessWidget {
  const LoginSuccess({super.key});
  static String id = 'LoginSuccess';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(
          text: 'Login Success',
        ), // Use the custom AppBar widget
      ),
      body: Column(
        children: [
          SizedBox(height: SizeConfig.screenHeight * 0.04),
          Image.asset(
            "assets/images/success.png",
            height: SizeConfig.screenHeight * 0.4,
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.08),
          const Text(
            "Login Success",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: SizeConfig.screenWidth * 0.6,
            child: DefultBotton(
              height: 60,
              width: 150,
              text: "Back to home",
              onPressed: () {
                Navigator.pushNamed(context, HomeScreen.id);
              },
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  getProportionateScreenWidth(int i) {}
}

class DefaultButton {}
