import 'package:ecommerce_app/screens/cart/cart_screen.dart';
import 'package:ecommerce_app/screens/complete_profile/complete_profile.dart';
import 'package:ecommerce_app/screens/forget_password/forgetpassword.dart';
import 'package:ecommerce_app/screens/product_view/product_view.dart';
import 'package:ecommerce_app/screens/profile/profile_screen.dart';
import 'package:ecommerce_app/screens/sign_in/login._screen.dart';
import 'package:ecommerce_app/screens/login_success/login_success.dart';
import 'package:ecommerce_app/screens/Home/home_screen.dart';
import 'package:ecommerce_app/screens/sign_up/sign_up.dart';
import 'package:ecommerce_app/screens/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/cart_cubit.dart';
import 'screens/OTP/otp_screen.dart';
void main() {
  runApp(const EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(),
      child: MaterialApp(
        theme: ThemeData(fontFamily: 'Muli'),
        routes: {
          LoginScreen.id: (context) => const LoginScreen(),
          Forgetpassword.id: (context) => const Forgetpassword(),
          LoginSuccess.id: (context) => const LoginSuccess(),
          SplashScreen.id: (context) => const SplashScreen(),
          SignUp.id: (context) => const SignUp(),
          CompleteProfile.id: (context) => const CompleteProfile(),
          OtpScreen.id: (context) => const OtpScreen(),
          HomeScreen.id: (context) => const HomeScreen(),
          ProductView.id: (context) => const ProductView(),
          CartScreen.id: (context) => const CartScreen(),
          ProfileScreen.id:(context) => const ProfileScreen(),
        },
        debugShowCheckedModeBanner: false,
        initialRoute: SplashScreen.id,
      ),
    );
  }
}
