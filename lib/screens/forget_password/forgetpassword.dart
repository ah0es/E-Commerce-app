import 'package:ecommerce_app/components/customAppbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../components/ask_massege.dart';
import '../../components/defult_botton.dart';
import '../../components/error_messages.dart';
import '../../helper/constants.dart';
import '../sign_up/sign_up.dart';

class Forgetpassword extends StatefulWidget {
  const Forgetpassword({super.key});
  static String id = 'Forgetpassword';

  @override
  State<Forgetpassword> createState() => _ForgetpasswordState();
}

class _ForgetpasswordState extends State<Forgetpassword> {
  List<String> errorMessage = [];
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(text: 'Forgot password'),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Form(
              key: formkey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Forgot Password',
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'Please enter your email and we will send\n you a link to return to your email',
                      style: TextStyle(color: kSecondaryColor, fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 150,
                    ),
                    emailFormzfield(),
                    const SizedBox(
                      height: 15,
                    ),
                    ErrorMessages(
                      errorMessage: errorMessage,
                    ),
                    const SizedBox(
                      height: 130,
                    ),
                    DefultBotton(
                      height: 60,
                      width: 370,
                      text: 'Continue',
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          formkey.currentState!.save();
                        }
                      },
                    ),
                    const SizedBox(
                      height: 150,
                    ),
                    AskingMassege(
                      text1: 'Don\'t have an account?',
                      text2: 'Sign Up',
                      onTap: () {
                        Navigator.pushNamed(context, SignUp.id);
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextFormField emailFormzfield() {
    return TextFormField(
      onChanged: (value) {
        if (value.isNotEmpty && errorMessage.contains(kEmailNullError)) {
          setState(() {
            errorMessage.remove(kEmailNullError);
          });
        } else if (emailValidatorRegExp.hasMatch(value) &&
            errorMessage.contains(kInvalidEmailError)) {
          setState(() {
            errorMessage.remove(kInvalidEmailError);
          });
        }
      },
      validator: (value) {
        if (value!.isEmpty && !errorMessage.contains(kEmailNullError)) {
          setState(() {
            errorMessage.add(kEmailNullError);
          });
        } else if (!emailValidatorRegExp.hasMatch(value) &&
            !errorMessage.contains(kInvalidEmailError)) {
          setState(() {
            errorMessage.add(kInvalidEmailError);
          });
        } else {
          if (value.isEmpty) {
            return '';
          }
        }
        return null;
      },
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelText: 'Email',
        labelStyle: const TextStyle(fontSize: 24),
        contentPadding: const EdgeInsets.only(left: 30, top: 40),
        hintText: 'Enter your email',
        suffixIcon: Padding(
          padding: const EdgeInsets.fromLTRB(0, 1, 24.0, 1),
          child: SvgPicture.asset(
            'assets/icons/Mail.svg',
          ),
        ),
        enabledBorder: OutlineInputBorder(
          gapPadding: 10,
          borderSide: const BorderSide(color: kTextColor),
          borderRadius: BorderRadius.circular(30),
        ),
        focusedBorder: OutlineInputBorder(
          gapPadding: 10,
          borderSide: const BorderSide(color: kTextColor),
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
