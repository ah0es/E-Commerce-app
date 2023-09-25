import 'package:ecommerce_app/components/customAppbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../components/defult_botton.dart';
import '../../components/error_messages.dart';
import '../../components/social_media_login.dart';
import '../../helper/constants.dart';
import '../complete_profile/complete_profile.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});
  static String id = 'Sign Up';

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  List<String> errorMessage = [];
  String? email, password;
  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: CustomAppBar(text: 'Sign Up'),
        ),
        body: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    'Register Account',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Complete your details or continue\n with social media',
                    style: TextStyle(color: kSecondaryColor, fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  emailFormFeild(),
                  const SizedBox(
                    height: 35,
                  ),
                  passwordFormField(),
                  const SizedBox(
                    height: 35,
                  ),
                  confirmpasswordFormField(),
                  ErrorMessages(errorMessage: errorMessage),
                  const SizedBox(
                    height: 35,
                  ),
                  DefultBotton(
                    height: 60,
                    width: 370,
                    text: 'Continue',
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        formkey.currentState!.save();
                        Navigator.pushNamed(context, CompleteProfile.id);
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
                    height: 20,
                  ),
                  const Text(
                    'By continuing your confirm that you agree\n with our term and Condition',
                    style: TextStyle(color: kTextColor, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ],
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
          password = value;
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

  TextFormField confirmpasswordFormField() {
    return TextFormField(
        obscureText: true,
        onChanged: (value) {
          if (value == password && errorMessage.contains(kMatchPassError)) {
            setState(() {
              errorMessage.remove(kMatchPassError);
            });
          }
        },
        validator: (value) {
          if (value != password && !errorMessage.contains(kMatchPassError)) {
            setState(() {
              errorMessage.add(kMatchPassError);
            });
            return '';
          } else {
            if (value!.isEmpty) {
              return '';
            }
          }
          return null;
        },
        decoration: decorationInput(
          labelText: 'Confirm Password',
          hintText: 'Re-enter your password',
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
