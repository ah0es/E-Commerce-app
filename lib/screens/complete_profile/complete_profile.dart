import 'package:ecommerce_app/screens/OTP/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../components/customAppbar.dart';
import '../../components/defult_botton.dart';
import '../../components/error_messages.dart';
import '../../helper/constants.dart';

class CompleteProfile extends StatefulWidget {
  const CompleteProfile({super.key});
  static String id = 'CompleteProfile';
  @override
  State<CompleteProfile> createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
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
                    height: 25,
                  ),
                  const Text(
                    'Complete Profile',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Complete your details or continue\n with social media',
                    style: TextStyle(color: kSecondaryColor, fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 55,
                  ),
                  firstName(),
                  const SizedBox(
                    height: 35,
                  ),
                  lastName(),
                  const SizedBox(
                    height: 35,
                  ),
                  phoneNumber(),
                  const SizedBox(
                    height: 35,
                  ),
                  address(),
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
                        Navigator.pushNamed(context, OtpScreen.id);
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
                  const Text(
                    'By continuing your confirm that you agree\n with our term and Condition',
                    style: TextStyle(color: kTextColor, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextFormField lastName() {
    return TextFormField(
      onChanged: (value) {
        if (value.isNotEmpty) {
          setState(() {
            errorMessage.remove(kLastNamelNullError);
          });
        }
      },
      validator: (value) {
        if (value!.isEmpty && !errorMessage.contains(kLastNamelNullError)) {
          setState(() {
            errorMessage.add(kLastNamelNullError);
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
        labelText: 'Last Name',
        hintText: 'Enter your last name',
        image: 'assets/icons/User.svg',
      ),
    );
  }

  TextFormField phoneNumber() {
    return TextFormField(
      keyboardType: TextInputType.number,
      onChanged: (value) {
        if (value.isNotEmpty) {
          setState(() {
            errorMessage.remove(kPhoneNumberNullError);
          });
        }
      },
      validator: (value) {
        if (value!.isEmpty && !errorMessage.contains(kPhoneNumberNullError)) {
          setState(() {
            errorMessage.add(kPhoneNumberNullError);
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
        labelText: 'Phone Number',
        hintText: 'Enter your phone number',
        image: 'assets/icons/Phone.svg',
      ),
    );
  }

  TextFormField address() {
    return TextFormField(
      onChanged: (value) {
        if (value.isNotEmpty) {
          setState(() {
            errorMessage.remove(kAddressNullError);
          });
        }
      },
      validator: (value) {
        if (value!.isEmpty && !errorMessage.contains(kPhoneNumberNullError)) {
          setState(() {
            errorMessage.add(kPhoneNumberNullError);
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
        labelText: 'Adress',
        hintText: 'Enter your adress',
        image: 'assets/icons/Location point.svg',
      ),
    );
  }

  TextFormField firstName() {
    return TextFormField(
      onChanged: (value) {
        if (value.isNotEmpty) {
          setState(() {
            errorMessage.remove(kNamelNullError);
          });
        }
      },
      validator: (value) {
        if (value!.isEmpty && !errorMessage.contains(kNamelNullError)) {
          setState(() {
            errorMessage.add(kNamelNullError);
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
        labelText: 'First Name',
        hintText: 'Enter your first name',
        image: 'assets/icons/User.svg',
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
        padding: const EdgeInsets.fromLTRB(0, 10, 24.0, 10),
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
