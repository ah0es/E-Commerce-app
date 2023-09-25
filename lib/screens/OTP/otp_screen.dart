import 'package:ecommerce_app/components/customAppbar.dart';
import 'package:ecommerce_app/components/defult_botton.dart';
import 'package:flutter/material.dart';

import '../../helper/constants.dart';
import 'components/otp_form.dart';
import 'components/timer.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});
  static String id = 'otpScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(text: 'OTP Verification'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'OTP Verification',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'we sent your code ro +20 11249***',
                  style: TextStyle(color: kSecondaryColor, fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                const Buildtimer(),
                const SizedBox(
                  height: 90,
                ),
                const OtpForm(),
                const SizedBox(
                  height: 170,
                ),
                DefultBotton(
                  text: 'Continue',
                  width: 370,
                  height: 60,
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 170,
                ),
                const Text(
                  'Resend OTP Colde',
                  style: TextStyle(
                    color: kTextColor,
                    fontSize: 16,
                    decoration: TextDecoration.underline,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}






