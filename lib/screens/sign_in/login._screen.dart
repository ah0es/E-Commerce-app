import 'package:ecommerce_app/screens/forget_password/forgetpassword.dart';
import 'package:ecommerce_app/screens/sign_up/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../components/ask_massege.dart';
import '../../components/customAppbar.dart';
import '../../components/defult_botton.dart';
import '../../components/error_messages.dart';
import '../../components/forgetPassward.dart';
import '../../components/social_media_login.dart';
import '../../helper/constants.dart';
import '../login_success/login_success.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static String id = 'Login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formkey = GlobalKey<FormState>();
  List<String> errorMessage = [];
  bool rememberMe = false;
  // AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      // autovalidateMode: autovalidateMode,
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: CustomAppBar(
            text: 'Sign in',
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    const Text(
                      'Welcom Back',
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'Sign in with your email and password\nor continue with social media',
                      style: TextStyle(color: kSecondaryColor, fontSize: 15),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    emailFormFeild(),
                    const SizedBox(
                      height: 35,
                    ),
                    passwordFormField(),
                    ErrorMessages(errorMessage: errorMessage),
                    const SizedBox(
                      height: 18,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Checkbox(
                          activeColor: kPrimaryColor,
                          value: rememberMe,
                          onChanged: (value) {
                            setState(() {
                              rememberMe = value!;
                            });
                          },
                        ),
                        const Text(
                          'Remember me',
                          style: TextStyle(color: kTextColor),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, Forgetpassword.id);
                          },
                          child: const ForgetPassword(),
                        )
                      ],
                    ),
                    const SizedBox(height: 30),
                    DefultBotton(
                      height: 60,
                      width: 370,
                      text: 'Continue',
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          formkey.currentState!.save();
                          Navigator.pushNamed(context, LoginSuccess.id);
                        }
                        //  else {
                        //   setState(() {
                        //     autovalidateMode = AutovalidateMode.always;
                        //   });
                        // }
                      },
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    const SocialMediaLogin(),
                    const SizedBox(
                      height: 18,
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

  TextFormField passwordFormField() {
    return TextFormField(
        obscureText: true,
        onChanged: (value) {
          if (value.isNotEmpty && errorMessage.contains(kPassNullError)) {
            setState(() {
              errorMessage.remove(kPassNullError);
            });
          } else if (value.length >= 8 &&
              errorMessage.contains(kShortPassError)) {
            setState(() {
              errorMessage.remove(kShortPassError);
            });
          }
        },
        validator: (value) {
          if (value!.isEmpty && !errorMessage.contains(kPassNullError)) {
            setState(() {
              errorMessage.add(kPassNullError);
            });
            return '';
          } else if (value.length < 8 &&
              !errorMessage.contains(kShortPassError)) {
            setState(() {
              errorMessage.add(kShortPassError);
            });
            return '';
          } else {
            if (value.isEmpty) {
              return '';
            }
          }
          return null;
        },
        decoration: decorationInput(
          labelText: 'Password',
          hintText: 'Enter your password',
          image: 'assets/icons/Lock.svg',
        ));
  }

  TextFormField emailFormFeild() {
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
          return '';
        } else if (!emailValidatorRegExp.hasMatch(value) &&
            !errorMessage.contains(kInvalidEmailError)) {
          setState(() {
            errorMessage.add(kInvalidEmailError);
          });
          return '';
        } else {
          if (value.isEmpty) {
            return '';
          }
        }
        return null;
      },
      decoration: decorationInput(
        labelText: 'Email',
        hintText: 'Enter your email',
        image: 'assets/icons/Mail.svg',
      ),
    );
  }

  InputDecoration decorationInput(
      {required String labelText,
      required String hintText,
      required String image}) {
    return InputDecoration(
      floatingLabelBehavior: FloatingLabelBehavior.always,
      labelText: labelText,
      labelStyle: const TextStyle(fontSize: 24),
      contentPadding: const EdgeInsets.only(left: 30, top: 40),
      hintText: hintText,
      suffixIcon: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0.5, 24.0, 0.5),
        child: SvgPicture.asset(
          image,
        ),
      ),
      border: OutlineInputBorder(
        gapPadding: 10,
        borderSide: const BorderSide(color: kTextColor),
        borderRadius: BorderRadius.circular(30),
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
    );
  }
}
